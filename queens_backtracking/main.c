#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void ustaw(int i, int *n, int *c, int pos[], bool bijeWiersz[], bool bijePrzek1[], bool bijePrzek2[]) {
    for (int j = 1; j <= (*n); j++) {
        if (!(bijeWiersz[j] || bijePrzek1[i+j] || bijePrzek2[(*n)+i-j])) {
            pos[i] = j;
            bijeWiersz[j] = bijePrzek1[i+j] = bijePrzek2[(*n)+i-j] = true;
            if (i < (*n)) {
                ustaw(i+1, n, c, pos, bijeWiersz, bijePrzek1, bijePrzek2);
            }
            else {
                for (int k = 1; k <= (*n); k++) {
                    printf("%d", pos[k]);
                }
                printf("\n");
                (*c)++;
            }
            pos[i] = 0;
            bijeWiersz[j] = bijePrzek1[i+j] = bijePrzek2[(*n)+i-j] = false;
        }

    }
}

void hetmani(int *n, int *c) {
    int *pos = (int *)calloc((*n)+1, sizeof(int));
    bool *bijeWiersz = (bool *)calloc((*n)+1, sizeof(bool));
    bool *bijePrzek1 = (bool *)calloc(((2 * ((*n))) + 1), sizeof(bool));
    bool *bijePrzek2 = (bool *)calloc(((2 * ((*n))) + 1), sizeof(bool));
    ustaw(1, n, c, pos, bijeWiersz, bijePrzek1, bijePrzek2);
    free(pos); free(bijeWiersz); free(bijePrzek1); free(bijePrzek2);
}

int main(void) {
    int n, counter = 0;
    printf("Podaj bok kwadratu N na ktorym chcesz sprawdzic ilosc rozwiazan dla N hetmanow: ");
    scanf("%d", &n);
    hetmani(&n, &counter);
    printf("Liczba rozwiazan: %d\n", counter);
    return 0;
}
