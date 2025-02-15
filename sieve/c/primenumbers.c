#include <math.h>
#include "primenumbers.h"

void compute_sieve(bool s[], unsigned n) {
    unsigned k = (unsigned)(sqrt(n));
    s[2] = true;
    for (int i = 3; i <= n; i += 2) s[i] = true;
    for (int i = 3; i <= k; i += 2) 
        if (s[i]) 
            for (int j = i * i; j <= n; j += i * 2) 
                s[j] = false;
}

unsigned count_primes(bool s[], unsigned n) {
    unsigned c = 0;
    if (s[2]) c++;
    for (int i = 3; i <= n; i += 2) 
        if (s[i]) 
            c++;
    return c;
}