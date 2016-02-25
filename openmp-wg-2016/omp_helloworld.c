#include <stdio.h>
#include <omp.h>
int main(){
    printf("At the start of program\n");
    #pragma omp parallel
    {
    printf("Hello from thread %d!\n",omp_get_thread_num());
    }
    return 0;
}
