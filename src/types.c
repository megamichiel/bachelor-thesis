//
// Created by michiel on 30/9/21.
//

#include "types.h"

uint64_t bit_mask(uint8_t num_bits) {
  return num_bits == 64 ? UINT64_MAX : ~(UINT64_MAX << num_bits);
}
