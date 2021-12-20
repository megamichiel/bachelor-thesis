#include <memory.h>
#include "ops.h"
#include "impl_compact.c"

static inline void gen_mask(uint8_t bits, uint64_t mask, uint64_t *imask, uint8_t *hi) {
  for (*hi = 0, *imask = 0; *hi < 64; *hi += bits)
    *imask |= mask << *hi;

  *hi -= bits;
}

static inline uint64_t next_mask(uint8_t bits, uint8_t hi, uint8_t *offset, uint64_t imask) {
  uint64_t nmask = imask << *offset | imask >> (hi - *offset);
  *offset = *offset % bits + hi;
  *offset = (*offset < 64 ? *offset + bits : *offset) - 64;
  return nmask;
}

void bulk_fill(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t val) {
  uint64_t *d = data;

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

  do {
    // Update row
    iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
    rem_bits = row_bits;

    if (bz && bz + rem_bits >= 64) {
      vz = next_mask(bits, hi, &val_offset, imask);

      d[iz] = d[iz] & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;

      rem_bits -= 64 - bz, ++iz, bz = 0;
    }

    for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
      d[iz++] = next_mask(bits, hi, &val_offset, imask);

    vz = next_mask(bits, hi, &val_offset, imask);
    d[iz] = d[iz] & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits) << bz);

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++rel_offset[cur_dim] == count[cur_dim]; --cur_dim)
      rel_offset[cur_dim] = 0;
  } while (cur_dim != SIZE_MAX);
}

static inline uint64_t gen_values(size_t dim, uint8_t bits_per_val, int *bit, size_t *index, uint8_t bits, uint64_t (*action)(size_t, const size_t *)) {
  uint64_t v = 0;
  for (; *bit < bits; *bit += bits_per_val) {
    v |= action(dim, index) << *bit;
    ++index[dim - 1];
  }
  if ((*bit -= bits) > 0) {
    *bit -= bits_per_val;
    --index[dim - 1];
  }
  return v;
}

void bulk_set(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t (*action)(size_t, const size_t *)) {
  uint64_t *d = data;
  if (count == NULL)
    count = desc->sizes;

  uint8_t bits = desc->num_bits;
  size_t dim = desc->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *rel_offset = desc->bulk_op_offset;
  memset(rel_offset, 0, dim * sizeof(size_t));

  size_t iz;
  uint8_t bz;
  uint64_t vz;
  int val_offset;

  size_t cur_dim;

  // Update row by row
  do {
    rel_offset[dim - 1] = 0;
    iz = bit_index_offset(desc, rel_offset, offset), bz = iz & 63, iz >>= 6, val_offset = bz;
    rem_bits = row_bits;

    // Align to full array indices
    if (bz && bz + rem_bits >= 64) {
      vz = gen_values(dim, bits, &val_offset, rel_offset, 64, action);

      d[iz] = d[iz] & ~(UINT64_MAX << bz) | vz & UINT64_MAX << bz;

      rem_bits -= 64 - bz, ++iz, bz = 0;
    }

    // Set each index
    for (; rem_bits >= 64; rem_bits -= 64) // assert(bz == 0)
      d[iz++] = gen_values(dim, bits, &val_offset, rel_offset, 64, action);

    // Set the last index
    vz = gen_values(dim, bits, &val_offset, rel_offset, bz + rem_bits, action);
    d[iz] = d[iz] & ~(~(UINT64_MAX << rem_bits) << bz) | vz & ~(UINT64_MAX << rem_bits) << bz;

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
  const uint64_t *data_x = x, *data_y = y;
  uint64_t *data_z = z;

  if (count == NULL)
    count = dz->sizes;

  uint8_t bits = dz->num_bits;
  size_t dim = dz->dim, row_bits = count[dim - 1] * bits, rem_bits;

  size_t *offset = dz->bulk_op_offset;
  memset(offset, 0, dim * sizeof(size_t));

  size_t cur_dim = 0, ix, iy, iz;
  uint8_t bx, by, bz, val_offset;

  uint64_t vx, vy, vz, carry, nx, ny;

  uint64_t imask, nmask;
  uint8_t hi;
  gen_mask(bits, dz->mask, &imask, &hi);

  while (cur_dim != SIZE_MAX) {
    // Array indices
    ix = bit_index_offset(dx, offset, ox),
    iy = bit_index_offset(dy, offset, oy),
    iz = bit_index_offset(dz, offset, oz);

    // Bit indices
    bx = ix & 63, by = iy & 63, bz = iz & 63;
    ix >>= 6, iy >>= 6, iz >>= 6;
    
    rem_bits = row_bits;

    nx = data_x[ix++], ny = data_y[iy++], carry = 0, val_offset = bz;

    // First, gather bits until bz = 0
    if (bz && bz + rem_bits >= 64) {
      vx = nx >> bx, nx = data_x[ix++];
      if ((bx += 64 - bz) >= 64 && (bx -= 64))
        vx |= nx << (64 - bx);

      vy = ny >> by, ny = data_y[iy++];
      if ((by += 64 - bz) >= 64 && (by -= 64))
        vy |= ny << (64 - by);

      nmask = next_mask(bits, hi, &val_offset, imask);
      vz = action(vx << bz, vy << bz, &carry, nmask) & nmask;

      data_z[iz] = data_z[iz] & ~(UINT64_MAX << bz) | (vz & (UINT64_MAX << bz));

      rem_bits -= 64 - bz, ++iz, bz = 0;
    }

    for (; rem_bits >= 64; rem_bits -= 64) { // assert(bz == 0)
      vx = nx >> bx, nx = data_x[ix++];
      vy = ny >> by, ny = data_y[iy++];

      if (bx) vx |= nx << (64 - bx);
      if (by) vy |= ny << (64 - by);

      nmask = next_mask(bits, hi, &val_offset, imask);
      data_z[iz++] = action(vx, vy, &carry, nmask) & nmask;
    }

    if (rem_bits) {
      vx = nx >> bx, nx = data_x[ix];
      vy = ny >> by, ny = data_y[iy];

      if (bx + rem_bits >= 64) vx |= nx << (64 - bx);
      if (by + rem_bits >= 64) vy |= ny << (64 - by);

      nmask = next_mask(bits, hi, &val_offset, imask);
      vz = action(vx, vy, &carry, nmask) & nmask;

      data_z[iz] = data_z[iz] & ~(~(UINT64_MAX << rem_bits) << bz) | (vz & ~(UINT64_MAX << rem_bits)) << bz;
    }

    for (cur_dim = dim - 2; cur_dim != SIZE_MAX && ++offset[cur_dim] == count[cur_dim]; --cur_dim)
      offset[cur_dim] = 0;
  }
}

// Assumes little-endian
/*void bulk_op_old(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, const void *y, const size_t *oy,
        const ArrayDesc *dz, void *z, const size_t *oz,
        const size_t *count,
        uint64_t (*action)(uint64_t, uint64_t, uint64_t *, uint64_t)
) {
  if (count == NULL)
    count = dz->sizes;

  uint8_t bits = dz->num_bits;
  size_t dim = dz->dim;
  size_t row_bits = count[dim - 1] * bits;

  size_t *offset = calloc(dim, sizeof(size_t));

  size_t d = 0;

  uint64_t imask, nmask;
  uint8_t hi;
  gen_mask(bits, dz->mask, &imask, &hi);

  while (d != SIZE_MAX) {
    // Update row
    size_t ix = bit_index_offset(dx, offset, ox),
            iy = bit_index_offset(dy, offset, oy),
            iz = bit_index_offset(dz, offset, oz);

    uint8_t bx = ix & 63, by = iy & 63, bz = iz & 63;
    ix >>= 6;
    iy >>= 6;
    iz >>= 6;

    size_t rbits = row_bits;

    uint64_t vx, vy, vz, carry = 0;
    uint8_t mask_offset = 0;

    // First, calculate in steps of 64 bits
    while (rbits >= 64) {
      vx = ((uint64_t *) x)[ix] >> bx | (bx ? ((uint64_t *) x)[ix + 1] << (64 - bx) : 0);
      vy = ((uint64_t *) y)[iy] >> by | (by ? ((uint64_t *) y)[iy + 1] << (64 - by) : 0);

      next_mask(bits, hi, &mask_offset, imask, &nmask);
      vz = action(vx, vy, &carry, nmask) & nmask;

      ((uint64_t *) z)[iz] = ((uint64_t *) z)[iz] & ~(~0 << bz) | vz << bz;
      if (bz)
        ((uint64_t *) z)[iz + 1] = ((uint64_t *) z)[iz + 1] & ~0 << bz | vz >> (64 - bz);

      ++ix, ++iy, ++iz;
      rbits -= 64;
    }

    ix = (ix << 3) + (bx >> 3);
    iy = (iy << 3) + (by >> 3);
    iz = (iz << 3) + (bz >> 3);
    bx &= 7, by &= 7, bz &= 7;

    // With fewer than 64 bits left, we might reach out-of-bounds, so do byte-by-byte operations
    vx = vy = 0;
    for (size_t b = 0; b * 8 < rbits; ++b) {
      vx |= (uint64_t) ((uint8_t *) x)[ix + b] << (b * 8);
      vy |= (uint64_t) ((uint8_t *) y)[iy + b] << (b * 8);
    }
    vx = (vx >> bx) & ~(~(uint64_t) 0 << rbits);
    vy = (vy >> by) & ~(~(uint64_t) 0 << rbits);

    next_mask(bits, hi, &mask_offset, imask, &nmask);
    vz = action(vx, vy, &carry, nmask) & nmask;

    for (size_t b = 0; b * 8 < rbits; ++b) {
      ((uint8_t *) z)[iz + b] = ((uint8_t *) z)[iz + b] & ~(~0 << bz) | vz >> b * 8 << bz;
      if (bz)
        ((uint8_t *) z)[iz + b + 1] = ((uint8_t *) z)[iz + b + 1] & ~0 << bz | ((vz >> b * 8) & 0xFF) >> (8 - bz);
    }

    for (d = dim - 2; d != SIZE_MAX; --d) {
      if (++offset[d] == count[d])
        offset[d] = 0;
      else
        break;
    }
  }

  free(offset);
}*/

void bulk_unary_op(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, void *y, const size_t *oy,
        const size_t *count,
        uint64_t (*action)(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask)
) {
  bulk_op(dx, x, ox, dx, x, ox, dy, y, oy, count, action);
}
