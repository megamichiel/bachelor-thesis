#include <stdio.h>
#include <string.h>
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

//#define TEST_FUNCTIONS true

bool parse_args(int argc, char *argv[], int offset, size_t *out, int count, const char *usage) {
  if (argc < offset + count) {
    printf("Usage: %s %s %s\n", argv[0], argv[1], usage);
    return false;
  }

  char *end;

  for (int x = 0; x < count; ++x) {
    out[x] = strtoll(argv[offset + x], &end, 10);
    if (*end != 0) {
      printf("Argument %i must be an integer!\n", offset + x);
      return false;
    }
  }

  return true;
}

int main(int argc, char *argv[]) {
  #if TEST_FUNCTIONS
    ArrayDesc *desc = alloc_desc(7, 1, 64);
    void *data = malloc_array(desc);

    bulk_set(desc, data, NULL, NULL, init_data, NULL);
//     bulk_fill(desc, data, NULL, NULL, 24);

    print_vec(desc, data);

    uint64_t find_value = 42;
    size_t *index = bulk_scan(desc, data, NULL, NULL, scan_find_value, &find_value);
    printf("Found value %i at %zu\n", index == NULL ? -1 : array_get64(desc, data, *index), index == NULL ? -1 : *index);

    uint64_t num_odd = 0;
    bulk_scan(desc, data, NULL, NULL, count_odd, &num_odd);
    printf("Number of odd elements: %zu\n", num_odd);

    uint64_t sum = 0;
    bulk_scan(desc, data, NULL, NULL, count_sum, &sum);
    printf("Sum of list: %zu\n", sum);
  #else
    if (argc > 1) {
      if (!strcmp(argv[1], "all")) {
        size_t sizes[3];
        if (!parse_args(argc, argv, 2, sizes, 3, "<vec size> <mat size> <tsr size>"))
          return 1;

        printf("Test,Normal,Custom\n");
        test_vec(sizes[0]);
        test_mat(sizes[1]);
        test_tsr(sizes[2]);
      } else if (!strcmp(argv[1], "vec")) {
        size_t size;
        if (!parse_args(argc, argv, 2, &size, 1, "<size>"))
          return 1;

        printf("Test,Normal,Custom\n");
        test_vec(size);
      } else if (!strcmp(argv[1], "bulk")) {
        size_t size;
        if (!parse_args(argc, argv, 2, &size, 1, "<size>"))
          return 1;

        printf("Test,Normal,Bulk,Manual\n");
        test_vec_scan_triple(size);
        test_vec_bulk_set_triple(size);
      } else {
        printf("Unknown command: %s\n", argv[1]);
        return 1;
      }
    } else {
      printf("Usage: %s (all|vec|bulk|window)\n", argv[0]);
    }
  #endif

  return 0;
}
