#include <stdio.h>
#include <stdbool.h>
#include <math.h>

void primeFactorization(unsigned num)
{
    //definicja zmiennych
        unsigned div = 2;
        unsigned k = (unsigned)sqrt(num);
        unsigned exp = 0;
        bool isFirstFactor = true;
    //warunek dla jedynki
        printf("%u=", num);
        if(num == 1) {
            printf("1");
        } 
    //dzielenie przez 2
        while(num % div == 0) {
            num /= div;
            exp++;
        } 
        if(exp > 0) {
            printf("2");
            isFirstFactor=false;
            if(exp > 1) {
                printf("^%u", exp);
            }
            exp = 0;
        }
    //dzielenie przed div+2 zaczynajac od 3
        div = 3;
        while(num > 1) {
            k = (unsigned)sqrt(num);
        //przerwanie petli jesli skonczyly sie czynniki i wypisanie tego co zostalo
            if(div > k) {
                if(isFirstFactor == false) {
                    printf("*");
                }
                printf("%u", num);
                num = 1;
            }
        //petla dzielaca liczbe przez jej czynniki i zwiekszajaca wykladnik
            while(num % div == 0) {
                num /= div;
                exp++;
            }
        //warunek wypisujacy czynniki
            if(exp > 0) {
                if(isFirstFactor == false) {
                    printf("*");
                }
                printf("%u", div);
                isFirstFactor=false;
                if(exp > 1) {
                    printf("^%u", exp);
                }
            }
        //reset wykladnika i inkrementacja dzielnika
            exp = 0;
            div += 2;
        }
    printf("\n");
}

int main(void) {
    unsigned n = 0;
    scanf("%u", &n);
    primeFactorization(n);
    return 0;
}
