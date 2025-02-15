#include <stdio.h>
#include "dwumian.h"

int main(void) {

    unsigned n = 0, k = 0;
    scanf("%u", &n);
    scanf("%u", &k);
    printf("Dwumian newtona z n = %u, k = %u wynosi %lu\n", n, k, dwumian(n,k));
    
    return 0;
}
