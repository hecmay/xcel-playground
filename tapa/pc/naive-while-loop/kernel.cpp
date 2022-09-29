#include <ap_int.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <math.h>
#include <stdint.h>

typedef ap_int<512> DType;

extern "C" {
  void top(DType* img_diff, int* pc, int length) {
    oo: for (int x1 = 0; x1 < length; ++x1) {
      #pragma HLS pipeline
      auto val = img_diff[x1];
      int res = 0;

      while (val) {
        val = val & (val-1);
        res += 1;
      }
      pc[x1] = res;
    } 
  }
}