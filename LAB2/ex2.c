// ex2.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <omp.h>

#define MATCH 2
#define MISMATCH -1
#define GAP -1

int max(int a, int b, int c) {
    if (a > b && a > c) return a;
    if (b > c) return b;
    return c;
}

int main() {
    char seq1[] = "ACACACTA";
    char seq2[] = "AGCACACA";

    int m = strlen(seq1);
    int n = strlen(seq2);

    int **H = malloc((m+1)*sizeof(int*));
    for(int i=0;i<=m;i++)
        H[i] = calloc(n+1,sizeof(int));

    double start = omp_get_wtime();

    for(int i=1;i<=m;i++) {

#pragma omp parallel for schedule(guided)
        for(int j=1;j<=n;j++) {

            int score_diag = H[i-1][j-1] +
                (seq1[i-1]==seq2[j-1] ? MATCH : MISMATCH);

            int score_up = H[i-1][j] + GAP;
            int score_left = H[i][j-1] + GAP;

            int val = max(0, score_diag,
                          score_up > score_left ? score_up : score_left);

            H[i][j] = val;
        }
    }

    double end = omp_get_wtime();

    printf("Alignment Score Matrix:\n");
    for(int i=0;i<=m;i++){
        for(int j=0;j<=n;j++)
            printf("%3d ", H[i][j]);
        printf("\n");
    }

    printf("Execution Time = %f sec\n", end-start);
}
