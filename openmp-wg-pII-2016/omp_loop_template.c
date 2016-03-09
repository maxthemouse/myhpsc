//
//

#include <stdio.h>
#include <omp.h>

int main() 
{
//insert pragma omp here
    {
        int i;
        int my_thread = omp_get_thread_num();
//insert pragma for this loop
        for (i=0; i<16; i++)
            printf("Thread %d gets i = %d\n",my_thread,i);
    }
}
