// ex3.c
#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define N 600
#define STEPS 500
#define ALPHA 0.25

double grid[N][N], newgrid[N][N];

int main() {

    // initialize
    for(int i=0;i<N;i++)
        for(int j=0;j<N;j++)
            grid[i][j] = (i==0||j==0||i==N-1||j==N-1)?100:0;

    double start = omp_get_wtime();

    for(int step=0; step<STEPS; step++) {

#pragma omp parallel for schedule(static)
        for(int i=1;i<N-1;i++) {
            for(int j=1;j<N-1;j++) {

                newgrid[i][j] = grid[i][j] +
                    ALPHA * (grid[i+1][j] + grid[i-1][j] +
                             grid[i][j+1] + grid[i][j-1] -
                             4*grid[i][j]);
            }
        }

        // copy back
#pragma omp parallel for
        for(int i=1;i<N-1;i++)
            for(int j=1;j<N-1;j++)
                grid[i][j] = newgrid[i][j];
    }

    double total_heat = 0;

#pragma omp parallel for reduction(+:total_heat)
    for(int i=0;i<N;i++)
        for(int j=0;j<N;j++)
            total_heat += grid[i][j];

    double end = omp_get_wtime();

    printf("Total Heat = %f\n", total_heat);
    printf("Execution Time = %f sec\n", end-start);
}
