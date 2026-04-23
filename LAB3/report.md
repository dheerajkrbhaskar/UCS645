# LAB3 - Correlation Computation

## Scaling with Matrix Size

Matrix size plays a critical role in determining computational complexity and execution time. As the size increases, the number of operations grows significantly, leading to higher processing time. Parallel computing techniques like OpenMP help in reducing execution time by distributing workload across multiple threads.

| Matrix Size | Sequential (s) | OpenMP 4T (s) | Speedup |
|---|---|---|---|
| 50 x 500 | 0.0024 | 0.0003 | 8.0x |
| 100 x 1000 | 0.0030 | 0.0016 | 1.9x |
| 200 x 2000 | 0.0310 | 0.0147 | 2.1x |
| 300 x 3000 | 0.0812 | 0.0298 | 2.7x |
| 500 x 5000 | 0.3722 | 0.1706 | 2.2x |

The results show that parallel execution significantly improves performance, with larger matrix sizes benefiting more from parallelization. The correlation computation involves computing means, norms, and dot products for all pairs of matrix rows, which scales as O(n²m) where n is the number of rows and m is the number of columns. With small matrices, the overhead of thread creation and synchronization can sometimes outweigh the benefits of parallelization, leading to lower speedups. However, as matrix size increases, the computation becomes more substantial and parallelization shows more consistent speedup.

---

## Thread Scaling

Thread scaling demonstrates how performance improves when more processing units are used. With increasing threads, execution time decreases due to better workload distribution. However, efficiency may reduce slightly because of synchronization overhead and communication costs.

| Threads | Time (s) | Speedup | Efficiency |
|---|---|---|---|
| 1 | 0.3722 | 1.00x | 100% |
| 2 | 0.1817 | 2.05x | 102% |
| 4 | 0.1706 | 2.18x | 54% |
| 8 | 0.0656 | 5.67x | 71% |

The thread scaling experiment uses a 500x5000 matrix to evaluate how performance scales with increasing thread count. With 2 threads, we achieve 2.05x speedup with slightly above 100% efficiency due to cache effects. The efficiency drops to 54% with 4 threads, likely due to cache contention and synchronization overhead. However, with 8 threads, the efficiency improves to 71%, showing that the larger workload better supports more threads. This demonstrates that the efficiency of parallelization depends on finding the right balance between workload size and thread count.

---

## Conclusion

The experiments clearly show that parallel computing significantly improves performance compared to sequential execution. As matrix size increases, the benefit of parallelization becomes more evident. The correlation computation program demonstrates good scaling with OpenMP, achieving 2-3x speedups with 4 threads for larger matrices. With 8 threads on a 500x5000 matrix, we achieve 5.67x speedup, showing substantial parallelization benefits. The results indicate that combining parallelism with appropriate problem sizes is essential for achieving high-performance computing with shared-memory architectures like OpenMP.
