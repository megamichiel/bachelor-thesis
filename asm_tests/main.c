#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

void test() {
    uint8_t *x = malloc(sizeof(uint8_t) * 3);

    x[0] = 4;
    x[1] = 5;
    x[2] = 6;

    printf("Values are %02x, %02x, %02x\n", x[0], x[1], x[2]);

    printf("Addresses are %p, %p, %p\n", &x[0], &x[1], &x[2]);

    ((uint16_t *) (&x[0]))[0] = 0xABCDu;
    ((uint16_t *) (&x[0] + 1))[0] = 0xABEFu;

    ((uint16_t *) (&x[0]))[0] += 1;

    printf("Addresses are %p, %p, %p\n", ((uint16_t *) (&x[0])), ((uint16_t *) (&x[0] + 1)), ((uint16_t *) (&x[0] + 2)));

    printf("Values are %02x, %02x, %02x\n", x[0], x[1], x[2]);
}

int main() {
    test();

    return 0;
}
