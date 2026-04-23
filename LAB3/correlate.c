#include "correlate.h"
#include <math.h>
#include <stdlib.h>
#include <omp.h>

#define USE_OMP 1

void correlate(int ny, int nx, const float* data, float* result)
{
    double* mean = (double*) calloc(ny, sizeof(double));
    double* norm = (double*) calloc(ny, sizeof(double));

    // Step 1: mean and norm
#if USE_OMP
#pragma omp parallel for
#endif
    for (int i = 0; i < ny; i++)
    {
        double sum = 0.0;
        for (int x = 0; x < nx; x++)
            sum += data[x + i * nx];

        mean[i] = sum / nx;

        double sq = 0.0;
        for (int x = 0; x < nx; x++)
        {
            double v = data[x + i * nx] - mean[i];
            sq += v * v;
        }

        norm[i] = sqrt(sq);
    }

    // Step 2: correlation
#if USE_OMP
#pragma omp parallel for schedule(dynamic)
#endif
    for (int i = 0; i < ny; i++)
    {
        for (int j = 0; j <= i; j++)
        {
            double dot = 0.0;

            for (int x = 0; x < nx; x++)
            {
                double ai = data[x + i * nx] - mean[i];
                double aj = data[x + j * nx] - mean[j];
                dot += ai * aj;
            }

            double denom = norm[i] * norm[j];
            double corr = (denom == 0.0) ? 0.0 : (dot / denom);

            result[i + j * ny] = (float)corr;
        }
    }

    free(mean);
    free(norm);
}