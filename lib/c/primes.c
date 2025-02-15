#include <math.h>
#include <stdbool.h>
#include <stdlib.h>
#include "primes.h"

unsigned prime_numbers(unsigned n) {
    
    bool *s = malloc((n + 1) * sizeof(bool));

    unsigned k = (unsigned)(sqrt(n));
    s[2] = true;
    for (int i = 3; i <= n; i += 2) s[i] = true;
    for (int i = 3; i <= k; i += 2) 
        if (s[i]) 
            for (int j = i * i; j <= n; j += i * 2) 
                s[j] = false;

    unsigned c = 0;
    if (s[2]) c++;
    for (int i = 3; i <= n; i += 2) 
        if (s[i]) 
            c++;
    return c;
}

unsigned prime(unsigned n) {

    unsigned *sortedPrimes = calloc(n, sizeof(unsigned));

    sortedPrimes[0] = 2;
    unsigned foundPrimes = 1;
    unsigned potentialPrime = 3;

    while (foundPrimes < n) {
        bool isPrime = true;
            for (int i = 0; i < foundPrimes; i++) {
                if (sortedPrimes[i] * sortedPrimes[i] > potentialPrime)
                    break;
                if (potentialPrime % sortedPrimes[i] == 0)
                    isPrime = false;
                }
            if (isPrime) {
                sortedPrimes[foundPrimes] = potentialPrime;
                foundPrimes++;
            } 
        potentialPrime = potentialPrime + 2;
    }
    return sortedPrimes[n-1];
}

bool is_prime(unsigned n) {
    unsigned k = (unsigned)sqrt(n);
    unsigned i = 6;
    if (n == 2 || n == 3 || n == 5) {
        return true; 
        }   
    else if (n < 2 || n % 2 == 0 || n % 3 == 0 || n % 5 == 0) {
        return false; 
        }
    else {
        while ((i <= k) && (n % (i+1) != 0) && (n % (i+5) != 0)) {
            i += 6; 
        }
        }
    return (i > k);
}