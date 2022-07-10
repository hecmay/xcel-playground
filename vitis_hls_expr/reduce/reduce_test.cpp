#include <stdio.h>
#define MAX 1024

extern "C" void top(float A[MAX], float* B);


int main() {
    float A[MAX];
    float accum;

    for(int i=0;i<MAX;i++) {
        A[i]=i;
    }

    float B[1];
    top(A, B);
    printf("%f\n", B[0]);

    return 0;
}
