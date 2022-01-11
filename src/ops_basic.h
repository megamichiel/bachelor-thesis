//
// Created by michiel on 30/12/21.
//

#ifndef THESIS_OPS_BASIC_H
#define THESIS_OPS_BASIC_H

#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

uint64_t bulk_add(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask);

uint64_t bulk_sub(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask);

uint64_t bulk_and(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask);

uint64_t bulk_or(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask);

uint64_t bulk_xor(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask);

uint64_t bulk_not(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask);

bool bulk_find_value(const size_t *index, uint64_t value, void *arg);

#endif //THESIS_OPS_BASIC_H
