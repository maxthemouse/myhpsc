#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

struct node{
    int data;
    struct node *next;
};

struct node *top = NULL;
void create_LL()
{
    int i;
    for(i = 0;i < 4;i++){
        struct node * temp = malloc(sizeof(struct node));
        temp->data = i;
        temp->next = top;
        top = temp;
    }
}

void process(struct node *p,int t_id)
{
    printf("printing %d by thread %d\n",p->data,t_id);
}


int main(){
    create_LL();
    #pragma omp parallel sections
    {
        printf("Main thread %d\n",omp_get_thread_num());
        #pragma omp section
            process(top,omp_get_thread_num());
        #pragma omp section
            process(top->next,omp_get_thread_num());
        #pragma omp section
            process(top->next->next,omp_get_thread_num());
    }
}
