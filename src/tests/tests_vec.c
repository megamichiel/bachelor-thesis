
#include <string.h>

#include "tests.h"
#include "ops.h"
#include "ops_basic.h"

void test_vec_init_n() {
  ACTIVE_TEST_TYPE *data = malloc(VEC_SIZE * sizeof(ACTIVE_TEST_TYPE));

  free(data);
}

void test_vec_init_c() {
  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, VEC_SIZE);
  void *data = alloc_array(desc);

  free(desc);
  free(data);
}

void test_vec_init() {
  perform_benchmark("test_vec_init_n", WARMUP_COUNT, BENCH_COUNT, test_vec_init_n, NULL);
  perform_benchmark("test_vec_init_c", WARMUP_COUNT, BENCH_COUNT, test_vec_init_c, NULL);
}

void test_vec_fill_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  memset(data, 0, count * sizeof(ACTIVE_TEST_TYPE));

  // memset(data, 1, count * sizeof(ACTIVE_TEST_TYPE));
  for (int i = 0; i < count; ++i)
    data[i] = 1;
}


void test_vec_fill_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *((size_t *) args[2]);

  memset(data, 0, count);
  bulk_fill(desc, data, NULL, NULL, 1);
}

void test_vec_fill() {
  ACTIVE_TEST_TYPE *data_n = malloc(VEC_SIZE * sizeof(ACTIVE_TEST_TYPE));
  size_t count_n = VEC_SIZE;

  void *args_n[] = { data_n, &count_n };

  perform_benchmark("test_vec_fill_n", WARMUP_COUNT, BENCH_COUNT, test_vec_fill_n, args_n);

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, VEC_SIZE);
  void *data_c = alloc_array(desc);
  size_t count_c = byte_size(desc);

  void *args_c[] = { desc, data_c, &count_c };

  perform_benchmark("test_vec_fill_c", WARMUP_COUNT, BENCH_COUNT, test_vec_fill_c, args_c);
}

void test_vec_set_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  memset(data, 0, count * sizeof(ACTIVE_TEST_TYPE));

  for (int i = 0; i < count; ++i)
    data[i] = i & ACTIVE_TEST_TYPE_MAX;
}

uint64_t test_vec_set_c_action(const size_t *index, __attribute__((unused)) void *arg) {
  return *index & ACTIVE_TEST_TYPE_MAX;
}

void test_vec_set_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *((size_t *) args[2]);

  memset(data, 0, count);
  bulk_set(desc, data, NULL, NULL, NULL, test_vec_set_c_action);
}

void test_vec_set() {
  ACTIVE_TEST_TYPE *data_n = malloc(VEC_SIZE * sizeof(ACTIVE_TEST_TYPE));
  size_t count_n = VEC_SIZE;

  void *args_n[] = { data_n, &count_n };

  perform_benchmark("test_vec_set_n", WARMUP_COUNT, BENCH_COUNT, test_vec_set_n, args_n);

  ArrayDesc *desc = alloc_desc(BOOL_BITS, 1, VEC_SIZE);
  void *data_c = alloc_array(desc);
  size_t count_c = byte_size(desc);

  void *args_c[] = { desc, data_c, &count_c };

  perform_benchmark("test_vec_set_c", WARMUP_COUNT, BENCH_COUNT, test_vec_set_c, args_c);
}

void test_vec_and_n(void **args) {
  bool *x = args[0], *y = args[1], *z = args[2];
  size_t count = *((size_t *) args[3]);

  memset(z, 0, count);

  for (int i = 0; i < count; ++i)
    z[i] = x[i] & y[i];
}

void test_vec_and_c(void **args) {
  ArrayDesc *desc = args[0];
  void *x = args[1], *y = args[2], *z = args[3];
  size_t count = *((size_t *) args[4]);

  memset(z, 0, count);

  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, NULL, NULL, bulk_and);
}

void test_vec_and() {
  ACTIVE_TEST_TYPE *x_n = malloc(VEC_SIZE * sizeof(ACTIVE_TEST_TYPE)),
           *y_n = malloc(VEC_SIZE * sizeof(ACTIVE_TEST_TYPE)),
           *z_n = malloc(VEC_SIZE * sizeof(ACTIVE_TEST_TYPE));
  size_t count_n = VEC_SIZE;

  srandom(RAND_SEED);

  for (int i = 0; i < count_n; ++i) {
    x_n[i] = random() & ACTIVE_TEST_TYPE_MAX;
    y_n[i] = random() & ACTIVE_TEST_TYPE_MAX;
  }

  void *args_n[] = { x_n, y_n, z_n, &count_n };

  perform_benchmark("test_vec_and_n", WARMUP_COUNT, BENCH_COUNT, test_vec_and_n, args_n);

  free(x_n);
  free(y_n);
  free(z_n);

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, VEC_SIZE);
  void *x_c = alloc_array(desc), *y_c = alloc_array(desc), *z_c = alloc_array(desc);
  size_t count_c = byte_size(desc);

  srandom(RAND_SEED);

  for (int i = 0; i < count_n; ++i) {
    array_set8(desc, x_c, i, random() & ACTIVE_TEST_TYPE_MAX);
    array_set8(desc, y_c, i, random() & ACTIVE_TEST_TYPE_MAX);
  }

  void *args_c[] = { desc, x_c, y_c, z_c, &count_c };

  perform_benchmark("test_vec_and_c", WARMUP_COUNT, BENCH_COUNT, test_vec_and_c, args_c);
}

void test_vec() {
  test_vec_init();
  test_vec_fill();
  test_vec_set();
  test_vec_and();
}
