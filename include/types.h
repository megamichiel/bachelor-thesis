#ifndef THESIS_TYPES_H
#define THESIS_TYPES_H

#include <stdint.h>
#include <stdio.h>
#include <malloc.h>
#include <stdarg.h>
#include <stdlib.h>

typedef struct ARRAY_DESC ArrayDesc;

uint64_t bit_mask(uint8_t num_bits);

size_t byte_count(uint8_t num_bits, size_t dim, ...);

#endif //THESIS_TYPES_H
