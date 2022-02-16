#ifndef THESIS_IMPL_H
#define THESIS_IMPL_H

#include "types.h"

ArrayDesc *alloc_desc(uint8_t num_bits, size_t dim, ...);
ArrayDesc *add_redundancy(ArrayDesc *desc, uint8_t redundant_bits);

#define alloc_desc_redundant(num_bits, redundant_bits, dim, ...) add_redundancy(alloc_desc(num_bits, dim, __VA_ARGS__), redundant_bits)

void *malloc_array(const ArrayDesc *desc);
void *calloc_array(const ArrayDesc *desc);
void free_desc(ArrayDesc *desc);

#define static_alloc_desc(name, num_bits, dim, ...) static ArrayDesc *name = NULL; if (name == NULL) name = alloc_desc(num_bits, dim, __VA_ARGS__)
#define static_malloc_array(name, desc) static void *name = NULL; if (name == NULL) name = malloc_array(desc)

uint64_t desc_mask(const ArrayDesc *desc);
size_t bit_count(const ArrayDesc *desc);
size_t dim_count(const ArrayDesc *desc);
size_t get_spread(const ArrayDesc *desc);
size_t get_size(const ArrayDesc *desc);
size_t dim_size(const ArrayDesc *desc, size_t d);
size_t byte_size(const ArrayDesc *desc);
size_t get_index(const ArrayDesc *desc, ...);

uint8_t array_get8(const ArrayDesc *desc, const void *data, size_t index);
uint16_t array_get16(const ArrayDesc *desc, const void *data, size_t index);
uint32_t array_get32(const ArrayDesc *desc, const void *data, size_t index);
uint64_t array_get64(const ArrayDesc *desc, const void *data, size_t index);

// #define sign_extend(i, bits, max) ((i & 1 << (bits - 1)) ? max << bits | i : i)

// TODO add signed versions for get operations, because those need sign extension. Setting doesn't need a different version

void array_set8(const ArrayDesc *desc, void *data, size_t index, uint8_t val);
void array_set16(const ArrayDesc *desc, void *data, size_t index, uint16_t val);
void array_set32(const ArrayDesc *desc, void *data, size_t index, uint32_t val);
void array_set64(const ArrayDesc *desc, void *data, size_t index, uint64_t val);

#endif
