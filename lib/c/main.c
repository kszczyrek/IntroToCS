#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include "primes.h"

int main(int argc, char *argv[]) {
    
    unsigned n = (unsigned)(atoi(argv[2]));

    if(!strcmp(argv[1], "pn")) {
        printf("%u\n", prime_numbers(n));
    }
    else if(!strcmp(argv[1], "pr")) {
        printf("%u\n", prime(n));
    }
    else if(!strcmp(argv[1], "ip")) {
        if(is_prime(n)) printf("True\n");
        else printf("False\n");
    }

    return 0;
}
