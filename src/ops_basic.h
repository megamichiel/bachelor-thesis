//
// Created by michiel on 30/12/21.
//

#ifndef THESIS_OPS_BASIC_H
#define THESIS_OPS_BASIC_H

uint64_t bulk_add(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  uint64_t z = (x + y + *carry) & mask;
  *carry = x > UINT64_MAX - y || (*carry == 1 && x + y == UINT64_MAX) ? 1 : 0;
  return z;
}

uint64_t bulk_sub(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  uint64_t z = ((x | ~mask) - y - *carry) & mask;
  *carry = x < y || (*carry == 1 && x == y) ? 1 : 0;
  return z;
}

uint64_t bulk_and(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return x & y;
}

uint64_t bulk_or(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return x | y;
}

uint64_t bulk_xor(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return x ^ y;
}

uint64_t bulk_not(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask) {
  return ~x;
}

bool bulk_find_value(const size_t *index, uint64_t value, void *arg) {
  return value == *((uint64_t *) arg);
}

#endif //THESIS_OPS_BASIC_H
