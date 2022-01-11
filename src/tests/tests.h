//
// Created by michiel on 7/1/22.
//

#ifndef THESIS_TESTS_H
#define THESIS_TESTS_H

#define WARMUP_COUNT 1000
#define BENCH_COUNT 10000

#define RAND_SEED 1372485901 // Just some random value, to always use identical values in benchmarks

#define VEC_SIZE 1000000
#define MAT_SIZE 1000
#define TSR_SIZE 100

#define BOOL_BITS 1
#define TINY_BITS 3
#define SMALL_BITS 6
#define TRIAD_BITS 24
#define LARGE_BITS 40

void perform_benchmark(const char *name, int warmup, int iterations, void (*func)(void **), void **args);

void test_bool();
void test_tiny();
void test_small();
void test_triad();
void test_large();

#endif //THESIS_TESTS_H
