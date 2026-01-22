#include <stdio.h>
#include <omp.h>
int main(){
    #pragma omp parallel 
    {
    printf("Hello from thread %d\n", omp_get_thread_num());
    }
    return 0;
}

/*OUTPUT:

gcc eg1_helloworld.c -fopenmp -o eg1_helloworld
./eg1_helloworld


Hello from thread 1
Hello from thread 3
Hello from thread 4
Hello from thread 8
Hello from thread 10
Hello from thread 7
Hello from thread 5
Hello from thread 11
Hello from thread 0
Hello from thread 9
Hello from thread 2
Hello from thread 6

*/