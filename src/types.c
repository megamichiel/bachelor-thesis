//
// Created by michiel on 30/9/21.
//

#include "types.h"

uint64_t bit_mask(uint8_t num_bits) {
  uint64_t out = 0;
  for (uint8_t b = 0; b < num_bits; ++b)
    out |= 1 << b;
  return out;
}

