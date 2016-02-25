// ndot.c
//
// Inner product example. Serial version.
//
//
#include <stdio.h>
#include "ticktock.h"

double ndot(int n, double *x, double *y)
{
   double tot=0;
   #pragma omp parallel default(none) shared(tot,n,x,y)
   {
   double mytot = 0.;
   int i;
   #pragma omp for
   for (i=0; i<n; i++)
      mytot += x[i] * y[i];
   #pragma omp atomic
      tot += mytot;
   }
   return tot;
}

int main() 
{
   int i,n = 1e7;
   double*  x = malloc(sizeof(double) * n);
   double*  y = malloc(sizeof(double) * n);

   for (i=0; i<n; i++) 
      x[i]=y[i]=i;

   double ans=(n-1.)*n*(2.0*n-1.)/6.0;

   tick_tock tt;
   tick(&tt);
   double dot = ndot(n,x,y);
   printf("Dot product: %8.4e (vs %8.4e) for n = %d\n",dot,ans,n);
   tock(&tt);

   free(x); 
   free(y);
}
