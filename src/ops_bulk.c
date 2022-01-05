#include <memory.h>
#include "ops.h"
#include "impl_compact.c"

inline void gen_mask(uint8_t bits, uint64_t mask, uint64_t *imask, uint8_t *hi) {
  for (*hi = 0, *imask = 0; *hi < 64; *hi += bits)
    *imask |= mask << *hi;
}

inline uint64_t next_mask(uint8_t bits, uint8_t hi, uint8_t *offset, uint64_t imask) {
  uint64_t nmask = imask << *offset | imask >> ((hi - bits) - *offset);
  if ((*offset += hi - 64) >= bits)
    *offset -= bits;
  return nmask;
}

void bulk_fill(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t val) {
  uint64_t *row_data;

  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, dim * sizeof(size_t));

  size_t cur_dim;

  uint64_t imask, vz;
  size_t iz;
  uint8_t bz, hi, val_offset;
  gen_mask(bits, val & desc->mask, &imask, &hi);

  // Update row by row
  do {
    iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, val_offset = bz;
    row_data = (uint64_t *) data + (iz >> 6);
    rem_bits = row_bits;

    // Align to full array indices
    if (bz && bz + rem_bits >= 64) {
      vz = next_mask(bits, hi, &val_offset, imask);
      *row_data = *row_data & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
      rem_bits -= 64 - bz, ++row_data, bz = 0;
    }

    // Set each index
    for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
      *row_data++ = next_mask(bits, hi, &val_offset, imask);

    // Set the last index
    vz = next_mask(bits, hi, &val_offset, imask);
    *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

inline uint64_t gen_values(size_t dim, uint8_t bits_per_val, uint64_t mask, int *bit, size_t *index, uint8_t bits, void *arg, uint64_t (*action)(const size_t *, void *)) {
  uint64_t v = 0;
  for (; *bit < bits; *bit += bits_per_val) {
    v |= (action(index, arg) & mask) << *bit;
    ++index[dim - 1];
  }
  if ((*bit -= bits) > 0) {
    *bit -= bits_per_val;
    --index[dim - 1];
  }
  return v;
}

void bulk_set(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, void *arg, uint64_t (*action)(const size_t *, void *)) {
  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  uint64_t mask = desc->mask;
  size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, dim * sizeof(size_t));

  size_t iz;
  uint64_t *row_data, vz;
  int val_offset;

  size_t cur_dim;

  // Update row by row
  do {
    rel_offset[dim - 1] = 0;
    iz = bit_index_offset(desc, rel_offset, offset);
    row_data = (uint64_t *) data + (iz >> 6);
    iz &= 63, val_offset = (int) iz;
    rem_bits = row_bits;

    // Align to full array indices
    if (iz && iz + rem_bits >= 64) {
      vz = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);
      *row_data = *row_data & ~(UINT64_MAX << iz) | vz & UINT64_MAX << iz;
      rem_bits -= 64 - iz, ++row_data, iz = 0;
    }

    // Set each index
    for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
      *(row_data++) = gen_values(dim, bits, mask, &val_offset, rel_offset, 64, arg, action);

    // Set the last index
    vz = gen_values(dim, bits, mask, &val_offset, rel_offset, iz + rem_bits, arg, action);
    *row_data = *row_data & ~(~(UINT64_MAX << rem_bits) << iz) | vz & ~(UINT64_MAX << rem_bits) << iz;

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

inline bool get_values(size_t dim, uint8_t bits_per_val, int *bit, size_t *index, uint8_t highest_bit,
                              const uint64_t *data, void *arg, bool (*action)(const size_t *, uint64_t, void *)) {
  uint64_t v = *data;

  for (; *bit < highest_bit; *bit += bits_per_val) {
    // TODO handle situation where number is spread across multiple bytes
    if (*bit + bits_per_val > highest_bit) {
      if (action(index, v >> *bit | *(data + 1) << (highest_bit - *bit) & ~(UINT64_MAX << bits_per_val), arg))
        return true;
    } else if (action(index, v >> *bit & ~(UINT64_MAX << bits_per_val), arg)) {
      return true;
    }

    ++index[dim - 1];
  }
  *bit -= highest_bit;
  return false;
}

// TODO
size_t *bulk_find(
        const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count,
        void *arg, bool (*action)(const size_t *, uint64_t, void *)
) {
  uint64_t *data64 = data;
  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, dim * sizeof(size_t));

  size_t iz;
  uint8_t bz;
  int val_offset;

  size_t cur_dim;

  // Update row by row
  do {
    rel_offset[dim - 1] = 0;
    iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
    rem_bits = row_bits;

    // Align to full array indices
    if (bz && bz + rem_bits >= 64) {
      if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
        return rel_offset;
      // data64[iz] = data64[iz] & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;
      rem_bits -= 64 - bz, bz = 0;
    }

    // Get each index
    for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
      // data64[iz++] = get_values(dim, bits, &val_offset, rel_offset, 64, arg, action);
      if (get_values(dim, bits, &val_offset, rel_offset, 64, data64 + (iz++), arg, action))
        return rel_offset;

    // Get the last index
    if (get_values(dim, bits, &val_offset, rel_offset, bz + rem_bits, data64 + iz, arg, action))
      return rel_offset;
    // data64[iz] = data64[iz] & ~(~(UINT64_MAX << rem_bits) << bz) | vz & ~(UINT64_MAX << rem_bits) << bz;

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

// Assumes little-endian
void bulk_op(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, const void *y, const size_t *oy,
        const ArrayDesc *dz, void *z, const size_t *oz,
        const size_t *count,
        uint64_t (*action)(uint64_t, uint64_t, uint64_t *, uint64_t)
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

  uint64_t imask, nmask;
  uint8_t hi;
  gen_mask(bits, dz->mask, &imask, &hi);

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

    nx = *(data_x++), ny = *(data_y++), carry = 0, val_offset = iz;

    // First, gather bits until iz = 0
    if (iz && iz + rem_bits >= 64) {
      vx = nx >> ix, nx = *(data_x++);
      if ((ix += 64 - iz) >= 64 && (ix -= 64))
        vx |= nx << (64 - ix);

      vy = ny >> iy, ny = *(data_y++);
      if ((iy += 64 - iz) >= 64 && (iy -= 64))
        vy |= ny << (64 - iy);

      nmask = next_mask(bits, hi, &val_offset, imask);
      vz = action(vx << iz, vy << iz, &carry, nmask);

      *data_z = *data_z & ~(UINT64_MAX << iz) | (vz & (UINT64_MAX << iz));

      rem_bits -= 64 - iz, ++iz, iz = 0;
    }

    for (; rem_bits >= 64; rem_bits -= 64) { // assert(iz == 0)
      vx = nx >> ix, nx = *(data_x++);
      vy = ny >> iy, ny = *(data_y++);

      if (ix) vx |= nx << (64 - ix);
      if (iy) vy |= ny << (64 - iy);

      nmask = next_mask(bits, hi, &val_offset, imask);
      *(data_z++) = action(vx, vy, &carry, nmask);
    }

    if (rem_bits) {
      vx = nx >> ix, nx = *data_x;
      vy = ny >> iy, ny = *data_y;

      if (ix + rem_bits >= 64) vx |= nx << (64 - ix);
      if (iy + rem_bits >= 64) vy |= ny << (64 - iy);

      nmask = next_mask(bits, hi, &val_offset, imask);
      vz = action(vx, vy, &carry, nmask);

      *data_z = *data_z & ~(~(UINT64_MAX << rem_bits) << iz) | (vz & ~(UINT64_MAX << rem_bits)) << iz;
    }

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
      offset[cur_dim] = 0;
  }
}

void bulk_unary_op(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, void *y, const size_t *oy,
        const size_t *count,
        uint64_t (*action)(uint64_t, uint64_t, uint64_t*, uint64_t)
) {
  bulk_op(dx, x, ox, dx, x, ox, dy, y, oy, count, action);
}
