#ifndef THESIS_OPS_H
#define THESIS_OPS_H

#include "impl.h"
#include <stdbool.h>

void bulk_fill(const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count, uint64_t val);

void bulk_set(
        const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count,
        uint64_t (*action)(const size_t *index, void *arg), void *arg
);

size_t *bulk_find(
        const ArrayDesc *desc, void *data, const size_t *offset, const size_t *count,
        bool (*action)(const size_t *index, uint64_t val, void *arg), void *arg
);

void bulk_op(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, const void *y, const size_t *oy,
        const ArrayDesc *dz, void *z, const size_t *oz,
        const size_t *count,
        uint64_t (*action)(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg), void *arg
);

void bulk_unary_op(
        const ArrayDesc *dx, const void *x, const size_t *ox,
        const ArrayDesc *dy, void *y, const size_t *oy,
        const size_t *count,
        uint64_t (*action)(uint64_t x, uint64_t y, uint64_t *carry, uint64_t mask, void *arg), void *arg
);

#endif
