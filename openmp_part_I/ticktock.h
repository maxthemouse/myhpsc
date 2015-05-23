#ifndef TICKTOCK_H
#define TICKTOCK_H

#include <stdlib.h>
#include <sys/time.h>

typedef struct timeval tick_tock;

/* timing routines */

void tick(tick_tock *tt);
void tock(tick_tock *tt);
double tock_ret(tick_tock *tt);
double tocksilent(tick_tock *tt);
void tocktag(tick_tock *tt,char *msg);

#endif
