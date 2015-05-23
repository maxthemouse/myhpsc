#include <stdio.h>
#include <omp.h>
int main(){
    int nthreads;
    printf("At the start of program\n");
    #pragma omp parallel default(none) shared(nthreads)
    {
        int my_thread = omp_get_thread_num();
        printf("Hello from thread %d!\n",my_thread);
        if(my_thread == 0)
            nthreads = omp_get_num_threads();
    }
    printf("There were %d threads.\n",nthreads);
    return 0;
}

