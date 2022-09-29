#include <ap_int.h>
#include <ap_fixed.h>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include <hls_math.h>
#include <math.h>
#include <stdint.h>

typedef ap_int<512> DType;

typedef struct {
  DType val;
  int index;
  bool is_last;
} DInType;

typedef struct {
  int val;
  int index;
} DOutType;

typedef hls::stream<DInType> Ch1;
typedef hls::stream<DOutType> Ch2;

template<int ID> void PE(Ch1& in, Ch2& out) {
// #pragma HLS interface ap_ctrl_none port = return
  while (1) {
      DInType Dval = in.read();
      if (Dval.is_last) {
        break;
      }

      auto val = Dval.val;
      int res = 0;

      inner: while (val) {
        val = val & (val-1);
        res += 1;
      }
      DOutType val_o = {res, Dval.index};
      out.write(val_o);
  }
}

void scheduler(Ch1& chd, Ch1& ch0, Ch1& ch1) {
  while (1) {
      DInType Dval = chd.read();
      if (Dval.is_last) {
          break;
      }

      while(1) {
        if (ch0.write_nb(Dval)) break;
        if (ch1.write_nb(Dval)) break;
      }
  }
  
  DInType DEnd = {0,0,true};
  ch0.write(DEnd);
  ch1.write(DEnd);

}

// https://support.xilinx.com/s/question/0D52E00006iHx4KSAS/
void loader(DType* imgIn, Ch1& chd, int length) {
    
    ol: for (int count = 0; count < length; count++) {
      #pragma HLS pipeline II=1
      auto val = imgIn[count];
      DInType vin = {val, count, false};
      chd.write(vin);
    }

    DInType DEnd = {0,0,true}; 
    chd.write(DEnd);
  }

void drainer(Ch2& ch0, Ch2& ch1, int* pc, int length) {
    
    od: for (int count = 0; count < length; count++) {
      #pragma HLS pipeline

        if (!ch0.empty()) {
          auto v = ch0.read(); 
          pc[v.index] = v.val;

        } else if (!ch1.empty()) {
          auto v = ch1.read(); 
          pc[v.index] = v.val;
        }
    } 
  }


extern "C" {
  void top(DType* img_diff, int* pc, int length) {
    #pragma HLS dataflow

    Ch1 ch_in_0, ch_in_1, ch_data;
    #pragma HLS stream variable=ch_in_0 depth=1024
    #pragma HLS stream variable=ch_in_1 depth=1024
    #pragma HLS stream variable=ch_data depth=1024

    Ch2 ch_out_0, ch_out_1;
    #pragma HLS stream variable=ch_out_0 depth=1024
    #pragma HLS stream variable=ch_out_1 depth=1024

    loader(img_diff, ch_data, length);
    scheduler(ch_data, ch_in_0, ch_in_1);

    PE<0>(ch_in_0, ch_out_0);
    PE<1>(ch_in_1, ch_out_1);
    drainer(ch_out_0, ch_out_1, pc, length);
  }
}