
#pragma once

#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1

#include <CL/cl2.hpp>

//Customized buffer allocation for 4K boundary alignment
template <typename T>
struct aligned_allocator
{
  using value_type = T;
  T* allocate(std::size_t num)
  {
    void* ptr = nullptr;
    if (posix_memalign(&ptr,4096,num*sizeof(T)))
      throw std::bad_alloc();
    return reinterpret_cast<T*>(ptr);
  }
  void deallocate(T* p, std::size_t num)
  {
    free(p);
  }
};

#include <fstream>
#include <iostream>
#include <stdlib.h>

#include <stdio.h>
#include <unistd.h>
#include <string>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/file.h>
#include <fcntl.h>


#include <cuda_runtime_api.h>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>



	int SIZE = 512*1024*1024;

    cl_mem_ext_ptr_t outExt;
    outExt = {XCL_MEM_EXT_P2P_BUFFER, nullptr, 0};
    OCL_CHECK(err, cl::Buffer p2pB(context, CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX, SIZE, &outExt, &err));
    //OCL_CHECK(err, cl::Buffer p2pB(context, CL_MEM_READ_WRITE, SIZE, NULL, &err));
	OCL_CHECK(err, err = q.finish());
        

	char *p2pPtr;
	OCL_CHECK(err, p2pPtr = (char*)q.enqueueMapBuffer (p2pB , CL_TRUE , CL_MAP_WRITE | CL_MAP_READ , 0, SIZE, NULL, NULL, &err));
	OCL_CHECK(err, err = q.finish());

	cudaHostRegister(p2pPtr, SIZE, cudaHostRegisterDefault);


	char *gpu_ptr;
	cudaMalloc((void**)&gpu_ptr,SIZE);
	std::cout<<"gpu_ptr:"<<(int*)gpu_ptr<<std::endl;

	   
	auto start_fpga2gpu = std::chrono::high_resolution_clock::now();
	cudaMemcpy( gpu_ptr, p2pPtr, SIZE, cudaMemcpyHostToDevice);   
	auto end_fpga2gpu = std::chrono::high_resolution_clock::now();
	auto fpga2gpu = std::chrono::duration<double>(end_fpga2gpu-start_fpga2gpu);
	auto fpga2gpu_in_sec = fpga2gpu.count();  
	double fpga2gpu_in_us= (double)(fpga2gpu_in_sec*1000000);   

	std::cout<<result<<std::endl;


	auto start_gpu2fpga = std::chrono::high_resolution_clock::now();
	cudaMemcpy( p2pPtr, gpu_ptr, SIZE, cudaMemcpyDeviceToHost);   
	auto end_gpu2fpga = std::chrono::high_resolution_clock::now();
	auto gpu2fpga = std::chrono::duration<double>(end_gpu2fpga-start_gpu2fpga);
	auto gpu2fpga_in_sec = gpu2fpga.count();     
	double gpu2fpga_in_us= (double)(gpu2fpga_in_sec*1000000);  


	cudaHostUnregister(p2pPtr);
	cudaFree(gpu_ptr);
	OCL_CHECK(err, err = q.enqueueUnmapMemObject(p2pB , p2pPtr));
	OCL_CHECK(err, err = q.finish());


...


        










