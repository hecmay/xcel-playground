#include <stdio.h>

#define MAX 1024

// This is tested on 2021_1.  It should load and built in a
// default IP mode project.  The behavior in question is 
// isolated out of a MMM exampl. The isolated behavior in 
// question isn't affected by unsafe_math.
//
// In this example, I am trying to pipeline a simple
// fp array reduction.
//
//
// Q1: why doesn't the basic version just work (get ii=1)?
//
// Q2: why do I need to introduce 8 explicit accumulators before ii=1?


// This simple reduce pipelines automatically, but has an II of 3.
float reduce_basic_ii_is_3(float A[MAX]) {
#pragma HLS INLINE off
    float accum=0;
    basic: for (int j=0;j<MAX;j++) {
      accum+=A[j];
    }
    return accum;
}

// Trying to use 2 accumulators made it worse, now II=4
float reduce_accum2_ii_is_4(float A[MAX]) {
#pragma HLS INLINE off
    float accum[2]={0,0};
    accum2: for (int j=0;j<MAX;j++) {
        accum[j%2]+=A[j];
    }
    return accum[0]+accum[1];
}


// With 4 accumulators, II=3
float reduce_accum4_ii_is_3(float A[MAX]) {
#pragma HLS INLINE off
    float accum[4]={0,0,0,0};
    accum4: for (int j=0;j<MAX;j++) {
        accum[j%4]+=A[j];
    }
    return accum[0]+accum[1]+accum[2]+accum[3];
}

// With 8 accumulators, II=1
float reduce_accum8_ii_is_1(float A[MAX]) {
#pragma HLS INLINE off
    float accum[8]={0,0,0,0,0,0,0,0};
    accum8: for (int j=0;j<MAX;j++) {
        accum[j%8]+=A[j];
    }
    return accum[0]+accum[1]+accum[2]+accum[3]+accum[4]+accum[5]+accum[6]+accum[7];
}

extern "C"
void top(float A[MAX], float* B) {
    float accum=0;

    accum+=reduce_basic_ii_is_3(A);

    accum+=reduce_accum2_ii_is_4(A);

    accum+=reduce_accum4_ii_is_3(A);

    accum+=reduce_accum8_ii_is_1(A);

    B[0] = accum;
}

