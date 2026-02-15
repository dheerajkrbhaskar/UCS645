#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

#define N 2000
#define EPSILON 1.0
#define SIGMA 1.0
#define CUTOFF 3.0

typedef struct
{
    double x, y, z;
} Particle;

int main()
{
    Particle *p = malloc(N * sizeof(Particle));
    double *fx = calloc(N, sizeof(double));
    double *fy = calloc(N, sizeof(double));
    double *fz = calloc(N, sizeof(double));

    // initialize positions
    for (int i = 0; i < N; i++)
    {
        p[i].x = drand48() * 10;
        p[i].y = drand48() * 10;
        p[i].z = drand48() * 10;
    }
    double total_energy = 0.0;

    double start = omp_get_wtime();

#pragma omp parallel for reduction(+ : total_energy) schedule(dynamic)
    for (int i = 0; i < N; i++)
    {

        double fx_i = 0, fy_i = 0, fz_i = 0;

        for (int j = i + 1; j < N; j++)
        {

            double dx = p[i].x - p[j].x;
            double dy = p[i].y - p[j].y;
            double dz = p[i].z - p[j].z;

            double r2 = dx * dx + dy * dy + dz * dz;
            double r = sqrt(r2);

            if (r < CUTOFF && r > 1e-12)
            {
                double sr6 = pow(SIGMA / r, 6);
                double sr12 = sr6 * sr6;

                double force = 24 * EPSILON * (2 * sr12 - sr6) / r2;

                fx_i += force * dx;
                fy_i += force * dy;
                fz_i += force * dz;

                #pragma omp atomic
                fx[j] -= force * dx;
                #pragma omp atomic
                fy[j] -= force * dy;
                #pragma omp atomic
                fz[j] -= force * dz;

                total_energy += 4 * EPSILON * (sr12 - sr6);
            }
        }

        fx[i] += fx_i;
        fy[i] += fy_i;
        fz[i] += fz_i;
    }

    double end = omp_get_wtime();

    printf("Total Energy = %f\n", total_energy);
    printf("Execution Time = %f seconds\n", end - start);

    free(p);
    free(fx);
    free(fy);
    free(fz);
    return 0;
}
