typedef uint8_t uint1;
typedef uint8_t uint2;
typedef uint8_t uint3;
typedef uint8_t uint4;
typedef uint8_t uint5;
typedef uint8_t uint6;
typedef uint8_t uint7;
typedef uint8_t uint8;

typedef uint16_t uint9;
typedef uint16_t uint10;
typedef uint16_t uint11;
typedef uint16_t uint12;
typedef uint16_t uint13;
typedef uint16_t uint14;
typedef uint16_t uint15;
typedef uint16_t uint16;

typedef uint32_t uint17;
typedef uint32_t uint18;
typedef uint32_t uint19;
typedef uint32_t uint20;
typedef uint32_t uint21;
typedef uint32_t uint22;
typedef uint32_t uint23;
typedef uint32_t uint24;

typedef uint32_t uint25;
typedef uint32_t uint26;
typedef uint32_t uint27;
typedef uint32_t uint28;
typedef uint32_t uint29;
typedef uint32_t uint30;
typedef uint32_t uint31;
typedef uint32_t uint32;

typedef uint64_t uint33;
typedef uint64_t uint34;
typedef uint64_t uint35;
typedef uint64_t uint36;
typedef uint64_t uint37;
typedef uint64_t uint38;
typedef uint64_t uint39;
typedef uint64_t uint40;

typedef uint64_t uint41;
typedef uint64_t uint42;
typedef uint64_t uint43;
typedef uint64_t uint44;
typedef uint64_t uint45;
typedef uint64_t uint46;
typedef uint64_t uint47;
typedef uint64_t uint48;

typedef uint64_t uint49;
typedef uint64_t uint50;
typedef uint64_t uint51;
typedef uint64_t uint52;
typedef uint64_t uint53;
typedef uint64_t uint54;
typedef uint64_t uint55;
typedef uint64_t uint56;

typedef uint64_t uint57;
typedef uint64_t uint58;
typedef uint64_t uint59;
typedef uint64_t uint60;
typedef uint64_t uint61;
typedef uint64_t uint62;
typedef uint64_t uint63;
typedef uint64_t uint64;

typedef int8_t int1;
typedef int8_t int2;
typedef int8_t int3;
typedef int8_t int4;
typedef int8_t int5;
typedef int8_t int6;
typedef int8_t int7;
typedef int8_t int8;

typedef int16_t int9;
typedef int16_t int10;
typedef int16_t int11;
typedef int16_t int12;
typedef int16_t int13;
typedef int16_t int14;
typedef int16_t int15;
typedef int16_t int16;

typedef int32_t int17;
typedef int32_t int18;
typedef int32_t int19;
typedef int32_t int20;
typedef int32_t int21;
typedef int32_t int22;
typedef int32_t int23;
typedef int32_t int24;

typedef int32_t int25;
typedef int32_t int26;
typedef int32_t int27;
typedef int32_t int28;
typedef int32_t int29;
typedef int32_t int30;
typedef int32_t int31;
typedef int32_t int32;

typedef int64_t int33;
typedef int64_t int34;
typedef int64_t int35;
typedef int64_t int36;
typedef int64_t int37;
typedef int64_t int38;
typedef int64_t int39;
typedef int64_t int40;

typedef int64_t int41;
typedef int64_t int42;
typedef int64_t int43;
typedef int64_t int44;
typedef int64_t int45;
typedef int64_t int46;
typedef int64_t int47;
typedef int64_t int48;

typedef int64_t int49;
typedef int64_t int50;
typedef int64_t int51;
typedef int64_t int52;
typedef int64_t int53;
typedef int64_t int54;
typedef int64_t int55;
typedef int64_t int56;

typedef int64_t int57;
typedef int64_t int58;
typedef int64_t int59;
typedef int64_t int60;
typedef int64_t int61;
typedef int64_t int62;
typedef int64_t int63;
typedef int64_t int64;

typedef struct ARRAY_DESC ArrayDesc;

uint64_t bit_mask(uint8_t num_bits);

size_t byte_count(uint8_t num_bits, size_t dim, ...);
ArrayDesc *alloc_desc(uint8_t num_bits, size_t dim, ...);

void *alloc_array(ArrayDesc *desc);

size_t get_index(ArrayDesc *desc, ...);

uint8_t array_get8(ArrayDesc *desc, const uint8_t *data, size_t index);
uint16_t array_get16(ArrayDesc *desc, const uint16_t *data, size_t index);
uint32_t array_get32(ArrayDesc *desc, const uint32_t *data, size_t index);
uint64_t array_get64(ArrayDesc *desc, const uint64_t *data, size_t index);

uint8_t array_set8(ArrayDesc *desc, uint8_t *data, size_t index, uint8_t val);
uint16_t array_set16(ArrayDesc *desc, uint16_t *data, size_t index, uint16_t val);
uint32_t array_set32(ArrayDesc *desc, uint32_t *data, size_t index, uint32_t val);
uint64_t array_set64(ArrayDesc *desc, uint64_t *data, size_t index, uint64_t val);
typedef uint6 fib_number;

void init_fib(fib_number *fib) {
  ArrayDesc *fib__desc = alloc_desc(6, 1, 0);
  
  array_set8(fib__desc, fib, 0, 1);
  array_set8(fib__desc, fib, 1, 1);
}

void update_fib(fib_number *fib, size_t index) {
  ArrayDesc *fib__desc = alloc_desc(6, 1, 0);
  
  fib_number val = array_get8(fib__desc, fib, index - 2) + array_get8(fib__desc, fib, index - 1);
  array_set8(fib__desc, fib, index, val);
}

int main() {
  size_t count = 10;
  
  ArrayDesc *fib__desc = alloc_desc(6, 1, count);
  fib_number *fib = alloc_array(fib__desc);
  
  for (size_t i = 0; i <= 1; i++)
    array_set8(fib__desc, fib, i, 1);
  for (size_t i = 2; i < count; i++)
    array_set8(fib__desc, fib, i, array_get8(fib__desc, fib, i - 2) + array_get8(fib__desc, fib, i - 1));
  
  ArrayDesc *test__desc = alloc_desc(6, 2, 3, 3);
  fib_number *test = alloc_array(test__desc);
  
  for (size_t i = 0; i < 3; i++)
    for (size_t j = 0; j < 3; j++)
      array_set8(test__desc, test, get_index(test__desc, j, i), (i * 3) + j);
  
  printf("Size %i\n", sizeof(fib_number));
  
  for (size_t index = 0; index < count; ++index) {
    printf("%u ", array_get8(fib__desc, fib, index));
  }
  
  printf("\n");
  free(fib__desc);
  free(fib);
  free(test__desc);
  free(test);
  return 0;
}

void random() {
  size_t count = 10;
  
  ArrayDesc *sth__desc = alloc_desc(6, 2, count, count);
  fib_number *sth = alloc_array(sth__desc);
  
  ArrayDesc *arr__desc = alloc_desc(6, 0);
  fib_number *arr = calloc(1, byte_count(6, 1, count));
  
  array_set8(arr__desc, arr, 0, 1);
  array_set8(arr__desc, arr, 1, 2);
  
  ArrayDesc *test__desc = alloc_desc(6, 0);
  fib_number *test[3];
  
  test[0] = arr;
  array_set8(test__desc, test, get_index(test__desc, 0, 2), 3);
  
  array_set8(test__desc, test, get_index(test__desc, 0, 4), 5);
  
  fib_number last = array_get8(test__desc, test, get_index(test__desc, 0, 5));
  free(sth__desc);
  free(sth);
  free(arr__desc);
  free(test__desc);
}
