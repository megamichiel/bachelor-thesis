#include <stdio.h>
#include <stdarg.h>
#include "impl.h"

#ifndef IMPL__COMPACT_C
#define IMPL__COMPACT_C

struct ARRAY_DESC {
  uint8_t num_bits;
  size_t dim, *sizes, size;
  uint64_t mask;

  size_t *bulk_op_offset;
};

#ifdef PAD_ROWS
  #define pad_row(bits) ((bits + 63) & ~7)
#else
  #define pad_row(bits) bits
#endif

/*size_t ceil(size_t size, size_t div) {
  return (size + div - 1) & ~(div - 1);
}*/

size_t byte_count(uint8_t num_bits, size_t dim, ...) {
  size_t size = 1;

  va_list argp;
  va_start(argp, dim);
  for (int d = 0; d < dim; ++d)
    size *= va_arg(argp, size_t);
  va_end(argp);

  return (num_bits * size + 63) >> 3;
}

ArrayDesc *alloc_desc(uint8_t num_bits, size_t dim, ...) {
  size_t *sizes = malloc(dim * sizeof(size_t)), size = 1;

  va_list argp;
  va_start(argp, dim);
  for (int d = 0; d < dim; ++d)
    size *= (sizes[d] = va_arg(argp, size_t));
  va_end(argp);

  ArrayDesc *out = malloc(sizeof(ArrayDesc));

  out->num_bits = num_bits;
  out->dim = dim;
  out->sizes = sizes;
  out->size = size;
  out->mask = bit_mask(num_bits);

  out->bulk_op_offset = calloc(dim, sizeof(size_t));

  return out;
}

ArrayDesc *add_redundancy(ArrayDesc *desc, uint8_t redundant_bits) {
  desc->num_bits += redundant_bits;

  return desc;
}

void *malloc_array(const ArrayDesc *desc) {
  return malloc((desc->num_bits * desc->size + 63) >> 6 << 3); // Make sure it's padded to 8 bytes
}

void *calloc_array(const ArrayDesc *desc) {
  return calloc((desc->num_bits * desc->size + 63) >> 6 << 3, 1); // Make sure it's padded to 8 bytes
}

void free_desc(ArrayDesc *desc) {
  free(desc->sizes);
  free(desc->bulk_op_offset);
  free(desc);
}

uint64_t desc_mask(const ArrayDesc *desc) {
  return desc->mask;
}

size_t bit_count(const ArrayDesc *desc) {
  return desc->num_bits;
}

size_t dim_count(const ArrayDesc *desc) {
  return desc->dim;
}

size_t gcd(size_t a, size_t b) {
  return a == 0 ? b : b == 0 ? a : a == b ? a : a > b ? gcd(a-b, b) : gcd(a, b-a);
}

size_t lcm(size_t a, size_t b) {
  return a * b / gcd(a, b);
}

size_t get_spread(const ArrayDesc *desc) {
  size_t b = desc->num_bits;
  if (b <= 8)
    b = 8;
  else if (b <= 16)
    b = 16;
  else if (b <= 32)
    b = 32;
  else
    b = 64;

  return lcm(desc->num_bits, b) / desc->num_bits;
}

size_t get_size(const ArrayDesc *desc) {
  return desc->size;
}

size_t dim_size(const ArrayDesc *desc, size_t dim) {
  return desc->sizes[dim];
}

size_t byte_size(const ArrayDesc *desc) {
  return (desc->num_bits * desc->size + 63) >> 6 << 3;
}

size_t get_index(const ArrayDesc *desc, ...) {
  va_list argp;
  va_start(argp, desc);
  size_t bit = va_arg(argp, size_t);
  for (int d = 0; d + 1 < desc->dim; ++d)
    bit = bit * desc->sizes[d] + va_arg(argp, size_t);
  va_end(argp);

  return bit;
}

size_t bit_index(const ArrayDesc *desc, const size_t *index) {
  size_t out = index[0], dim = desc->dim;

  for (size_t d = 1; d + 1 < dim; ++d)
    out = out * desc->sizes[d] + index[d];

  return out * pad_row(desc->sizes[dim - 1] * desc->num_bits) + index[dim - 1] * desc->num_bits;
}

size_t bit_index_offset(const ArrayDesc *desc, const size_t *index, const size_t *offset) {
  size_t out = 0, max_d = desc->dim - 1;

  if (offset == NULL)
    for (size_t d = 0; d < max_d; ++d)
      out = out * desc->sizes[d] + index[d];
  else
    for (size_t d = 0; d < max_d; ++d)
      out = out * desc->sizes[d] + index[d] + offset[d];

  return out * pad_row(desc->sizes[max_d] * desc->num_bits) + (index[max_d] + (offset == NULL ? 0 : offset[max_d])) * desc->num_bits;
}

// TODO don't shift >> 3, because then you will get addresses that aren't a multiple of the number used
// This works fine on my pc, but this behaviour isn't guaranteed, so it should be fixed
#define array_get(name, type, bits) type name(const ArrayDesc *desc, const void *data, size_t index) {\
  type *data_ = (type *) (data + ((index *= desc->num_bits) >> 3));\
  index &= 7;\
  \
  type out = data_[0] >> index;\
  if (index + desc->num_bits > bits)\
    out |= data_[1] << (bits - index);\
  \
  return out & desc->mask;\
}

// TODO do the same here as in array_get
#define array_set(name, type, bits) void name(const ArrayDesc *desc, void *data, size_t index, type val) {\
  type *data_ = (type *) (data + ((index *= desc->num_bits) >> 3));\
  index &= 7;\
  val &= desc->mask;\
  data_[0] = data_[0] & ~(desc->mask << index) | val << index;\
  if (index + desc->num_bits > bits) {\
    index = bits - index;\
    data_[1] = data_[1] & ~(desc->mask >> index) | val >> index;\
  }\
}

array_get(array_get8, uint8_t, 8)
array_get(array_get16, uint16_t, 16)
array_get(array_get32, uint32_t, 32)
array_get(array_get64, uint64_t, 64)

array_set(array_set8, uint8_t, 8)
array_set(array_set16, uint16_t, 16)
array_set(array_set32, uint32_t, 32)
array_set(array_set64, uint64_t, 64)

#endif
