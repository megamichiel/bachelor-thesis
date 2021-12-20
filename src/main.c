#include <stdio.h>
#include <string.h>
#include <time.h>
#include <stdbool.h>
#include "impl.h"
#include "ops.h"

#define arr_bits 29
#define arr_get array_get32
#define arr_set array_set32

#define DEBUG

uint64_t plus_one(size_t i, uint64_t v) {
  return v + 1;
}

uint64_t big_add(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  uint64_t z = x + y + *carry;
  *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
  return z;
}

uint64_t big_sub(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  uint64_t z = (x | ~mask) - y - *carry;
  *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
  return z;
}

uint64_t big_or(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return x | y;
}

uint64_t big_copy(uint64_t x, uint64_t y, uint64_t *carry) {
  return x;
}

uint64_t big_not(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return ~x;
}

uint64_t big_xor(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return x ^ y;
}

void test_fib_normal() {
  size_t count = 400;

  uint8_t x[count], y[count], sum[count];

  x[0] = 1;
  x[1] = 1;

  for (size_t index = 0; index + 2 < count; ++index) {
    unsigned int val = x[index] + x[index + 1];

    x[index + 2] = val;
  }

  memcpy(y, x, sizeof(x));

  for (size_t i = 0; i < count; ++i)
    y[i] = y[i] + 1;

  for (int i = 0; i < count; ++i)
    y[i] = ~y[i];
  for (int i = 0; i < count; ++i)
    y[i] = x[i] ^ y[i];
  for (int i = 0; i < count; ++i)
    y[i] = ~y[i];

  size_t xoffset[1] = { 1 };
  size_t add_count[1] = { count - 1 };

  for (int i = 0; i < count - 1; ++i)
    sum[i] = x[i + 1] + y[i];
}

void test_fib() {
  size_t count = 400;

  ArrayDesc *desc = alloc_desc(arr_bits, 1, count);
  void *x = alloc_array(desc), *y = alloc_array(desc), *sum = alloc_array(desc);

  arr_set(desc, x, 0, 1);
  arr_set(desc, x, 1, 1);

  for (size_t index = 0; index + 2 < count; ++index) {
    unsigned int val = arr_get(desc, x, index) + arr_get(desc, x, index + 1);

    arr_set(desc, x, index + 2, val);
  }

  memcpy(y, x, byte_size(desc));

  for (size_t i = 0; i < count; ++i)
    arr_set(desc, y, i, arr_get(desc, y, i) + 1);

  bulk_unary_op(desc, y, NULL, desc, y, NULL, NULL, big_not);
  bulk_op(desc, x, NULL, desc, y, NULL, desc, y, NULL, NULL, big_xor);
  bulk_unary_op(desc, y, NULL, desc, y, NULL, NULL, big_not);

  size_t xoffset[1] = { 1 };
  size_t add_count[1] = { count - 1 };

  bulk_op(desc, x, xoffset, desc, y, NULL, desc, sum, NULL, add_count, big_add);

  #ifdef DEBUG
    for (size_t i = 0; i < count; ++i)
      printf("%u\t", arr_get(desc, x, i));
    printf("\n");

    for (size_t i = 0; i < count; ++i)
      printf("%u\t", arr_get(desc, y, i));
    printf("\n");

    for (size_t i = 0; i < count; ++i)
      printf("%u\t", arr_get(desc, sum, i));
    printf("\n");
  #endif

  free(desc);
  free(x);
  free(y);
  free(sum);
}

#ifdef DEBUG
  void print_mat(const ArrayDesc *desc, const void *m) {
    for (size_t x = 0; x < dim_size(desc, 0); ++x) {
      for (size_t y = 0; y < dim_size(desc, 1); ++y)
        printf("%i\t", arr_get(desc, m, get_index(desc, x, y)));
      printf("\n");
    }
    printf("\n");
  }
#else
  #define print_mat(desc, m);
#endif

/*void test_mat_normal() {
  uint8_t x[8][8], y[8][8], z[8][8];

  memset(x, 64, 1);
  memset(y, 64, 2);

  size_t ox[2] = { 0, 0 };
  size_t oy[2] = { 0, 0 };
  size_t oz[2] = { 3, 2 };
  size_t count[2] = { 5, 5 };

  for (int r = 0; r < 5; ++r)
    for (int c = 0; c < 5; ++c)
      z[r][c] = 2;

  for (int r = 0; r < 5; ++r)
    for (int c = 0; c < 5; ++c)
      z[3 + r][2 + c] = x[r][c] + y[r][c];
}

void init_mat(ArrayDesc **desc, void **x, void **y, void **z, size_t **ox, size_t **oy, size_t **oz, size_t **count) {
  *desc = alloc_desc(2, 2, 8, 8);

  *x = alloc_array(*desc);
  *y = alloc_array(*desc);
  *z = alloc_array(*desc);

  bulk_fill(*desc, *x, NULL, NULL, 1);
  bulk_fill(*desc, *y, NULL, NULL, 2);

  size_t ox[2] = { 0, 0 };
  size_t oy[2] = { 0, 0 };
  size_t oz[2] = { 3, 2 };
  size_t count[2] = { 5, 5 };

  bulk_fill(desc, z, NULL, count, 2);
}

void test_mat(ArrayDesc *desc, void *x, void *y, void *z, size_t *ox, size_t *oy, size_t *oz, size_t *count) {
  bulk_op(desc, x, ox, desc, y, oy, desc, z, oz, count, big_add);

  print_mat(desc, x);
  print_mat(desc, y);
  print_mat(desc, z);
}*/

uint64_t initial_b(size_t i, uint64_t v) {
  return i & 1;
}

float start_benchmark() {
  return (float) clock() / CLOCKS_PER_SEC;
}

float end_benchmark(float start) {
  return start_benchmark() - start;
}

void perform_benchmark(const char *name, int warmup, int iterations, void (*func)(void **args), void **args) {
  // First, warp up
  printf("Starting benchmark %s (%i warmups, %i iterations)\n", name, warmup, iterations);

  for (int i = 0; i < warmup; ++i)
    func(args);

  float start = start_benchmark();

  // Then perform the tasks
  for (int i = 0; i < iterations; ++i)
    func(args);

  float time = end_benchmark(start);

  printf("Benchmark %s done, time taken: %fs\n", name, time);
}

#define MAT_WARMUPS 1000
#define MAT_TEST_COUNT 10000
//#define MAT_SIZE 512
//#define MAT_SUB_SIZE 400
#define MAT_SIZE 8
#define MAT_SUB_SIZE 5

void test_mat_normal(void **args) {
  uint8_t *x = args[1], *y = args[2], *z = args[3];

  memset(z, 0, MAT_SIZE * MAT_SIZE);

  for (int py = 0; py < MAT_SUB_SIZE; ++py)
    for (int px = 0; px < MAT_SUB_SIZE; ++px)
      z[py * MAT_SIZE + px] = 2;

  for (int py = 0; py < MAT_SUB_SIZE; ++py)
    for (int px = 0; px < MAT_SUB_SIZE; ++px)
      z[(py + 3) * MAT_SIZE + px + 2] = x[py * MAT_SIZE + px] + y[py * MAT_SIZE + px];
}

void test_mat_compact(void **args) {
  ArrayDesc *desc = args[0];
  void *x = args[1], *y = args[2], *z = args[3];

  memset(z, 0, MAT_SIZE * MAT_SIZE);

  static size_t count[2] = { MAT_SUB_SIZE, MAT_SUB_SIZE }, offset[2] = { 3, 2 };

  bulk_fill(desc, z, NULL, count, 2);
  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, offset, count, big_add);
}

uint64_t init_one(size_t dim, const size_t *index) {
  return index[0] * 8 + index[1];
}

void test_mat() {
  //  perform_benchmark("mat_normal", 10000, 1000000, test_mat_normal);
//  perform_benchmark("mat", 10000, 1000000, test_mat);
  // test_mat();

  ArrayDesc *desc = alloc_desc(7, 2, MAT_SIZE, MAT_SIZE);
  uint8_t x[MAT_SIZE][MAT_SIZE], y[MAT_SIZE][MAT_SIZE], z[MAT_SIZE][MAT_SIZE];

  void *args[4] = { desc, x, y, z };

  bulk_fill(desc, x, NULL, NULL, 1);
  bulk_fill(desc, y, NULL, NULL, 2);

  test_mat_normal(args);

  print_mat(desc, z);

  /*{
    size_t offset[2] = {1, 2}, count[2] = {MAT_SUB_SIZE, MAT_SUB_SIZE};
    bulk_set(desc, x, offset, count, init_one);
  }*/

  /*{
    size_t offset_x[2] = { 0, 2 }, offset_y[2] = { 2, 2 }, offset_z[2] = { 6, 2 };
    size_t count[2] = { 2, 5 };

    bulk_op(desc, x, offset_x, desc, x, offset_y, desc, x, offset_z, count, big_add);
  }*/

//  print_mat(desc, x);



//  test_mat_normal(args);
//  test_mat(args);

//  test_mat_compact(args);
//  print_mat(desc, x);
//  print_mat(desc, y);
//  print_mat(desc, z);

//  perform_benchmark("mat_normal", MAT_WARMUPS, MAT_TEST_COUNT, test_mat_normal, args);
//  perform_benchmark("mat_compact", MAT_WARMUPS, MAT_TEST_COUNT, test_mat_compact, args);
}

#define BOOL_COUNT 65536

void test_bool_compact() {
  ArrayDesc *desc = static_alloc_desc(desc, 1, 1, BOOL_COUNT);

  void *x = static_alloc_array(x, desc);
  void *y = static_alloc_array(y, desc);
  void *z = static_alloc_array(z, desc);

  bulk_fill(desc, x, NULL, NULL, false);
  bulk_fill(desc, y, NULL, NULL, true);
}

void test_bool_normal() {
  bool x[BOOL_COUNT], y[BOOL_COUNT], z[BOOL_COUNT];

  for (int i = 0; i < BOOL_COUNT; ++i)
    x[i] = false;
  for (int i = 0; i < BOOL_COUNT; ++i)
    y[i] = true;
}

void test_bool() {
  perform_benchmark("bool_normal", 1000, 10000, test_bool_normal, NULL);
  perform_benchmark("bool_compact", 1000, 10000, test_bool_compact, NULL);
}

int main() {
//  perform_benchmark("fib_normal", 10000, 1000000, test_fib_normal);
//  perform_benchmark("fib", 10000, 1000000, test_fib);

//  test_bool();
  test_mat();

  return 0;
}
