
// OpenCL utility layer include
#include "cmdlineparser.h"
#include "xcl2.hpp"
#include <fcntl.h>
#include <fstream>
#include <iomanip>
#include <iosfwd>
#include <iostream>
#include <unistd.h>
#include <vector>

#include <cuda_runtime.h>
#include <helper_cuda.h>
#include <helper_functions.h> // helper for shared that are common to CUDA Samples

size_t max_buffer = 16 * 1024 * 1024;
size_t min_buffer = 4 * 1024;
size_t max_size = 128 * 1024 * 1024; // 128MB

__global__ void vectorCopyGPU(int *a, int *c, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N)
    {
        c[idx] = a[idx] + 1;
    }
}

// implicit transfer to GPU device memory from FPGA
void p2p_fpga_to_gpu(cl::Context context,
                     cl::CommandQueue q,
                     cl::Program program,
                     std::vector<int, aligned_allocator<int>> *source_input_A)
{
    int err;
    size_t vector_size_bytes = sizeof(int) * max_buffer;

    // Instantiate FPGA copy kernel
    cl::Kernel krnl;
    cl_mem_ext_ptr_t outExt;
    outExt = {XCL_MEM_EXT_P2P_BUFFER, nullptr, 0};

    OCL_CHECK(err, cl::Buffer input_a(context, CL_MEM_READ_ONLY, vector_size_bytes, nullptr, &err));
    OCL_CHECK(err,
              cl::Buffer p2pBo(context, CL_MEM_WRITE_ONLY | CL_MEM_EXT_PTR_XILINX, vector_size_bytes, &outExt, &err));
    OCL_CHECK(err, krnl = cl::Kernel(program, "bandwidth", &err));

    int *inputPtr = (int *)q.enqueueMapBuffer(input_a, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, vector_size_bytes,
                                              nullptr, nullptr, &err);

    for (uint32_t i = 0; i < max_buffer; i++)
    {
        inputPtr[i] = i % 1024; // source_input_A[i];
    }
    q.finish();

    // Set the Kernel Arguments
    OCL_CHECK(err, err = krnl.setArg(0, input_a));
    OCL_CHECK(err, err = krnl.setArg(1, p2pBo));
    OCL_CHECK(err, err = krnl.setArg(2, max_buffer));

    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({input_a}, 0 /* 0 means from host*/));
    q.finish();

    // Launch the Kernel
    OCL_CHECK(err, err = q.enqueueTask(krnl));
    q.finish();

    std::cout << "\nMap P2P device buffers to host access pointers\n"
              << std::endl;

    void *p2pPtr1 = nullptr;
    cudaMallocManaged(&p2pPtr1, vector_size_bytes);
    p2pPtr1 = q.enqueueMapBuffer(p2pBo,                      // buffer
                                 CL_TRUE,                    // blocking call
                                 CL_MAP_READ | CL_MAP_WRITE, // Indicates we will be writing
                                 0,                          // buffer offset
                                 vector_size_bytes,          // size in bytes
                                 nullptr, nullptr,
                                 &err); // error code
    q.finish();

    std::cout << "Start P2P Read of various buffer sizes from device buffers to GPU\n"
              << std::endl;

    size_t bufsize = min_buffer;
    for (size_t m = 0; m < 1; m++)
    // for (size_t bufsize = min_buffer; bufsize <= vector_size_bytes; bufsize *= 2)
    {
        std::string size_str = xcl::convert_size(bufsize);

        int iter = max_size / bufsize;
        if (xcl::is_emulation())
        {
            iter = 2; // Reducing iteration to run faster in emulation flow.
        }

        // allocate CUDA host and device memory
        int *out = (int *)malloc(bufsize);
        int *d_out;
        cudaMalloc(&d_out, bufsize);
        int *out1 = (int *)malloc(bufsize);
        int *d_out1;
        cudaMalloc(&d_out1, bufsize);

        // comapre cuda managed input buffer
        int *in = (int *)malloc(bufsize);
        for (int i = 0; i < 10; i++)
        {
            in[i] = i;
        }
        int *d_in;
        cudaMalloc(&d_in, bufsize);

        std::chrono::high_resolution_clock::time_point p2pStart = std::chrono::high_resolution_clock::now();
        for (int i = 0; i < 1; i++)
        // for (int i = 0; i < iter; i++)
        {
            // invoke CUDA kernel (copy from one buffer to another)
            int elem = bufsize / sizeof(int);
            dim3 block(256);
            dim3 grid((unsigned int)ceil(elem / (float)block.x));

            // vectorCopyGPU<<<grid, block>>>((int *)p2pPtr1, d_out, elem);
            // cudaMemcpy(out, d_out, bufsize, cudaMemcpyDeviceToHost);
            // printf("\n===== iter %d ===== \n", i);
            // for (int k = 0; k < 5; k++)
            // {
            //     printf("FPGA kernel input buf %d \n", inputPtr[k]);
            //     printf("FPGA output buffer %d\n", ((int *)p2pPtr1)[k]);
            //     printf("GPU output buffer %d\n", out[k]);
            // }

            // compare CUDA managed input buffer
            printf("\n===== cuda buffer iter %d ===== \n", i);
            cudaMemcpy(d_in, in, bufsize, cudaMemcpyHostToDevice);
            vectorCopyGPU<<<grid, block>>>(d_in, d_out1, elem);
            cudaMemcpy(out1, d_out1, bufsize, cudaMemcpyDeviceToHost);
            for (int k = 0; k < 5; k++)
            {
                printf("CUDA input buffer %d\n", in[k]);
                printf("GPU output buffer %d\n", out1[k]);
            }
        }

        std::chrono::high_resolution_clock::time_point p2pEnd = std::chrono::high_resolution_clock::now();
        cl_ulong p2pTime = std::chrono::duration_cast<std::chrono::microseconds>(p2pEnd - p2pStart).count();
        ;
        double dnsduration = (double)p2pTime;
        double dsduration = dnsduration / ((double)1000000);
        double gbpersec = (iter * bufsize / dsduration) / ((double)1024 * 1024 * 1024);
        std::cout << "Buffer = " << size_str << " Iterations = " << iter << " Throughput = " << std::setprecision(2)
                  << std::fixed << gbpersec << "GB/s\n";

        // Free memory
        cudaFree(d_out);
        cudaFree(d_out1);
        cudaFree(d_in);
        free(out);
        free(out1);
        free(in);
    }
}

// implicit transfer to GPU device memory from SSD
int p2p_ssd_to_gpu()
{
    int gpu_n;
    checkCudaErrors(cudaGetDeviceCount(&gpu_n));

    // Query device properties
    cudaDeviceProp prop[64];
    // int gpuid[2]; // we want to find the first two GPU's that can support P2P

    for (int i = 0; i < gpu_n; i++)
    {
        checkCudaErrors(cudaGetDeviceProperties(&prop[i], i));
    }
    // Check possibility for peer access
    printf("\nChecking GPU(s) for support of peer to peer memory access...\n");

    int can_access_peer;
    int p2pCapableGPUs[2]; // We take only 1 pair of P2P capable GPUs
    p2pCapableGPUs[0] = p2pCapableGPUs[1] = -1;

    // Show all the combinations of supported P2P GPUs
    for (int i = 0; i < gpu_n; i++)
    {
        for (int j = 0; j < gpu_n; j++)
        {
            if (i == j)
            {
                continue;
            }
            checkCudaErrors(cudaDeviceCanAccessPeer(&can_access_peer, i, j));
            printf("> Peer access from %s (GPU%d) -> %s (GPU%d) : %s\n", prop[i].name,
                   i, prop[j].name, j, can_access_peer ? "Yes" : "No");
            if (can_access_peer && p2pCapableGPUs[0] == -1)
            {
                p2pCapableGPUs[0] = i;
                p2pCapableGPUs[1] = j;
            }
        }
    }

    if (p2pCapableGPUs[0] == -1 || p2pCapableGPUs[1] == -1)
    {
        printf(
            "Peer to Peer access is not available amongst GPUs in the system, "
            "waiving test.\n");

        exit(EXIT_WAIVED);
    }

    // Use first pair of p2p capable GPUs detected.
    // gpuid[0] = p2pCapableGPUs[0];
    return 1;
}

int p2p_ssd_to_fpga(int &nvmeFd,
                    cl::Context context,
                    cl::CommandQueue q,
                    cl::Program program,
                    std::vector<int, aligned_allocator<int>> source_input_A)
{

    int err;
    int ret = 0;
    size_t vector_size_bytes = sizeof(int) * max_buffer;

    cl::Kernel krnl;
    // Allocate Buffer in Global Memory
    cl_mem_ext_ptr_t outExt;
    outExt = {XCL_MEM_EXT_P2P_BUFFER, nullptr, 0};

    OCL_CHECK(err, cl::Buffer input_a(context, CL_MEM_READ_ONLY, vector_size_bytes, nullptr, &err));
    OCL_CHECK(err,
              cl::Buffer p2pBo(context, CL_MEM_WRITE_ONLY | CL_MEM_EXT_PTR_XILINX, vector_size_bytes, &outExt, &err));
    OCL_CHECK(err, krnl = cl::Kernel(program, "bandwidth", &err));

    int *inputPtr = (int *)q.enqueueMapBuffer(input_a, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, vector_size_bytes,
                                              nullptr, nullptr, &err);

    for (uint32_t i = 0; i < max_buffer; i++)
    {
        inputPtr[i] = source_input_A[i];
    }
    q.finish();

    // Set the Kernel Arguments
    OCL_CHECK(err, err = krnl.setArg(0, input_a));
    OCL_CHECK(err, err = krnl.setArg(1, p2pBo));
    OCL_CHECK(err, err = krnl.setArg(2, max_buffer));

    // Copy input data to device global memory
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({input_a}, 0 /* 0 means from host*/));
    q.finish();

    // Launch the Kernel
    OCL_CHECK(err, err = q.enqueueTask(krnl));
    q.finish();

    std::cout << "\nMap P2P device buffers to host access pointers\n"
              << std::endl;
    void *p2pPtr = q.enqueueMapBuffer(p2pBo,                      // buffer
                                      CL_TRUE,                    // blocking call
                                      CL_MAP_WRITE | CL_MAP_READ, // Indicates we will be writing
                                      0,                          // buffer offset
                                      vector_size_bytes,          // size in bytes
                                      nullptr, nullptr,
                                      &err); // error code
    q.finish();

    std::cout << "Start P2P Write of various buffer sizes from SSD to device buffers\n"
              << std::endl;
    for (size_t bufsize = min_buffer; bufsize <= vector_size_bytes; bufsize *= 2)
    {
        std::string size_str = xcl::convert_size(bufsize);

        int iter = max_size / bufsize;
        if (xcl::is_emulation())
        {
            iter = 2; // Reducing iteration to run faster in emulation flow.
        }
        std::chrono::high_resolution_clock::time_point p2pStart = std::chrono::high_resolution_clock::now();
        for (int i = 0; i < iter; i++)
        {
            ret = pread(nvmeFd, (void *)p2pPtr, bufsize, 0);
            if (ret == -1)
            {
                std::cout << "P2P: read() failed, err: " << ret << ", line: " << __LINE__ << std::endl;
                return EXIT_FAILURE;
            }
        }
        std::chrono::high_resolution_clock::time_point p2pEnd = std::chrono::high_resolution_clock::now();
        cl_ulong p2pTime = std::chrono::duration_cast<std::chrono::microseconds>(p2pEnd - p2pStart).count();
        ;
        double dnsduration = (double)p2pTime;
        double dsduration = dnsduration / ((double)1000000);
        double gbpersec = (iter * bufsize / dsduration) / ((double)1024 * 1024 * 1024);
        std::cout << "Buffer = " << size_str << " Iterations = " << iter << " Throughput = " << std::setprecision(2)
                  << std::fixed << gbpersec << "GB/s\n";
    }
    return 0;
}

void p2p_fpga_to_ssd(int &nvmeFd,
                     cl::Context context,
                     cl::CommandQueue q,
                     cl::Program program,
                     std::vector<int, aligned_allocator<int>> *source_input_A)
{
    int err;
    size_t vector_size_bytes = sizeof(int) * max_buffer;

    // Allocate Buffer in Global Memory
    cl_mem_ext_ptr_t inExt;
    inExt = {XCL_MEM_EXT_P2P_BUFFER, nullptr, 0};

    OCL_CHECK(err, cl::Buffer buffer_input(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX, vector_size_bytes, &inExt,
                                           &err));

    std::cout << "\nMap P2P device buffers to host access pointers\n"
              << std::endl;
    void *p2pPtr1 = q.enqueueMapBuffer(buffer_input,               // buffer
                                       CL_TRUE,                    // blocking call
                                       CL_MAP_READ | CL_MAP_WRITE, // Indicates we will be writing
                                       0,                          // buffer offset
                                       vector_size_bytes,          // size in bytes
                                       nullptr, nullptr,
                                       &err); // error code
    q.finish();

    std::cout << "Start P2P Read of various buffer sizes from device buffers to SSD\n"
              << std::endl;
    for (size_t bufsize = min_buffer; bufsize <= vector_size_bytes; bufsize *= 2)
    {
        std::string size_str = xcl::convert_size(bufsize);

        int iter = max_size / bufsize;
        if (xcl::is_emulation())
        {
            iter = 2; // Reducing iteration to run faster in emulation flow.
        }
        std::chrono::high_resolution_clock::time_point p2pStart = std::chrono::high_resolution_clock::now();
        for (int i = 0; i < iter; i++)
        {
            if (pwrite(nvmeFd, (void *)p2pPtr1, bufsize, 0) <= 0)
            {
                std::cerr << "ERR: pwrite failed: "
                          << " error: " << strerror(errno) << std::endl;
                exit(EXIT_FAILURE);
            }
        }
        std::chrono::high_resolution_clock::time_point p2pEnd = std::chrono::high_resolution_clock::now();
        cl_ulong p2pTime = std::chrono::duration_cast<std::chrono::microseconds>(p2pEnd - p2pStart).count();
        ;
        double dnsduration = (double)p2pTime;
        double dsduration = dnsduration / ((double)1000000);
        double gbpersec = (iter * bufsize / dsduration) / ((double)1024 * 1024 * 1024);
        std::cout << "Buffer = " << size_str << " Iterations = " << iter << " Throughput = " << std::setprecision(2)
                  << std::fixed << gbpersec << "GB/s\n";
    }
}

int main(int argc, char **argv)
{
    // Command Line Parser
    sda::utils::CmdLineParser parser;

    // Switches
    //**************//"<Full Arg>",  "<Short Arg>", "<Description>", "<Default>"
    parser.addSwitch("--xclbin_file", "-x", "input binary file string", "");
    parser.addSwitch("--file_path", "-p", "file path string", "");
    parser.addSwitch("--input_file", "-f", "input file string", "");
    parser.addSwitch("--device", "-d", "device id", "0");
    parser.parse(argc, argv);

    // Read settings
    auto binaryFile = parser.value("xclbin_file");
    std::string filepath = parser.value("file_path");
    std::string dev_id = parser.value("device");
    std::string filename;

    if (argc < 5)
    {
        parser.printHelp();
        return EXIT_FAILURE;
    }

    if (filepath.empty())
    {
        std::cout << "\nWARNING: As file path is not provided using -p option, going with -f option which is local "
                     "file testing. Please use -p option, if looking for actual p2p operation on NVMe drive.\n";
        filename = parser.value("input_file");
    }
    else
    {
        std::cout << "\nWARNING: Ignoring -f option when -p options is set. -p has high precedence over -f.\n";
        filename = filepath;
    }

    int nvmeFd = -1;
    if (xcl::is_emulation())
    {
        max_buffer = 16 * 1024;
    }

    cl_int err;
    cl::Context context;
    cl::CommandQueue q;
    std::vector<int, aligned_allocator<int>> source_input_A(max_buffer);

    // OPENCL HOST CODE AREA START
    // get_xil_devices() is a utility API which will find the xilinx
    // platforms and will return list of devices connected to Xilinx platform
    auto devices = xcl::get_xil_devices();
    // read_binary_file() is a utility API which will load the binaryFile
    // and will return the pointer to file buffer.
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    cl::Program program;

    auto pos = dev_id.find(":");
    cl::Device device;
    if (pos == std::string::npos)
    {
        uint32_t device_index = stoi(dev_id);
        if (device_index >= devices.size())
        {
            std::cout << "The device_index provided using -d flag is outside the range of "
                         "available devices\n";
            return EXIT_FAILURE;
        }
        device = devices[device_index];
    }
    else
    {
        if (xcl::is_emulation())
        {
            std::cout << "Device bdf is not supported for the emulation flow\n";
            return EXIT_FAILURE;
        }
        device = xcl::find_device_bdf(devices, dev_id);
    }

    if (xcl::is_hw_emulation())
    {
        auto device_name = device.getInfo<CL_DEVICE_NAME>();
        if (device_name.find("2018") != std::string::npos)
        {
            std::cout << "[INFO]: The example is not supported for " << device_name
                      << " this platform for hw_emu. Please try other flows." << '\n';
            return EXIT_SUCCESS;
        }
    }

    // Creating Context and Command Queue for selected Device
    OCL_CHECK(err, context = cl::Context(device, nullptr, nullptr, nullptr, &err));
    OCL_CHECK(err, q = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE, &err));
    std::cout << "Trying to program device[" << dev_id << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
    program = cl::Program(context, {device}, bins, nullptr, &err);
    if (err != CL_SUCCESS)
    {
        std::cout << "Failed to program device[" << dev_id << "] with xclbin file!\n";
        exit(EXIT_FAILURE);
    }
    else
        std::cout << "Device[" << dev_id << "]: program successful!\n";

    // P2P transfer from SSD to FPGA
    std::cout << "############################################################\n";
    std::cout << "                  Reading data from SSD                       \n";
    std::cout << "############################################################\n";
    // Get access to the NVMe SSD.
    nvmeFd = open(filename.c_str(), O_RDWR | O_DIRECT);
    if (nvmeFd < 0)
    {
        std::cerr << "ERROR: open " << filename << "failed: " << std::endl;
        return EXIT_FAILURE;
    }
    std::cout << "INFO: Successfully opened NVME SSD " << filename << std::endl;
    int ret = 0;
    ret = p2p_ssd_to_fpga(nvmeFd, context, q, program, source_input_A);
    (void)close(nvmeFd);
    if (ret != 0)
        return EXIT_FAILURE;

    // P2P transfer from FPGA to SSD
    std::cout << "############################################################\n";
    std::cout << "                  Writing data to SSD                       \n";
    std::cout << "############################################################\n";

    nvmeFd = open(filename.c_str(), O_RDWR | O_DIRECT);
    if (nvmeFd < 0)
    {
        std::cerr << "ERROR: open " << filename << "failed: " << std::endl;
        return EXIT_FAILURE;
    }
    std::cout << "INFO: Successfully opened NVME SSD " << filename << std::endl;
    p2p_fpga_to_ssd(nvmeFd, context, q, program, &source_input_A);
    (void)close(nvmeFd);

    // P2P transfer from FPGA to GPU
    std::cout << "############################################################\n";
    std::cout << "       GPU CUDA kernel accessing FPGA memory                \n";
    std::cout << "############################################################\n";
    p2p_fpga_to_gpu(context, q, program, &source_input_A);

    std::cout << "TEST PASSED" << std::endl;
    return EXIT_SUCCESS;
}
