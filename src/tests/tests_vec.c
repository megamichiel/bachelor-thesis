
#include <string.h>

#include "tests.h"
#include "ops.h"
#include "ops_basic.h"

void test_vec_alloc_n(void **args) {
  size_t count = *(size_t *) args[0];

  ACTIVE_TEST_TYPE *data = malloc(count * sizeof(ACTIVE_TEST_TYPE));

  free(data);
}

void test_vec_alloc_c(void **args) {
  size_t count = *(size_t *) args[0];

  ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
  void *data = malloc_array(desc);

  free_desc(desc);
  free(data);
}

void test_vec_alloc(size_t count) {
  void *args[] = { &count };

  perform_benchmark("vec_alloc", WARMUP_COUNT, BENCH_COUNT, false, test_vec_alloc_n, args);
  perform_benchmark("vec_alloc", WARMUP_COUNT, BENCH_COUNT, true, test_vec_alloc_c, args);
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_get_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  for (size_t i = 0; i < count; ++i) {
    ACTIVE_TEST_TYPE x = data[i];
  }
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_get_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *((size_t *) args[2]);

  for (size_t i = 0; i < count; ++i) {
    ACTIVE_TEST_TYPE x = ACTIVE_TEST_GET(desc, data, i);
  }
}
#pragma GCC pop_options

uint64_t test_vec_get_c_alloc(const size_t *index, void *arg) {
  return *index;
}

void test_vec_get(size_t count) {
  {
    ACTIVE_TEST_TYPE *data_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    for (size_t i = 0; i < count; ++i)
      data_n[i] = i;

    void *args_n[] = {data_n, &count};

    perform_benchmark("vec_get", WARMUP_COUNT, BENCH_COUNT, false, test_vec_get_n, args_n);

    free(data_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *data_c = malloc_array(desc);

    bulk_set(desc, data_c, NULL, NULL, test_vec_get_c_alloc, NULL);

    void *args_c[] = {desc, data_c, &count};

    perform_benchmark("vec_get", WARMUP_COUNT, BENCH_COUNT, true, test_vec_get_c, args_c);

    free_desc(desc);
    free(data_c);
  }
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_set_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *(size_t *) args[1];

  for (size_t i = 0; i < count; ++i) {
    data[i] = i & ACTIVE_TEST_TYPE_MAX;
  }
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_set_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *(size_t *) args[2];

  for (size_t i = 0; i < count; ++i) {
    ACTIVE_TEST_SET(desc, data, i, i);
  }
}
#pragma GCC pop_options

uint64_t test_vec_set_c_alloc(const size_t *index, void *arg) {
  return *index;
}

void test_vec_set(size_t count) {
  {
    ACTIVE_TEST_TYPE *data_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    for (size_t x = 0; x < count; ++x)
      data_n[x] = x & ACTIVE_TEST_TYPE_MAX;

    void *args_n[] = {data_n, &count};

    perform_benchmark("vec_set", WARMUP_COUNT, BENCH_COUNT, false, test_vec_set_n, args_n);

    free(data_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *data_c = malloc_array(desc);
    size_t size_c = byte_size(desc);

    bulk_set(desc, data_c, NULL, NULL, test_vec_set_c_alloc, NULL);

    void *args_c[] = {desc, data_c, &count, &size_c};

    perform_benchmark("vec_set", WARMUP_COUNT, BENCH_COUNT, true, test_vec_set_c, args_c);

    free_desc(desc);
    free(data_c);
  }
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_fill_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  for (size_t x = 0; x < count; ++x)
    data[x] = 1;
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_fill_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];

  bulk_fill(desc, data, NULL, NULL, 1);
}
#pragma GCC pop_options

void test_vec_fill(size_t count) {
  {
    ACTIVE_TEST_TYPE *data_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    void *args_n[] = {data_n, &count};

    perform_benchmark("vec_fill", WARMUP_COUNT, BENCH_COUNT, false, test_vec_fill_n, args_n);

    free(data_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *data_c = malloc_array(desc);
    size_t count_c = byte_size(desc);

    void *args_c[] = {desc, data_c, &count_c};

    perform_benchmark("vec_fill", WARMUP_COUNT, BENCH_COUNT, true, test_vec_fill_c, args_c);

    free_desc(desc);
    free(data_c);
  }
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_and_n(void **args) {
  ACTIVE_TEST_TYPE *x = args[0], *y = args[1], *z = args[2];
  size_t count = *((size_t *) args[3]);

  for (size_t ix = 0; ix < count; ++ix)
    z[ix] = x[ix] & y[ix];
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_and_c(void **args) {
  ArrayDesc *desc = args[0];
  void *x = args[1], *y = args[2], *z = args[3];

  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, NULL, NULL, bulk_and, NULL);
}
#pragma GCC pop_options

void test_vec_and(size_t count) {
  {
    ACTIVE_TEST_TYPE *x_n = malloc(count * sizeof(ACTIVE_TEST_TYPE)),
            *y_n = malloc(count * sizeof(ACTIVE_TEST_TYPE)),
            *z_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    srandom(RAND_SEED);

    for (size_t x = 0; x < count; ++x) {
      x_n[x] = random() & ACTIVE_TEST_TYPE_MAX;
      y_n[x] = random() & ACTIVE_TEST_TYPE_MAX;
    }

    void *args_n[] = {x_n, y_n, z_n, &count};

    perform_benchmark("vec_and", WARMUP_COUNT, BENCH_COUNT, false, test_vec_and_n, args_n);

    free(x_n);
    free(y_n);
    free(z_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *x_c = malloc_array(desc), *y_c = malloc_array(desc), *z_c = malloc_array(desc);
    size_t count_c = byte_size(desc);

    srandom(RAND_SEED);

    for (size_t x = 0; x < count; ++x) {
      ACTIVE_TEST_SET(desc, x_c, x, random() & ACTIVE_TEST_TYPE_MAX);
      ACTIVE_TEST_SET(desc, y_c, x, random() & ACTIVE_TEST_TYPE_MAX);
    }

    void *args_c[] = {desc, x_c, y_c, z_c, &count_c};

    perform_benchmark("vec_and", WARMUP_COUNT, BENCH_COUNT, true, test_vec_and_c, args_c);

    free_desc(desc);
    free(x_c);
    free(y_c);
    free(z_c);
  }
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_add_n(void **args) {
  ACTIVE_TEST_TYPE *x = args[0], *y = args[1], *z = args[2];
  size_t count = *((size_t *) args[3]);

  for (size_t ix = 0; ix < count; ++ix)
    z[ix] = x[ix] + y[ix];
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_add_c(void **args) {
  ArrayDesc *desc = args[0];
  void *x = args[1], *y = args[2], *z = args[3];

  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, NULL, NULL, bulk_add, NULL);
}
#pragma GCC pop_options

void test_vec_add(size_t count) {
  {
    ACTIVE_TEST_TYPE *x_n = malloc(count * sizeof(ACTIVE_TEST_TYPE)),
            *y_n = malloc(count * sizeof(ACTIVE_TEST_TYPE)),
            *z_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    srandom(RAND_SEED);

    for (size_t x = 0; x < count; ++x) {
      x_n[x] = random() & ACTIVE_TEST_TYPE_MAX;
      y_n[x] = random() & ACTIVE_TEST_TYPE_MAX;
    }

    void *args_n[] = {x_n, y_n, z_n, &count};

    perform_benchmark("vec_add", WARMUP_COUNT, BENCH_COUNT, false, test_vec_add_n, args_n);

    free(x_n);
    free(y_n);
    free(z_n);
  }

  {
    ArrayDesc *desc = add_redundancy(alloc_desc(ACTIVE_TEST_BITS, 1, count), 1);
    void *x_c = malloc_array(desc), *y_c = malloc_array(desc), *z_c = malloc_array(desc);
    size_t count_c = byte_size(desc);

    srandom(RAND_SEED);

    for (size_t x = 0; x < count; ++x) {
      ACTIVE_TEST_SET(desc, x_c, x, random() & ACTIVE_TEST_TYPE_MAX);
      ACTIVE_TEST_SET(desc, y_c, x, random() & ACTIVE_TEST_TYPE_MAX);
    }

    void *args_c[] = {desc, x_c, y_c, z_c, &count_c};

    perform_benchmark("vec_add", WARMUP_COUNT, BENCH_COUNT, true, test_vec_add_c, args_c);

    free_desc(desc);
    free(x_c);
    free(y_c);
    free(z_c);
  }
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_scan_n(void **args) {
  ACTIVE_TEST_TYPE *x = args[0];
  size_t count = *((size_t *) args[1]);
  ACTIVE_TEST_TYPE find_value = *((ACTIVE_TEST_TYPE *) args[2]);

  for (size_t i = 0; i < count; ++i)
    if (x[i] == find_value)
      return;
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_scan_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];

  bulk_scan(desc, data, NULL, NULL, scan_find_value, args[2]);
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_scan_c2(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t size = dim_size(desc, 0);
  ACTIVE_TEST_TYPE find_value = *((ACTIVE_TEST_TYPE *) args[2]);

  for (size_t i = 0; i < size; ++i)
    if (ACTIVE_TEST_GET(desc, data, i) == find_value)
      break;
}
#pragma GCC pop_options

void test_vec_scan_triple(size_t size) {
  {
    ACTIVE_TEST_TYPE *data_n = calloc(size, sizeof(ACTIVE_TEST_TYPE));
    size_t count_n = size;

    ACTIVE_TEST_TYPE find_value_n = -1;

    void *args_n[] = {data_n, &count_n, &find_value_n};

    perform_benchmark("vec_find", WARMUP_COUNT, BENCH_COUNT, false, test_vec_scan_n, args_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, size);
    void *data = calloc_array(desc);

    uint64_t find_value_c = -1;
    void *args_c[] = {desc, data, &find_value_c};

    perform_benchmark(NULL, WARMUP_COUNT, BENCH_COUNT, false, test_vec_scan_c, args_c);

    free_desc(desc);
    free(data);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, size);
    void *data = calloc_array(desc);

    ACTIVE_TEST_TYPE find_value_c2 = -1;
    void *args_c2[] = {desc, data, &find_value_c2};

    perform_benchmark("vec_find", WARMUP_COUNT, BENCH_COUNT, true, test_vec_scan_c2, args_c2);

    free_desc(desc);
    free(data);
  }
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_bulk_set_n(void **args) {
  ACTIVE_TEST_TYPE *data = args[0];
  size_t count = *((size_t *) args[1]);

  for (size_t x = 0; x < count; ++x)
    data[x] = x & ACTIVE_TEST_TYPE_MAX;
}
#pragma GCC pop_options

uint64_t test_vec_bulk_set_c_action(const size_t *index, __attribute__((unused)) void *arg) {
  return *index & ACTIVE_TEST_TYPE_MAX;
}

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_bulk_set_c(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];

  bulk_set(desc, data, NULL, NULL, test_vec_bulk_set_c_action, NULL);
}
#pragma GCC pop_options

#pragma GCC push_options
#pragma GCC optimize ("O0")
void test_vec_bulk_set_c2(void **args) {
  ArrayDesc *desc = args[0];
  void *data = args[1];
  size_t count = *((size_t *) args[2]);

  for (size_t x = 0; x < count; ++x)
    ACTIVE_TEST_SET(desc, data, x, x & ACTIVE_TEST_TYPE_MAX);
}
#pragma GCC pop_options

void test_vec_bulk_set(size_t count) {
  {
    ACTIVE_TEST_TYPE *data_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    void *args_n[] = {data_n, &count};

    perform_benchmark("vec_bulk_set", WARMUP_COUNT, BENCH_COUNT, false, test_vec_bulk_set_n, args_n);

    free(data_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *data_c = malloc_array(desc);
    size_t count_c = byte_size(desc);

    void *args_c[] = {desc, data_c, &count_c};

    perform_benchmark("vec_bulk_set", WARMUP_COUNT, BENCH_COUNT, true, test_vec_bulk_set_c, args_c);

    free_desc(desc);
    free(data_c);
  }
}

void test_vec_bulk_set_triple(size_t count) {
  {
    ACTIVE_TEST_TYPE *data_n = malloc(count * sizeof(ACTIVE_TEST_TYPE));

    void *args_n[] = {data_n, &count};

    perform_benchmark("vec_bulk_set", WARMUP_COUNT, BENCH_COUNT, false, test_vec_bulk_set_n, args_n);

    free(data_n);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *data_c = malloc_array(desc);
    size_t count_c = byte_size(desc);

    void *args_c[] = {desc, data_c, &count_c};

    perform_benchmark(NULL, WARMUP_COUNT, BENCH_COUNT, false, test_vec_bulk_set_c, args_c);

    free_desc(desc);
    free(data_c);
  }

  {
    ArrayDesc *desc = alloc_desc(ACTIVE_TEST_BITS, 1, count);
    void *data_c = malloc_array(desc);
    size_t count_c = byte_size(desc);

    void *args_c2[] = {desc, data_c, &count, &count_c};

    perform_benchmark("vec_bulk_set", WARMUP_COUNT, BENCH_COUNT, true, test_vec_bulk_set_c2, args_c2);

    free_desc(desc);
    free(data_c);
  }
}

void test_vec(size_t count) {
//  test_vec_alloc(count);
  test_vec_get(count);
  test_vec_set(count);
  test_vec_fill(count);
  test_vec_and(count);
  test_vec_add(count);
  test_vec_bulk_set(count);
}
