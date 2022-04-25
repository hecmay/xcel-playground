/* Header to make Clang compatible with OpenCL */
// clang -S -emit-llvm -o test.ll -x cl test.cl
// Thread model: posix
#define __global __attribute__((address_space(1)))
int get_global_id(int index);

/* Test kernel */
__kernel void test(__global float *in, __global float *out) {
  int index = get_global_id(0);
  out[index] = 3.14159f * in[index] + in[index];
}