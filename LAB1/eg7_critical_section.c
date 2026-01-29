#include<stdio.h>
#include<omp.h>
int main(){
    #pragma omp parallel
    {   printf("Inside parallel TId: %d    ",omp_get_thread_num());
        #pragma omp critical
        {
            printf("ThreadId: %d \n",omp_get_thread_num());
        }
    }

    return 0;
}