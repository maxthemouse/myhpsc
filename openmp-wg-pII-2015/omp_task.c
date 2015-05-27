#include <stdio.h>
#include <omp.h>

int main(){
    #pragma omp parallel
    #pragma omp single
    {
        printf("Thread %d is creating tasks\n",omp_get_thread_num());
        #pragma omp task
            printf("Hello 1 from thread %d\n",omp_get_thread_num());
        #pragma omp task
            printf("Hello 2 from thread %d\n",omp_get_thread_num());
    }
}
