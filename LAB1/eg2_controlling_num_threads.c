#include<stdio.h>
#include<omp.h>
int main(){
    omp_set_num_threads(4);

    #pragma omp parallel
    {
        printf("Thread ID: %d\n", omp_get_thread_num());
    }
    return 0;
}
/*OUTPUT:

gcc eg2_controlling_num_threads.c -fopenmp -o eg2_controlling_num_threads
./eg2_controlling_num_threads


Thread ID: 3
Thread ID: 0
Thread ID: 1
Thread ID: 2

*/