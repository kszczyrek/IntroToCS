#include <stdio.h>
#include <stdlib.h>
#include "totient.h"

int main(int argc, char *argv[]) {

    unsigned n = 0;
    unsigned arr[63];

    if (argc < 2)
        printf("Please put arguments from the command line\n");

    for (int i = 1; i < argc; i++) {
        n = (unsigned)atoi(argv[i]);
        primeFactorization(n, arr);
        printf("totient(%u) = %u\n", n, totient(arr));
    }

    return 0;
}
