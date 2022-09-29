#include <stdio.h>
#include <stdlib.h>

void setArray(void *array, int size) {
    do {
        size--;
        ((float*)array)[size]=rand()%64;
    } while(size);
}

float sumArray(void *array, int size) {
    float accum=0;
    do {
        size--;
        accum+=((float*)array)[size];
    } while(size);
    return accum;
}

#define N 256

extern "C" 
void top(float C[N][N], float A[N][N], float B[N][N]);

int main() {
    float C[N][N];
    float A[N][N];
    float B[N][N];

    setArray(A, N*N);
    setArray(B, N*N);
    setArray(C, N*N);

    top( C, A, B );
    printf("%f\n", sumArray(C, N*N));

    return 0;
}