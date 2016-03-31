#include <stdio.h>
#include "ticktock.h"

#define SIZE 2250

int a[SIZE][SIZE];
int b[SIZE][SIZE];
int c[SIZE][SIZE];

void matmul(){
    int i,j,k;
    #pragma acc kernels
    for(i=0;i<SIZE;i++)
        for(j=0;j<SIZE;j++){
            int sum = 0;
            for(k=0;k<SIZE;k++)
                sum += a[i][k] * b[k][j];
            c[i][j] = sum;
        }
}

int main(){
    int i,j;

    for(i=0;i<SIZE;i++)
        for(j=0;j<SIZE;j++){
            a[i][j] = (i % 50);
            b[i][j] = (j % 30);
            c[i][j] = 0;
        }
    tick_tock tt;
    tick(&tt); 
    matmul();
    tock(&tt);    
    printf("c[523][789] = %d\n",c[523][789]);
    return 0;     
}
