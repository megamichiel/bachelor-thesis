#include <memory.h>
#include "ops.h"
#include "impl_compact.c"

#define gen_mask(bits, mask, imask, hi, shift) for (hi = 0, imask = 0; hi < 64; hi += bits) imask |= mask << hi; shift = hi - 64; hi -= bits

#define BULK_FILL_ARRAY false

#define next_mask(bits, hi, shift, offset, imask, nmask) \
  nmask = imask << offset | imask >> (hi - offset);\
  if ((offset += shift) >= bits) offset -= bits

void bulk_fill_default(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t val) {
  val &= desc->mask;

  uint64_t *row_data;

  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, dim * sizeof(size_t));

  size_t cur_dim;

  uint64_t base_mask, vz;
  size_t iz;
  uint8_t bz, highest_index, shift, val_offset;
  gen_mask(bits, val, base_mask, highest_index, shift);

  // Update row by row
  do {
    iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
    row_data = (uint64_t *) data + (iz >> 6);
    rem_bits = row_bits;

    // Align to full array indices
    if (bz && bz + rem_bits >= 64) {
      next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
      *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
      rem_bits -= 64 - bz, ++row_data, bz = 0;
    }

    // Set each index
    if (shift == 0)
      for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
        *row_data++ = base_mask;
    else
      for (; rem_bits >= 64; rem_bits -= 64) { // assert(bz == 0)
        next_mask(bits, highest_index, shift, val_offset, base_mask, *row_data++);
      }

    // Set the last index
    next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
    *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

#define next_mask_arr(bits, shift, offset, arr, nmask) \
  nmask = arr[offset];\
  if ((offset += shift) >= bits) offset -= bits

// This version uses an array to store uint64 values
void bulk_fill(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t val) {
  val &= desc->mask;

  uint64_t *row_data;

  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, dim * sizeof(size_t));

  size_t cur_dim;

  uint64_t base_mask, vz;
  size_t iz;
  uint8_t bz, highest_index, shift, val_offset = 0;
  gen_mask(bits, val, base_mask, highest_index, shift);

#if BULK_USE_ARRAYS
  uint64_t *bulk_fill_buf = desc->bulk_fill_buf;
  size_t start_offset = val_offset;

  // Generate mask for each val_offset
  do {
    next_mask(bits, highest_index, shift, val_offset, base_mask, bulk_fill_buf[val_offset]);
  } while (val_offset != start_offset);
#endif

  // Update row by row
  do {
    iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
    row_data = (uint64_t *) data + (iz >> 6);
    rem_bits = row_bits;

    // Align to full array indices
    if (bz && bz + rem_bits >= 64) {
#if BULK_USE_ARRAYS
      next_mask_arr(bits, shift, val_offset, bulk_fill_buf, vz);
#else
      next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
#endif
      *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
      rem_bits -= 64 - bz, ++row_data, bz = 0;
    }

    // Set each index
    if (shift == 0)
      for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
        *row_data++ = base_mask;
    else
      for (; rem_bits >= 64; rem_bits -= 64) { // assert(bz == 0)
#if BULK_USE_ARRAYS
        next_mask_arr(bits, shift, val_offset, bulk_fill_buf, *row_data++);
#else
        next_mask(bits, highest_index, shift, val_offset, base_mask, *row_data++);
#endif
      }

    // Set the last index
#if BULK_USE_ARRAYS
    next_mask_arr(bits, shift, val_offset, bulk_fill_buf, vz);
#else
    next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
#endif
    *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

#define gen_values(index, hi_dim, bits_per_val, mask, bit, generated, highest_bit, action, arg, v) \
  v = generated >> (bits_per_val - bit); \
  for (; bit < highest_bit; bit += bits_per_val) { \
    v |= (generated = action(index, arg) & mask) << bit; \
    ++rel_offset[hi_dim]; \
  } \
  bit -= highest_bit

#define gen_values_fast(index, hi_dim, bits_per_val, mask, bit, highest_bit, action, arg, v) \
  for (v = 0; bit < highest_bit; bit += bits_per_val) { \
    v |= (action(index, arg) & mask) << bit; \
    ++rel_offset[hi_dim]; \
  } \
  bit -= highest_bit

void bulk_set(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t (*action)(const size_t *, void *), void *arg) {
  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  uint64_t mask = desc->mask;
  size_t hi_dim = desc->dim - 1,
       row_bits = count[hi_dim] * bits, rem_bits;

  if (row_bits == 0)
    return;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, desc->dim * sizeof(size_t));

  size_t iz;
  uint64_t *row_data, vz, generated = 0;
  uint8_t val_offset;

  size_t cur_dim;

  bool fast = 64 % bits == 0;

  // Update row by row
  do {
    rel_offset[hi_dim] = 0;
    iz = bit_index_offset(desc, rel_offset, offset);
    row_data = (uint64_t *) data + (iz >> 6);
    iz &= 63, val_offset = iz;
    rem_bits = row_bits;

    // Align to full array indices
    if (iz && iz + rem_bits >= 64) {
      gen_values(rel_offset, hi_dim, bits, mask, val_offset, generated, 64, action, arg, vz);
      *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
      rem_bits -= 64 - iz, ++row_data, iz = 0;
    }

    // Set each index
    if (fast)
      for (; rem_bits >= 64; rem_bits -= 64) { // assert(bz == 0)
        gen_values_fast(rel_offset, hi_dim, bits, mask, val_offset, 64, action, arg, vz);
        *row_data++ = vz;
      }
    else
      for (; rem_bits >= 64; rem_bits -= 64) { // assert(bz == 0)
        gen_values(rel_offset, hi_dim, bits, mask, val_offset, generated, 64, action, arg, vz);
        *row_data++ = vz;
      }

    // Set the last index
    gen_values(rel_offset, hi_dim, bits, mask, val_offset, generated, iz + rem_bits, action, arg, vz);
    *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;

    for (cur_dim = hi_dim - 1; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

// Assumes little-endian
void bulk_op(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, const void *y, const size_t *oy,
        const ArrayDesc *dz, void *z, const size_t *oz,
        const size_t *count,
        uint64_t (*action)(uint64_t, uint64_t, uint64_t *, uint64_t, void *), void *arg
) {
  if (count == NULL)
    count = dz->sizes;

  uint8_t bits = dz->num_bits;
  size_t dim = dz->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *offset = dz->bulk_op_offset;
  memset(offset, 0, dim * sizeof(size_t));

  size_t cur_dim = 0, ix, iy, iz;
  uint8_t val_offset;

  const uint64_t *data_x, *data_y;
  uint64_t *data_z;

  uint64_t vx, vy, vz, carry, nx, ny;

  uint64_t base_mask;
  uint8_t highest_index, shift;
  gen_mask(bits, dz->mask, base_mask, highest_index, shift);

#if BULK_USE_ARRAYS
  uint64_t *bulk_fill_buf = dz->bulk_fill_buf;
  size_t start_offset = val_offset;

  // Generate mask for each val_offset
  do {
    next_mask(bits, highest_index, shift, val_offset, base_mask, bulk_fill_buf[val_offset]);
  } while (val_offset != start_offset);
#endif

  while (cur_dim != SIZE_MAX) {
    // Array indices
    ix = bit_index_offset(dx, offset, ox);
    iy = bit_index_offset(dy, offset, oy);
    iz = bit_index_offset(dz, offset, oz);

    // Byte/bit indices
    data_x = (uint64_t *) x + (ix >> 6);
    data_y = (uint64_t *) y + (iy >> 6);
    data_z = (uint64_t *) z + (iz >> 6);

    ix &= 63, iy &= 63, iz &= 63;

    rem_bits = row_bits;

    nx = *data_x++, ny = *data_y++, carry = 0, val_offset = iz;

    // First, gather bits until iz = 0
    if (iz && iz + rem_bits >= 64) {
      vx = nx >> ix, nx = *data_x++;
      if ((ix += 64 - iz) >= 64 && (ix -= 64))
        vx |= nx << (64 - ix);

      vy = ny >> iy, ny = *data_y++;
      if ((iy += 64 - iz) >= 64 && (iy -= 64))
        vy |= ny << (64 - iy);

#if BULK_USE_ARRAYS
      next_mask_arr(bits, shift, val_offset, bulk_fill_buf, vz);
#else
      next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
#endif
      vz = action(vx << iz, vy << iz, &carry, vz, arg);

      *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));

      rem_bits -= 64 - iz, ++iz, iz = 0;
    }

    if (shift == 0) {
      if (ix || iy) {
        for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
          vx = nx >> ix, nx = *data_x++;
          vy = ny >> iy, ny = *data_y++;

          if (ix) vx |= nx << (64 - ix);
          if (iy) vy |= ny << (64 - iy);

          *data_z++ = action(vx, vy, &carry, base_mask, arg);
        }
      } else {
        for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
          vx = nx, nx = *data_x++;
          vy = ny, ny = *data_y++;

          *data_z++ = action(vx, vy, &carry, base_mask, arg);
        }
      }
    } else if (ix || iy) {
      for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
        vx = nx >> ix, nx = *data_x++;
        vy = ny >> iy, ny = *data_y++;

        if (ix) vx |= nx << (64 - ix);
        if (iy) vy |= ny << (64 - iy);

#if BULK_USE_ARRAYS
        next_mask_arr(bits, shift, val_offset, bulk_fill_buf, vz);
#else
        next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
#endif
        *data_z++ = action(vx, vy, &carry, vz, arg);
      }
    } else {
      for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
        vx = nx, nx = *data_x++;
        vy = ny, ny = *data_y++;

#if BULK_USE_ARRAYS
        next_mask_arr(bits, shift, val_offset, bulk_fill_buf, vz);
#else
        next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
#endif
        *data_z++ = action(vx, vy, &carry, vz, arg);
      }
    }

    if (rem_bits) {
      vx = nx >> ix, nx = *data_x;
      vy = ny >> iy, ny = *data_y;

      if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
      if (iy + rem_bits >= 64) vy |= ny << (64 - iy);

#if BULK_USE_ARRAYS
      next_mask_arr(bits, shift, val_offset, bulk_fill_buf, vz);
#else
      next_mask(bits, highest_index, shift, val_offset, base_mask, vz);
#endif
      vz = action(vx, vy, &carry, vz, arg);

      *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
    }

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
      offset[cur_dim] = 0;
  }
}

#define find_step(index, hi_dim, bits_per_val, mask, bit, highest_bit, action, arg, d, val) {\
  val = *(d++);\
  while (bit + bits_per_val <= highest_bit) {\
    if (action(index, (val >> bit) & mask, arg))\
      return index;\
    index[hi_dim]++;\
    bit += bits_per_val;\
  }\
  if (bit < highest_bit) {\
    if (action(index, (val >> bit | *d << (highest_bit - bit)) & mask, arg))\
      return index;\
    index[hi_dim]++;\
    bit += bits_per_val;\
  }\
  bit -= highest_bit;\
}

size_t *bulk_scan(
        const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count,
        bool (*action)(const size_t *, uint64_t, void *), void *arg
) {
  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  size_t hi_dim = desc->dim - 1, row_bits = count[hi_dim] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, desc->dim * sizeof(size_t));

  uint64_t *data64, vz;
  size_t iz;
  uint8_t val_offset;

  size_t cur_dim;

  // Update row by row
  do {
    rel_offset[hi_dim] = 0;
    iz = bit_index_offset(desc, rel_offset, offset);
    data64 = (uint64_t *) data + (iz >> 6);
    val_offset = iz & 63;
    rem_bits = row_bits;

    if (val_offset + rem_bits >= 64) {
      rem_bits -= 64 - val_offset;
      find_step(rel_offset, hi_dim, bits, desc->mask, val_offset, 64, action, arg, data64, vz)

      while (rem_bits >= 64) {
        find_step(rel_offset, hi_dim, bits, desc->mask, val_offset, 64, action, arg, data64, vz)

        rem_bits -= 64;
      }
    }

    if (rem_bits > 0)
      find_step(rel_offset, hi_dim, bits, desc->mask, val_offset, rem_bits, action, arg, data64, vz)

    for (cur_dim = hi_dim - 1; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);

  return NULL;
}
