#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int main()
{
    int N = 1024;

    omp_set_num_threads(8);

    int total_threads = omp_get_max_threads();
    double **X = malloc(N * sizeof(double *));
    double **Y = malloc(N * sizeof(double *));
    double **Z = malloc(N * sizeof(double *));

    for (int i = 0; i < N; i++)
    {
        X[i] = (double *)malloc(N * sizeof(double));
        Y[i] = (double *)malloc(N * sizeof(double));
        Z[i] = (double *)malloc(N * sizeof(double));
    }

    // initialise with random values
    srand(0);
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            X[i][j] = (double)rand() / RAND_MAX;
            Y[i][j] = (double)rand() / RAND_MAX;
            Z[i][j] = 0.0;
        }
    }

    printf("----------------------------------------------\n");
    printf("Matrix Size: %d x %d \n", N, N);
    printf("Threads: %d \n", total_threads );
    printf("----------------------------------------------\n");

    // Method1: Sequential --------------------------------------------------------
    double s_time;
    s_time = omp_get_wtime();
    int j = 0, k = 0;
    for (int i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            for (k = 0; k < N; k++)
            {
                Z[i][j] += X[i][k] * Y[k][j];
            }
        }
    }

    double t_seq = omp_get_wtime() - s_time;
    printf("Sequential Time: %f\n", t_seq);

    // Method 2 Parallel--------------------------------------------------------

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            Z[i][j] = 0.0;
        }
    }

    s_time = omp_get_wtime();
    j = 0, k = 0;
#pragma omp parallel for private(j, k)
    for (int i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            for (k = 0; k < N; k++)
            {
                Z[i][j] += X[i][k] * Y[k][j];
            }
        }
    }

    double t_parallel = omp_get_wtime() - s_time;
    printf("Parallel Execution time: %f; ", t_parallel);
    printf("Speedup: %fx\n", (t_seq / t_parallel));

    // METHOD3--------------------------------------------------------

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            Z[i][j] = 0; // reset Z
        }
    }

    s_time = omp_get_wtime();
    // Y transpose
    double **YT = malloc(N * sizeof(double *));
    for (int i = 0; i < N; i++)
    {
        YT[i] = (double *)malloc(N * sizeof(double));
    }
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
        {
            YT[j][i] = Y[i][j];
        }
    }

    j = 0, k = 0;
#pragma omp parallel for private(j, k)
    for (int i = 0; i < N; i++)
    {
        for (j = 0; j < N; j++)
        {
            for (k = 0; k < N; k++)
            {
                Z[i][j] += X[i][k] * YT[k][j];
            }
        }
    }

    double t_optimised = omp_get_wtime() - s_time;
    double speedup =  t_seq / t_optimised;
    printf("Optimised(Trans.) Execution time: %f ", t_optimised);
    printf("Speedup: %fx \n", speedup);
    printf("Efficiency: %f%%  \n", (speedup*100)/total_threads);

    // free ptr
    for (int i = 0; i < N; i++)
    {
        free(X[i]);
        free(Y[i]);
        free(Z[i]);
        free(YT[i]);
    }

    free(X);
    free(Y);
    free(Z);
    free(YT);

    return 0;
}