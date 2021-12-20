//
// Created by michiel on 30/9/21.
//

#include <malloc.h>
#include "util.h"

void hex_dump(uint8_t *arr, size_t len) {
  for (size_t i = 0; i < len; ++i)
    printf("%02x", arr[i]);
}

void dump(uint8_t *arr, size_t len) {
  for (size_t i = 0; i < len; ++i)
    printf("%u ", arr[i]);
}
