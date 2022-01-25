#include <stdio.h>
#include "ops.h"
#include "ops_basic.h"
#include "tests.h"

#define DEBUG

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
  #define print_vec(desc, m)
  #define print_mat(desc, m)
#endif

uint64_t init_data(const size_t *index, void *arg) {
  return *index + 1;
}

bool count_odd(const size_t *index, uint64_t value, void *arg) {
  *((uint64_t *) arg) += value & 1;
  return false;
}

bool count_sum(const size_t *index, uint64_t value, void *arg) {
  *((uint64_t *) arg) += value;
  return false;
}

#define TEST_FUNCTIONS false

int main() {
  #if TEST_FUNCTIONS
    ArrayDesc *desc = alloc_desc(7, 1, 64);
    void *data = alloc_array(desc);

    bulk_set(desc, data, NULL, NULL, init_data, NULL);
    // bulk_fill(desc, data, NULL, NULL, 24);

    print_vec(desc, data);

    uint64_t find_value = 42;
    size_t *index = bulk_find(desc, data, NULL, NULL, bulk_find_value, &find_value);
    printf("Found index: %zu\n", index == NULL ? -1 : index[0]);

    uint64_t num_odd = 0;
    bulk_find(desc, data, NULL, NULL, count_odd, &num_odd);
    printf("Number of odd elements: %zu\n", num_odd);

    uint64_t sum = 0;
    bulk_find(desc, data, NULL, NULL, count_sum, &sum);
    printf("Sum of list: %zu\n", sum);
  #else
    test_vec();
    printf("\n");
    test_mat();
    printf("\n");
    test_tsr();
    printf("\n");
  #endif

  return 0;
}
