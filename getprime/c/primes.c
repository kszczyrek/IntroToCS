#include <stdio.h>
#include <stdbool.h>
#include "primes.h"

void getArrayOfSortedPrimes(unsigned k, unsigned sortedPrimes[]) {
    
    sortedPrimes[0] = 2;
    unsigned foundPrimes = 1;
    unsigned potentialPrime = 3;

    while (foundPrimes < k) {
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



}


    