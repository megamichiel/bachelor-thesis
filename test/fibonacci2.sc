#include <stddef.h>
#include <stdio.h>
#include "types.h"
//#include "impl.h"

typedef uint6 fib_number;

void init_fib(fib_number fib[]) {
  fib[0] = 1;
  fib[1] = 1;
}

void update_fib(fib_number fib[], size_t index) {
  fib_number val = fib[index - 2] + fib[index - 1];
  fib[index] = val;
}

int main() {
  size_t count = 10;

  fib_number fib[count];

  init_fib(fib);

  for (size_t index = 2; index < count; ++index) {
    update_fib(fib, index);
  }

  if (fib[0] == 1) {
    printf("Wow!");

    return 1;
  }

  for (size_t index = 0; index < count; ++index) {
    printf("%u ", fib[index]);
  }
  return 0;
}

void random() {
  size_t count = 10;

  fib_number sth[count][count];

  fib_number *arr = calloc(byte_count(6, count));

  arr[0] = 1;
  arr[1] = 2;

  fib_number *test[3];

  test[0] = arr;
  test[0][2] = 3;
  *(test[0] + 3) = 4;

  (*(test + 0))[4] = 5;

  fib_number last = test[0][5];

  int x = test[0];
}
