#include <stdio.h>
#include <stdlib.h>
#include "primes.h"

int main(void) {
    
    unsigned n = 0;
    printf("Oblicz n-ta liczbe pierwsza\n");
    printf("Podaj n: ");
    scanf("%u", &n);

    unsigned *arr = calloc(n, sizeof(unsigned));
    getArrayOfSortedPrimes(n, arr);

    printf("%u. w kolejnosci liczba pierwsza to %u\n", n, arr[n-1]);

    return 0;
}
