//
// Created by michiel on 30/9/21.
//

#include <stdio.h>
#include <malloc.h>
#include <stdarg.h>
#include "impl.h"

struct ARRAY_DESC {
  uint8_t num_bytes;
  size_t dim, *sizes, size;
  uint64_t mask;
};

size_t byte_count(uint8_t num_bits, size_t dim, ...) {
  size_t size = 1;

  va_list argp;
  va_start(argp, dim);
  for (int d = 0; d < dim; ++d)
    size *= va_arg(argp, size_t);
  va_end(argp);

  uint8_t num_bytes = num_bits > 32 ? 8 : num_bits > 16 ? 4 : num_bits > 8 ? 2 : 1;

  return size * num_bytes;
}

ArrayDesc *alloc_desc(uint8_t num_bits, size_t dim, ...) {
  size_t *sizes = malloc(dim * sizeof(size_t)), size = 0;

  va_list argp;
  va_start(argp, dim);
  for (int d = 0; d < dim; ++d)
    size *= (sizes[d] = va_arg(argp, size_t));
  va_end(argp);

  ArrayDesc *out = malloc(sizeof(ArrayDesc));

  uint8_t num_bytes = num_bits > 32 ? 8 : num_bits > 16 ? 4 : num_bits > 8 ? 2 : 1;

  out->num_bytes = num_bytes;
  out->dim = dim;
  out->sizes = sizes;
  out->size = size;
  out->mask = bit_mask(num_bits);

  return out;
}

void *malloc_array(ArrayDesc *desc) {
  return calloc(desc->num_bytes, desc->size);
}

size_t get_size(ArrayDesc *desc) {
  return desc->size;
}

size_t get_index(ArrayDesc *desc, ...) {
  va_list argp;
  va_start(argp, desc);
  size_t bit = va_arg(argp, size_t);
  for (int d = 0; d + 1 < desc->dim; ++d)
    bit = bit * va_arg(argp, size_t) + desc->sizes[d];
  va_end(argp);

  return bit;
}

#define array_get(name, type) type name(ArrayDesc *desc, const type *data, size_t index) {\
  return data[index];\
}

#define array_set(name, type) type name(ArrayDesc *desc, type *data, size_t index, type val) {\
  return data[index] = val & desc->mask;\
}

array_get(array_get8, uint8_t)
array_get(array_get16, uint16_t)
array_get(array_get32, uint32_t)
array_get(array_get64, uint64_t)

array_set(array_set8, uint8_t)
array_set(array_set16, uint16_t)
array_set(array_set32, uint32_t)
array_set(array_set64, uint64_t)
