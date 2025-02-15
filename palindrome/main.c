#include <stdio.h>

int main(void) {
    // Deklaracja zmiennych
      int liczba, liczba_kopia, odwrocona_liczba, system, reszta;
    // Interfejs i wprowadzenie danych
      printf("Podaj liczbe: ");
      scanf("%d", &liczba);
      printf("Podaj system: ");
      scanf("%d", &system);
    // Algorytm odwracajacy liczbe
    liczba_kopia = liczba;
    odwrocona_liczba = 0;
    while (liczba_kopia > 0) {
        reszta = liczba_kopia % system;
        liczba_kopia = liczba_kopia / system;
        odwrocona_liczba = odwrocona_liczba * system + reszta;
    }
    // Sprawdzenie czy to palindrom w podanym systemie
    if (odwrocona_liczba == liczba) {
        printf("To palindrom\n");
    }
    else {
        printf("To nie palindrom\n");        
    }
    return 0;
}
