
#include <stdio.h>
#include <time.h>

#include "tests.h"
#include "ops_basic.h"

void perform_benchmark(const char *name, int warmup, int iterations, bool newline, void (*func)(void **), void **args) {
  // First, warp up
  if (!newline && name != NULL)
    printf("%s,", name);

  while (--warmup >= 0)
    func(args);

  float start = (float) clock() / CLOCKS_PER_SEC;

  // Then perform the tasks
  while (--iterations >= 0)
    func(args);

  printf(newline ? "%f\n" : "%f,", (float) clock() / CLOCKS_PER_SEC - start);
}
