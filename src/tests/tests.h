
#ifndef THESIS_TESTS_H
#define THESIS_TESTS_H

#include <stdbool.h>

#define WARMUP_COUNT 10
#define BENCH_COUNT 10

#define RAND_SEED 1372485901 // Just some random value, but used to ensure identical computations in benchmarks

#define BOOL_BITS 1
#define TINY_BITS 3
#define HALF_BITS 4
#define SMALL_BITS 6
#define TRIAD_BITS 25
#define LARGE_BITS 40

#define BOOL_MAX 1
#define TINY_MAX 7
#define HALF_MAX 15
#define SMALL_MAX 63
#define TRIAD_MAX 0x1FFFFFF
#define LARGE_MAX 0xFFFFFFFFFF

#define ACTIVE_TEST_BITS     64
#define ACTIVE_TEST_TYPE_MAX -1
#define ACTIVE_TEST_TYPE     uint64_t
#define ACTIVE_TEST_GET array_get64
#define ACTIVE_TEST_SET array_set64

// TODO investigate why test_vec_set_n is much faster on this test than bool (around 4 times faster than bool, although I would expect identical performance)
// I imagine that I made a mistake somewhere in the code, but I couldn't find it as of yet
// I did find that the culprit is changing VEC_TYPE from bool to uint8_t, but why this is the case, I do not know.
// Maybe whenever bools are set, internally the value is only stored as 0 or 1, and other values need to be converted?
// #define ACTIVE_TEST_BITS TINY_BITS
// #define ACTIVE_TEST_TYPE uint8_t
// #define ACTIVE_TEST_TYPE_MAX 7

void perform_benchmark(const char *name, int warmup, int iterations, bool newline, void (*func)(void **), void **args);

void test_vec(size_t count);
void test_mat(size_t count);
void test_tsr(size_t count);

void test_vec_scan_triple(size_t size);
void test_vec_bulk_set_triple(size_t count);
void test_mat_find(size_t count);
void test_tsr_find(size_t count);

#endif //THESIS_TESTS_H

