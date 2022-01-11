
#include <stdio.h>
#include <time.h>

#include "tests.h"
#include "ops_basic.h"

void perform_benchmark(const char *name, int warmup, int iterations, void (*func)(void **), void **args) {
  // First, warp up
  printf("Benchmark %s (%i//%i): ", name, warmup, iterations);

  while (--warmup >= 0)
    func(args);

  float start = (float) clock() / CLOCKS_PER_SEC;

  // Then perform the tasks
  while (--iterations >= 0)
    func(args);

  printf("%fs\n", (float) clock() / CLOCKS_PER_SEC - start);
}
