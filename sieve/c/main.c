#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include "primenumbers.h"
#include "naturalinput.h"

int main(int argc, char *argv[]) {

    //Sprawdzenie argumentow wejsciowych
    if (argc < 2) { 
        printf("Blad: Podaj liczbę jako argument.\n");
        return 0;
    }
    else if (argc > 2) {
        printf("Blad: Podano za duzo argumentow\n");
        return 0;
    }
    else if(!is_natural(argv[1])) {
        printf("Blad: Argument wejsciowy nie jest liczba naturalna\n");
        return 0;
    }

    unsigned long n = 0, counter = 0;
    bool *s;
    
    sscanf(argv[1], "%lu", &n);
    
    //Przypadek szczegolny 0
	if (n == 0)  {
		printf("W 0 liczbach jest 0 liczb pierwszych\n");
		return 0;
	}
    	if (n == 1)  {
		printf("1 nie jest liczba pierwsza\n");
		return 0;
	}

    s = malloc((n + 1) * sizeof(bool));
    compute_sieve(s, n);
    counter = count_primes(s, n);
    free(s);
    printf("W %lu. poczatkowych liczbach naturalnych jest %lu liczb pierwszych\n", n, counter);

    return 0;
}
