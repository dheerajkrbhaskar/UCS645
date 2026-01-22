#include <stdio.h>
#include <omp.h>
int main()
{
    double s_time, e_time;
    s_time = omp_get_wtime();
    int i, sum = 0;
#pragma omp parallel for reduction(+:sum)
    for (i = 1; i < 100000000; i++)
    {
        //printf("Thread %d for i=%d; ", omp_get_thread_num(), i);
        sum += 1;
    }
    printf("Sum = %d\n", sum);
    e_time = omp_get_wtime();
    printf("Execution time: %f\n", e_time-s_time);

    return 0;
}