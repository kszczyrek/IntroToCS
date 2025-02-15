#include <stdio.h>

int main(void) {
    //Zmienne
    int a, x, b = 0;

    //Intefejs
    printf("Wpisz liczbe ktore chcesz sprawdzic czy jest palindromem: ");
      scanf("%d", &x);

    //Algorytm odwracajacy x i zapisujacy go pod zmienna m
    a = x;
    while (a > 0) {
    b = b * 10 + (a % 10);
    a /= 10;             
    }
  
    //Instrukcja warunkowa sprawdzajaca czy x jest palindromem
    if (x == b) {
        printf("%d jest palindromem!\n", x);
  } else {
        printf("%d nie jest palindromem!\n", x);
  } 

    return 0;
}
