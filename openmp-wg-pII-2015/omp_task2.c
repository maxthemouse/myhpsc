#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

typedef struct node{
    int data;
    struct node *next;
} Node;

Node *top = NULL;
void create_LL()
{
    int i;
    for(i = 0;i < 4;i++){
        Node *temp = malloc(sizeof(struct node));
        temp->data = i;
        temp->next = top;
        top = temp;
    }
}

void process(Node *p,int t_id)
{
    printf("printing %d by thread %d\n",p->data,t_id);
}


int main(){
    create_LL();
    #pragma omp parallel
    #pragma omp single nowait
    {
        printf("Thread %d is creating tasks\n",omp_get_thread_num());
        Node *p = top;
        while(p){
            #pragma omp task firstprivate(p)
                process(p,omp_get_thread_num());
            p = p -> next;
        }
    }
}
