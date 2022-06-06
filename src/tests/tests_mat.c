
#include <string.h>

#include "tests.h"
#include "ops.h"
#include "ops_basic.h"

void test_mat_alloc_n(void **args) {
  size_t count = *(size_t *) args[0];
  
  ACTIVE_TEST_TYPE *data = malloc(count * count * sizeof(ACTIVE_TEST_TYPE));

  free(data);
}

void test_mat_alloc_c(void **args) {
  size_t count = *(size_t *) args[0];
  
  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 2, count, count);
  void *data = malloc_array(desc);

  free_desc(desc);
  free(data);
}

void test_mat_alloc(size_t count) {
  void *args[] = { &count };

  perform_benchmark("mat_alloc", WARMUP_COUNT, BENCH_COUNT, false, test_mat_alloc_n, args);
  perform_benchmark("mat_alloc", WARMUP_COUNT, BENCH_COUNT, true, test_mat_alloc_c, args);
}

void test_mat_get_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  ACTIVE_TEST_TYPE x = data[5 * count + 5];
  x += 1;
}

void test_mat_get_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];

  ACTIVE_TEST_TYPE x = ACTIVE_TEST_GET(desc, data, get_index(desc, 5, 5));
  x += 1;
}

uint64_t test_mat_get_c_alloc(const size_t *index, void *arg) {
  return index[0] * *((size_t *) arg) + index[1];
}

void test_mat_get(size_t count) {
  ACTIVE_TEST_TYPE *data_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE));

  for (size_t y = 0; y < count; ++y)
    for (size_t x = 0; x < count; ++x)
      data_n[y * count + x] = y * count + x;

  void *args_n[] = { data_n, &count };

  perform_benchmark("mat_get", WARMUP_COUNT, BENCH_COUNT, false, test_mat_get_n, args_n);

  free(data_n);
  
  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 2, count, count);
  void *data_c = malloc_array(desc);
  size_t count_c = count;

  bulk_set(desc, data_c, NULL, NULL, test_mat_get_c_alloc, &count_c);

  void *args_c[] = { desc, data_c };

  perform_benchmark("mat_get", WARMUP_COUNT, BENCH_COUNT, true, test_mat_get_c, args_c);

  free_desc(desc);
  free(data_c);
}

void test_mat_set_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  data[5 * count + 5] = 0;
  data[5 * count + 5] = 5;
}

void test_mat_set_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];

  ACTIVE_TEST_SET(desc, data, get_index(desc, 5, 5), 0);
  ACTIVE_TEST_SET(desc, data, get_index(desc, 5, 5), 5);
}

uint64_t test_mat_set_c_alloc(const size_t *index, void *arg) {
  return index[0] * *((size_t *) arg) + index[1];
}

void test_mat_set(size_t count) {
  ACTIVE_TEST_TYPE *data_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE));

  for (size_t y = 0; y < count; ++y)
    for (size_t x = 0; x < count; ++x)
      data_n[y * count + x] = (y * count + x) & ACTIVE_TEST_TYPE_MAX;

  void *args_n[] = { data_n, &count };

  perform_benchmark("mat_set", WARMUP_COUNT, BENCH_COUNT, false, test_mat_set_n, args_n);

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 2, count, count);
  void *data_c = malloc_array(desc);
  size_t count_c = count;

  bulk_set(desc, data_c, NULL, NULL, test_mat_set_c_alloc, &count_c);

  void *args_c[] = { desc, data_c };

  perform_benchmark("mat_set", WARMUP_COUNT, BENCH_COUNT, true, test_mat_set_c, args_c);

  free(data_n);
  free_desc(desc);
  free(data_c);
}

void test_mat_fill_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  memset(data, 0, count * count * sizeof(ACTIVE_TEST_TYPE));

  // memset(data, 1, count * sizeof(ACTIVE_TEST_TYPE));
  for (int y = 0; y < count; ++y)
    for (int x = 0; x < count; ++x)
      data[y * count + x] = 1;
}


void test_mat_fill_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *((size_t *) args[2]);

  memset(data, 0, count);
  bulk_fill(desc, data, NULL, NULL, 1);
}

void test_mat_fill(size_t count) {
  ACTIVE_TEST_TYPE *data_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE));

  void *args_n[] = { data_n, &count };

  perform_benchmark("mat_fill", WARMUP_COUNT, BENCH_COUNT, false, test_mat_fill_n, args_n);

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 2, count, count);
  void *data_c = malloc_array(desc);
  size_t count_c = byte_size(desc);

  void *args_c[] = { desc, data_c, &count_c };

  perform_benchmark("mat_fill", WARMUP_COUNT, BENCH_COUNT, true, test_mat_fill_c, args_c);

  free(data_n);
  free_desc(desc);
  free(data_c);
}

void test_mat_and_n(void **args) {
  ACTIVE_TEST_TYPE *x = args[0], *y = args[1], *z = args[2];
  size_t count = *((size_t *) args[3]);

  memset(z, 0, count * count * sizeof(ACTIVE_TEST_TYPE));

  for (int iy = 0; iy < count; ++iy)
    for (int ix = 0; ix < count; ++ix)
      z[iy * count + ix] = x[iy * count + ix] & y[iy * count + ix];
}

void test_mat_and_c(void **args) {
  ArrayDesc *desc = args[0];
  void *x = args[1], *y = args[2], *z = args[3];
  size_t count = *((size_t *) args[4]);

  memset(z, 0, count);

  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, NULL, NULL, bulk_and, NULL);
}

void test_mat_and(size_t count) {
  ACTIVE_TEST_TYPE *x_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE)),
           *y_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE)),
           *z_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE));

  srandom(RAND_SEED);


  for (int y = 0; y < count; ++y) {
    for (int x = 0; x < count; ++x) {
      x_n[y * count + x] = random() & ACTIVE_TEST_TYPE_MAX;
      y_n[y * count + y] = random() & ACTIVE_TEST_TYPE_MAX;
    }
  }

  void *args_n[] = { x_n, y_n, z_n, &count };

  perform_benchmark("mat_and", WARMUP_COUNT, BENCH_COUNT, false, test_mat_and_n, args_n);

  free(x_n);
  free(y_n);
  free(z_n);

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 2, count, count);
  void *x_c = malloc_array(desc), *y_c = malloc_array(desc), *z_c = malloc_array(desc);
  size_t count_c = byte_size(desc);

  srandom(RAND_SEED);

  for (int y = 0; y < count; ++y) {
    for (int x = 0; x < count; ++x) {
      array_set8(desc, x_c, get_index(desc, y, x), random() & ACTIVE_TEST_TYPE_MAX);
      array_set8(desc, y_c, get_index(desc, y, x), random() & ACTIVE_TEST_TYPE_MAX);
    }
  }

  void *args_c[] = { desc, x_c, y_c, z_c, &count_c };

  perform_benchmark("mat_and", WARMUP_COUNT, BENCH_COUNT, true, test_mat_and_c, args_c);

  free_desc(desc);
  free(x_c);
  free(y_c);
  free(z_c);
}

void test_mat_bulk_set_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  memset(data, 0, count * count * sizeof(ACTIVE_TEST_TYPE));

  for (int y = 0; y < count; ++y)
    for (int x = 0; x < count; ++x)
      data[y * count + x] = (y * count + x) & ACTIVE_TEST_TYPE_MAX;
}

uint64_t test_mat_bulk_set_c_action(const size_t *index, __attribute__((unused)) void *arg) {
  return (index[0] * *((size_t *) arg) + index[1]) & ACTIVE_TEST_TYPE_MAX;
}

void test_mat_bulk_set_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *((size_t *) args[2]);

  memset(data, 0, count);
  bulk_set(desc, data, NULL, NULL, test_mat_bulk_set_c_action, &count);
}

void test_mat_bulk_set(size_t count) {
  ACTIVE_TEST_TYPE *data_n = malloc(count * count * sizeof(ACTIVE_TEST_TYPE));

  void *args_n[] = { data_n, &count };

  perform_benchmark("mat_bulk_set", WARMUP_COUNT, BENCH_COUNT, false, test_mat_bulk_set_n, args_n);

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 2, count, count);
  void *data_c = malloc_array(desc);
  size_t count_c = byte_size(desc);

  void *args_c[] = { desc, data_c, &count_c };

  perform_benchmark("mat_bulk_set", WARMUP_COUNT, BENCH_COUNT, true, test_mat_bulk_set_c, args_c);

  free(data_n);
  free_desc(desc);
  free(data_c);
}

void test_mat(size_t count) {
  test_mat_alloc(count);
  test_mat_get(count);
  test_mat_set(count);
  test_mat_fill(count);
  test_mat_and(count);
  test_mat_bulk_set(count);
}
