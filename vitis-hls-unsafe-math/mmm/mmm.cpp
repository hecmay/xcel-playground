#include <stdio.h>
#include <stdlib.h>

// This is tested on 2021_1.  It should load and built in a
// default IP mode project.  The interesting part isn't
// affected by the unsafe_math setting.
//
// In this example, I am trying to pipeline the inner loop
// of a basic MMM, with unrolling.  The arrays have been
// reshaped to go with unrolling.
//
// All of the weirdness shown in reduce.cpp would alos happen in MMM.
// In this example, I am isolating a major voodoo above and
// beyond what has been extracted into reduce.cpp.
//
// You need to unroll by at least 2.
//
// Q: why does mmm_voodoo() work when mmm_accum2() doesn't?
//

#define N 256

const int UNROLL=2;  // need to unroll by at least 2 for the voodoo

// This is basic. II is 3 if unsafe_math, greater if not.
void mmm_basic(float C[N][N], float A[N][N], float B[N][N]) {
#pragma HLS INLINE OFF

    int i, j, k;

    ai: for (i = 0; i < N; i++){
        aj: for (j = 0; j < N; j++) {
            C[i][j] = 0;
            ak: for (k = 0; k < N; ++k) {
#pragma HLS UNROLL factor=UNROLL
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}

// Adding explicit accumulator doesn't help
void mmm_accum(float C[N][N], float A[N][N], float B[N][N]) {
#pragma HLS INLINE OFF

    int i, j, k;

    ai: for (i = 0; i < N; i++){
        aj: for (j = 0; j < N; j++) {
            float accum = 0;

            C[i][j] = 0;
            ak: for (k = 0; k < N; ++k) {
#pragma HLS UNROLL factor=UNROLL
                accum += A[i][k] * B[k][j];
            }
            C[i][j] += accum ;
        }
    }
}

// Using 2 explicit accumulators doesn't help
void mmm_accum2(float C[N][N], float A[N][N], float B[N][N]) {
#pragma HLS INLINE OFF

    int i, j, k;

    ai: for (i = 0; i < N; i++){
        aj: for (j = 0; j < N; j++) {
            float accum[2] = {0,0};

            C[i][j] = 0;
            ak: for (k = 0; k < N; ++k) {
#pragma HLS UNROLL factor=UNROLL
                accum[(k/UNROLL)%2] += A[i][k] * B[k][j];
            }
            C[i][j] += (accum[0]+accum[1]) ;
        }
    }
}

// Using 2 of 8 declared accumulator does help (ii=1)!!  This is strange.
void mmm_voodoo(float C[N][N], float A[N][N], float B[N][N]) {
#pragma HLS INLINE OFF

    int i, j, k;

    ai: for (i = 0; i < N; i++){
        aj: for (j = 0; j < N; j++) {
            float accum[8] = {0,0,0,0,0,0,0,0};  //<=== this is the only change!!

            C[i][j] = 0;
            ak: for (k = 0; k < N; ++k) {
#pragma HLS UNROLL factor=UNROLL
                accum[(k/UNROLL)%2] += A[i][k] * B[k][j];
            }
            C[i][j] += (accum[0]+accum[1]) ;
        }
    }
}


extern "C" 
void top(float C[N][N], float A[N][N], float B[N][N]) {
#pragma HLS ARRAY_RESHAPE dim=1 type=cyclic factor=UNROLL variable=B
#pragma HLS ARRAY_RESHAPE dim=2 type=cyclic factor=UNROLL variable=A

    mmm_basic( C, A, B );

    mmm_accum2( C, A, B );

    mmm_accum( C, A, B );

    mmm_voodoo( C, A, B );
}



