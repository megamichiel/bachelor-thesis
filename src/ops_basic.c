
#include "ops_basic.h"

uint64_t bulk_add(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg) {
  uint64_t z = (x + y + *carry) & mask;
  *carry = (*carry == 1 ? (x >= UINT64_MAX - y) : (x > UINT64_MAX - y)) ? 1 : 0;
  return z;
}

uint64_t bulk_sub(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg) {
  uint64_t z = ((x | ~mask) - y - *carry) & mask;
  *carry = (*carry == 1 ? (x <= y) : (x < y)) ? 1 : 0;
  return z;
}

uint64_t bulk_and(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg) {
  return x & y;
}

uint64_t bulk_or(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg) {
  return x | y;
}

uint64_t bulk_xor(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg) {
  return x ^ y;
}

uint64_t bulk_not(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg) {
  return ~x;
}

bool scan_find_value(const size_t *index, uint64_t value, void *arg) {
  return value == *((uint64_t *) arg);
}
