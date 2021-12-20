#include "ops.h"

#define un_op(type, shift, op) {\
  type *x_ = (type *) x, *y_ = (type *) y;\
  for (n = raw >> shift, i <<= 1; i < n; ++i)\
    y_[i] = op x_[i];\
}

void not(const ArrayDesc *desc, const void *x, void *y) {
  size_t raw = byte_size(desc), i = 0, n;

  un_op(uint64_t, 3, ~)
  un_op(uint32_t, 2, ~)
  un_op(uint16_t, 1, ~)
  un_op(uint8_t, 0, ~)
}

#define bin_op(type, shift, op) {\
  type *x_ = (type *) x, *y_ = (type *) y, *z_ = (type *) z;\
  for (n = raw >> shift, i <<= 1; i < n; ++i)\
    z_[i] = x_[i] op y_[i];\
}

#define bin_op_func(name, op) void name(const ArrayDesc *desc, const void *x, const void *y, void *z) {\
  size_t raw = byte_size(desc), i = 0, n;\
\
  bin_op(uint64_t, 3, op)\
  bin_op(uint32_t, 2, op)\
  bin_op(uint16_t, 1, op)\
  bin_op(uint8_t, 0, op)\
}

bin_op_func(and, &)
bin_op_func(or, |)
bin_op_func(xor, ^)
