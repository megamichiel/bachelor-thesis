#include <stdio.h>
#include "tests.h"

// #define DEBUG

#ifdef DEBUG
  void print_vec(const ArrayDesc *desc, const void *v) {
    for (size_t x = 0; x < dim_size(desc, 0); ++x)
      printf("%i\t", array_get32(desc, v, x));
    printf("\n");
  }
  void print_mat(const ArrayDesc *desc, const void *m) {
    for (size_t x = 0; x < dim_size(desc, 0); ++x) {
      for (size_t y = 0; y < dim_size(desc, 1); ++y)
        printf("%i\t", array_get32(desc, m, get_index(desc, x, y)));
      printf("\n");
    }
    printf("\n");
  }
#else
  #define print_vec(desc, m);
  #define print_mat(desc, m);
#endif

/*#define MAT_SIZE 512
#define MAT_SUB_SIZE 400
// #define MAT_SIZE 8
// #define MAT_SUB_SIZE 5

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

  // bulk_fill(desc, z, NULL, count, 2);
  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, offset, count, bulk_add);
}

void test_mat() {
  ArrayDesc *desc = alloc_desc(7, 2, MAT_SIZE, MAT_SIZE);
  uint8_t x[MAT_SIZE][MAT_SIZE], y[MAT_SIZE][MAT_SIZE], z[MAT_SIZE][MAT_SIZE];

  void *args[4] = { desc, x, y, z };

  bulk_fill(desc, x, NULL, NULL, 1);
  bulk_fill(desc, y, NULL, NULL, 2);

  print_mat(desc, x);
  print_mat(desc, y);

  perform_benchmark("mat_normal", WARMUP_COUNT, BENCH_COUNT, test_mat_normal, args);

  print_mat(desc, z);

  perform_benchmark("mat_compact", WARMUP_COUNT, BENCH_COUNT, test_mat_compact, args);

  print_mat(desc, z);
}

#define BOOL_COUNT 1000000

uint64_t rnd_bool(const size_t * index, void *arg) {
  return rand() % 2;
}

void task_bool_compact(void **args) {
  ArrayDesc *desc = args[0];
  bool *x = args[1], *y = args[2], *z = args[3];

  bulk_op(desc, x, NULL, desc, y, NULL, desc, z, NULL, NULL, bulk_and);
}

void test_bool_compact() {
  static_alloc_desc(desc, 1, 1, BOOL_COUNT);

  static_alloc_array(x, desc);
  static_alloc_array(y, desc);
  static_alloc_array(z, desc);

  bulk_set(desc, x, NULL, NULL, NULL, rnd_bool);
  bulk_set(desc, y, NULL, NULL, NULL, rnd_bool);

  print_vec(desc, x);
  print_vec(desc, y);

  void *args[] = { desc, x, y, z };

  perform_benchmark("bool_compact", 1000, 10000, task_bool_compact, args);

  print_vec(desc, z);
}

void task_bool_normal(void **args) {
  bool *x = args[0], *y = args[1], *z = args[2];

  for (int i = 0; i < BOOL_COUNT; ++i)
    z[i] = x[i] & y[i];
}

void test_bool_normal() {
  ArrayDesc *desc = alloc_desc(7, 1, BOOL_COUNT);
  bool *x = malloc(BOOL_COUNT), *y = malloc(BOOL_COUNT), *z = malloc(BOOL_COUNT);

  for (int i = 0; i < BOOL_COUNT; ++i)
    x[i] = rand() % 2;
  for (int i = 0; i < BOOL_COUNT; ++i)
    y[i] = rand() % 2;

  void *args[] = { x, y, z };

  print_vec(desc, x);
  print_vec(desc, y);

  perform_benchmark("bool_normal", 1000, 10000, task_bool_normal, args);

  print_vec(desc, z);
}

void test_bool() {
  test_bool_normal();
  test_bool_compact();
}*/

int main() {
  test_vec();
  printf("\n");
  test_mat();
  printf("\n");
  test_tsr();
  printf("\n");

  return 0;
}
