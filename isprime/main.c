#include <stdio.h>
#include <stdbool.h>
#include <math.h>

bool isPrime (unsigned num)
{
    unsigned k = (unsigned)sqrt(num);
    unsigned i = 6;
    if (num == 2 || num == 3 || num == 5) {
        return true; 
        }   
    else if (num < 2 || num % 2 == 0 || num % 3 == 0 || num % 5 == 0) {
        return false; 
        }
    else {
        while ((i <= k) && (num % (i+1) != 0) && (num % (i+5) != 0)) {
            i += 6; 
        }
        }
    return (i > k);
}

int main(void) {
    unsigned n = 0;
    scanf("%u", &n);
    if (isPrime(n) == true) {
        printf("%u jest liczba piewrsza\n", n);
    }
    else {
        printf("%u nie jest liczba piewrsza\n", n);
    }
    return 0;
}
