#include <stddef.h>
#include <stdio.h>
//#include "types.h"
#include "impl.h"
#include "array_desc.c"

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

  /*init_fib(fib);

  for (size_t index = 2; index < count; ++index)
    update_fib(fib, index);*/

  with {
    ([0] <= [i] <= [1]) : 1;
    ([2] <= [i] < [count]) : fib[i - 2] + fib[i - 1]
  } : modarray(fib);

  fib_number test[3][3];

  with {
    ([0, 0] <= [i, j] < [3, 3]) : i * 3 + j
  } : modarray(test);

  printf("Size %i\n", sizeof(fib_number));

  for (size_t index = 0; index < count; ++index) {
    printf("%u ", fib[index]);
  }
  printf("\n");
  return 0;
}

void random() {
  size_t count = 10;

  fib_number sth[count][count];

  fib_number *arr = calloc(1, byte_count(6, 1, count));

  arr[0] = 1;
  arr[1] = 2;

  fib_number *test[3];

  test[0] = arr;
  test[0][2] = 3;
//  *(test[0] + 3) = 4;

  (test[0])[4] = 5;

  fib_number last = test[0][5];
}
