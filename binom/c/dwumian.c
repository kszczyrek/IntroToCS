#include <stdlib.h>
#include <stdio.h>

long unsigned dwumian (unsigned n, unsigned k) {
    unsigned z = 0;
    //k = min(n, n-k)
    if (n-k < k) k = n - k;
    //tab(0 .. k)
    long unsigned *tab = calloc((k+1), sizeof(long unsigned));

    tab[0] = 1;

    for (unsigned i = 1; i < n; i++) {
        if (i <= k) {
            tab[i] = 1;
            z = i + 1;
        }
        else {
            z = k;
        }
        for (; z >= 1; z--) {
            tab[z] = tab[z] + tab[z-1];
        }
    }

    long unsigned wynik = tab[k];
    free(tab);
    return wynik;  
}

//najwyzej moze policzyc n = 66 k = 33