#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

#include "correlate.h"

int main(int argc, char** argv)
{
    if (argc < 3)
    {

        printf(" Usage: %s<ny_rows> <nx_cols> [threads]\n", argv[0]);
        return 0;
    }

    int ny = atoi(argv[1]);
    int nx = atoi(argv[2]);

    int threads = omp_get_max_threads();

    if (argc >= 4)
        threads = atoi(argv[3]);

    omp_set_num_threads(threads);

    printf("Matrix: ny = %d, nx = %d\n", ny, nx);
    printf("Threads:  %d\n ", threads);

    float* data = (float*) malloc(ny * nx * sizeof(float));
    float* result = (float*) calloc(ny * ny, sizeof(float));

    //fill with random value
    for (int i = 0; i < ny * nx; i++)
        data[i] = (float)(rand() % 100) / 10.0f;

    double start = omp_get_wtime();

    correlate(ny, nx, data, result);

    double end = omp_get_wtime();
    printf("Time taken: %f ms\n", (end - start) * 1000.0);

    // sample o/p
    printf("Sample output (0,0): %f\n", result[0]);
    printf("Sample output (1,0): %f\n", result[1]);
    printf("Sample output (1,1): %f\n", result[1 + 1 * ny]);

    free(data);
    free(result);

    return 0;
}