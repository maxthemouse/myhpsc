//
//

#include <stdio.h>
#include <omp.h>

int main() 
{
    #pragma omp parallel default(none)
    {
        int i;
        int my_thread = omp_get_thread_num();
        #pragma omp for
        for (i=0; i<16; i++)
            printf("Thread %d gets i = %d\n",my_thread,i);
    }
}
