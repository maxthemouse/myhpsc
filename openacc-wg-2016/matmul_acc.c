#include <stdio.h>
#include "ticktock.h"

#define SIZE 2250

float a[SIZE][SIZE];
float b[SIZE][SIZE];
float c[SIZE][SIZE];

void matmul(){
    int i,j,k;
    #pragma acc kernels
    for(i=0;i<SIZE;i++)
        for(j=0;j<SIZE;j++){
            float sum = 0.0f;
            for(k=0;k<SIZE;k++)
                sum += a[i][k] * b[k][j];
            c[i][j] = sum;
        }
}

int main(){
    int i,j;

    for(i=0;i<SIZE;i++)
        for(j=0;j<SIZE;j++){
            a[i][j] = (float)(i+j);
            b[i][j] = (float)(i-j);
            c[i][j] = 0.0f;
        }
    tick_tock tt;
    tick(&tt); 
    matmul();
    tock(&tt);    
    return 0;     
}
