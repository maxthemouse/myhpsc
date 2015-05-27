#include <math.h>
#include "ticktock.h"
int runloop(int i) {
    int sum=0,j;
    for (j=0;j<i;j++)
        sum+=i^j;
    return sum;
}

int main() {
    int i = 0;
    int N = 4e4;
    int arr[N];
    tick_tock tt;
    tick(&tt);
    #pragma omp parallel for schedule(dynamic) //schedule(static,100)
    for (i=0;i<N;i++) {
      arr[i]=runloop(i);
    }
    tock(&tt);
    return 0;
}

