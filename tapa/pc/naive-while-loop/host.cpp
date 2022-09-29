#include <sys/ipc.h>
#include <sys/shm.h>

// standard C/C++ headers
#include <cstdio>
#include <cstdlib>
#include <getopt.h>
#include <string>
#include <time.h>
#include <sys/time.h>

// opencl harness headers
#include <cmath>
#include "xcl2.hpp"
#include <algorithm>
#include <vector>
#include <chrono>
#include <random>

#include "ap_int.h"

typedef ap_int<1> bit1;
typedef ap_int<2> bit2;
typedef ap_int<8> bit8;
typedef ap_int<16> bit16;
typedef ap_int<512> bit512;

#define SIZE 65536 * 128

class Timer {
  std::chrono::high_resolution_clock::time_point mTimeStart;

public:
  Timer() { reset(); }
  long long stop() {
    std::chrono::high_resolution_clock::time_point timeEnd =
        std::chrono::high_resolution_clock::now();
    return std::chrono::duration_cast<std::chrono::microseconds>(timeEnd -
                                                                 mTimeStart)
        .count();
  }
  void reset() { mTimeStart = std::chrono::high_resolution_clock::now(); }
};

int main(int argc, char ** argv) {

  if (argc != 2) {
    std::cout << "Usage: " << argv[0] << " <XCLBIN File>" << std::endl;
    return EXIT_FAILURE;
  }
                
  // Prepare input data
  std::random_device rd;

  /* Random number generator */
  std::default_random_engine generator(rd());

  /* Distribution on which to apply the generator */
  std::uniform_int_distribution<long long unsigned> distribution(0,0xFFFFFFFFFFFFFFFF);

  std::vector<bit512, aligned_allocator<bit512>> input(SIZE);
  std::vector<int, aligned_allocator<int>> output(SIZE);

  for (int i = 0; i < SIZE; ++i)
    input[i] = distribution(generator);

  for (int i = 0; i < SIZE; ++i) {
      output[i] = 0;
  }


  std::string binaryFile = argv[1];
  size_t input_size_bytes = sizeof(bit512) * SIZE;
  size_t output_size_bytes = sizeof(int) * SIZE;

  cl_int err;
  cl::Context context;
  cl::Kernel krnl;
  cl::CommandQueue q;

  auto devices = xcl::get_xil_devices();
  // read_binary_file() is a utility API which will load the binaryFile
  // and will return the pointer to file buffer.
  auto fileBuf = xcl::read_binary_file(binaryFile);
  cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
  int valid_device = 0;
  for (unsigned int i = 0; i < devices.size(); i++) {
    auto device = devices[i];
    // Creating Context and Command Queue for selected Device
    OCL_CHECK(err, context = cl::Context(device, NULL, NULL, NULL, &err));
    OCL_CHECK(err, q = cl::CommandQueue(context, device,
                                        CL_QUEUE_PROFILING_ENABLE, &err));
    std::cout << "Trying to program device[" << i
              << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
    cl::Program program(context, {device}, bins, NULL, &err);
    if (err != CL_SUCCESS) {
      std::cout << "Failed to program device[" << i << "] with xclbin file!\n";
    } else {
      std::cout << "Device[" << i << "]: program successful!\n";
      OCL_CHECK(err, krnl = cl::Kernel(program, "top", &err));
      valid_device++;
      break; // we break because we found a valid device
    }
  }
  if (valid_device == 0) {
    std::cout << "Failed to program any device found, exit!\n";
    exit(EXIT_FAILURE);
  }


  // OpenCL buffers: img_diff, pc, length
  OCL_CHECK(err, cl::Buffer input_buffer(
                     context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_ONLY,
                     input_size_bytes, input.data(), &err));

  OCL_CHECK(err, cl::Buffer buffer_output(
                     context, CL_MEM_USE_HOST_PTR | CL_MEM_READ_WRITE,
                     output_size_bytes, output.data(), &err));
                     

  OCL_CHECK(err, err = krnl.setArg(0, input_buffer));
  OCL_CHECK(err, err = krnl.setArg(1, buffer_output));
  OCL_CHECK(err, err = krnl.setArg(2, SIZE));

  // Copy input data to device global memory
  OCL_CHECK(err, err = q.enqueueMigrateMemObjects(
	{input_buffer, buffer_output},
        0 /* 0 means from host*/));
  q.finish();

  // Launch the Kernel
  // For HLS kernels global and local size is always (1,1,1). So, it is
  // recommended
  // to always use enqueueTask() for invoking HLS kernel

  Timer fpga_timer;
  OCL_CHECK(err, err = q.enqueueTask(krnl));
  q.finish();

  long long fpga_timer_stop = fpga_timer.stop();
  std::cout << "Total time " << fpga_timer_stop * 0.001 << " ms\n";

  // Copy Result from Device Global Memory to Host Local Memory
  OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_output},
                                                  CL_MIGRATE_MEM_OBJECT_HOST));
  q.finish();
  // OPENCL HOST CODE AREA END



  }
