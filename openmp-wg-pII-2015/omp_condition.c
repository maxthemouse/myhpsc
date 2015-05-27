#include <omp.h>
#include <stdio.h>

int main(int argc,char *argv[]){
    int N = 10;
    if(argc > 1)
        N = atoi(argv[1]);
    int i = 0;
    #pragma omp parallel for if(N>10)
    for(i = 0;i < N;i++)
        printf("Thread %d gets i = %d\n",omp_get_thread_num(),i);
} 
