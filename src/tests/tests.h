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

#define ACTIVE_TEST_BITS BOOL_BITS
#define ACTIVE_TEST_TYPE bool
#define ACTIVE_TEST_TYPE_MAX 1
#define ACTIVE_TEST_GET array_get8
#define ACTIVE_TEST_SET array_set8

// TODO investigate why test_vec_set_n is much faster on this test than bool (around 4 times faster than bool, although I would expect identical performance)
// I imagine that I made a mistake somewhere in the code, but I couldn't find it as of yet
// I did find that the culprit is changing VEC_TYPE from bool to uint8_t, but why this is the case, I do not know.
// Maybe whenever bools are set, internally the value is only stored as 0 or 1, and other values need to be converted?
// #define ACTIVE_TEST_BITS TINY_BITS
// #define ACTIVE_TEST_TYPE uint8_t
// #define ACTIVE_TEST_TYPE_MAX 7

void perform_benchmark(const char *name, int warmup, int iterations, void (*func)(void **), void **args);

void test_vec();
void test_mat();
void test_tsr();

#endif //THESIS_TESTS_H
