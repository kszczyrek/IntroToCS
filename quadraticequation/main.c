#include <stdio.h>
#include <math.h>

int main(void) {
    
    //Zmienne 
    float a, b, c;
    float delta;
    float x1, x2;

    //Interfejs
    printf("Oblicz funkcje kwadratowa!\n");
      printf("Podaj wspolczynnik a funkcji: ");
    scanf("%f", &a);
      printf("Podaj wspolczynnik b funkcji: ");
    scanf("%f", &b);
      printf("Podaj wspolczynnik c funkcji: ");
    scanf("%f", &c);

    //Policzenie delty
    delta = (b*b) - (4 * a * c);

    //Policzenie pierwiastkow w zaleznosci od wartosci delty
    if(delta < 0) {
        printf("Ta funkcja kwadratowa nie ma rozwiazan, poniewaz delta jest mniejsza od zera\n");
  } else if(delta == 0) {
        x1 = (-1 * b) / (2 * a);
        printf("Ta funkcja kwadratowa ma jedno rozwiazanie x1 = %f\n", x1);        

  } else {
        x1 = (-1 * b  - sqrt(delta)) / (2 * a);
        x2 = (-1 * b + sqrt(delta)) / (2 * a);
        printf("Ta funkcja ma dwa rozwiazania x1 = %f i x2 = %f\n", x1, x2);
    }

    return 0;
}
