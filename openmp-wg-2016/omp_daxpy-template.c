// daxpy.c
//
// Compute a daxpy serially.
//
//

#include "ticktock.h"

void daxpy(int n, double a, double* x, double* y, double* z) 
{
    //your pragma goes here. make sure you have correct shared(...) term
    {
    int i = 0;
    //another pragma goes here
    for (i=0; i<n; i++) {
        x[i] = (double)i*(double)i;
        y[i] = (i+1.)*(i-1.);
    }
    //the last pragma goes here
    for (i=0; i<n; i++) 
        z[i] += a * x[i] + y[i];
    }
}

int main() 
{
    int     n = 1e7;
    double* x = malloc(sizeof(double) * n);
    double* y = malloc(sizeof(double) * n);
    double* z = malloc(sizeof(double) * n);
	double  a = 5./3.;
    tick_tock tt;
    tick(&tt);
    daxpy(n,a,x,y,z);
    tock(&tt);
    free(x);
    free(y);
    free(z);
}
