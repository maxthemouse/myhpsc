#include <stdio.h>

int main(){
    #pragma omp parallel sections
    {
        #pragma omp section
            printf("Hello 1 from thread %d\n",omp_get_thread_num());
        #pragma omp section
            printf("Hello 2 from thread %d\n",omp_get_thread_num());
    }
}
