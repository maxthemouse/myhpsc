#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/time.h>
#include "ticktock.h"
void tick(tick_tock *tt)
{
  gettimeofday(tt,NULL);
}
/*--------------------------------------------------------------------------------*/
void tock(tick_tock *tt)
{
	fprintf(stderr,"Tock registers %14.4f seconds.\n",tocksilent(tt));
}

double tock_ret(tick_tock *tt)
{
  tick_tock tnow;
  gettimeofday(&tnow,NULL);
  double   dt=(tnow.tv_usec-tt->tv_usec)/1.0e6+(tnow.tv_sec-tt->tv_sec);  
  return dt;  
}
/*--------------------------------------------------------------------------------*/
double tocksilent(tick_tock *tt)
{
  tick_tock tnow;
  gettimeofday(&tnow,NULL);
  return (tnow.tv_usec-tt->tv_usec)/1.0e6+(tnow.tv_sec-tt->tv_sec);  
			    
}
/*--------------------------------------------------------------------------------*/
void tocktag(tick_tock *tt,char *msg)
{
  tick_tock tnow;
  gettimeofday(&tnow,NULL);
  double   dt=(tnow.tv_usec-tt->tv_usec)/1.0e6+(tnow.tv_sec-tt->tv_sec);  
  if (!msg)
    fprintf(stdout,"Tock registers %14.4e seconds.\n",dt);
  else
    fprintf(stdout,"%14.4e: %s\n",dt,msg);
}
