#include <stdio.h>

int main(void) {
    
    //Zmienne 
        int a, b, bufor, c, d;

    //Intefejs
        printf("Oblicz NWD(a,b)\n");
        printf("Podaj pierwsza liczbe a: ");
        scanf("%d", &a);
        printf("Podaj pierwsza liczbe b: ");
        scanf("%d", &b);
        c = a;
        d = b;

    //Algorytm NWD
        while(b != 0) {
            bufor = b;
            b = a % b;
            a = bufor;
        }
        
        printf("NWD(%d,%d) to %d\n", c, d, a);
      
    return 0;
}
