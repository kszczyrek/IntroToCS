#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include "totient.h"

void primeFactorization(unsigned num, unsigned arr[]) {

    //definicja zmiennych
        unsigned div = 2;
        unsigned k = 0;
        unsigned exp = 0;
        unsigned iterator = 0;
    //inicjalizacja tablicy 63 elementowej jedynkami
        for (int i = 0; i < 63; i++) {
            arr[i] = 1;
        }
    //warunek dla jedynki
        if(num == 1) {
            return;
        } 

    //dzielenie przez 2
        while(num % div == 0) {
            num /= div;
            exp++;
        } 
        if(exp > 0) 
            while(exp) { 
                arr[iterator++] = div;
                exp--;
            }
    //dzielenie przed div+2 zaczynajac od 3
        div = 3;
        while(num > 1) {
            k = (unsigned)sqrt(num);
        //przerwanie petli jesli skonczyly sie czynniki i wypisanie tego co zostalo
            if(div > k) {
                arr[iterator++] = num;
                break; //tu bylo num = 1; ale wtedt bylo segmentation fault ...
            }
        //petla dzielaca liczbe przez jej czynniki i zwiekszajaca wykladnik
            while(num % div == 0) {
                num /= div;
                exp++;
            }
        //warunek wypisujacy czynniki
            if(exp > 0) 
                while(exp) { 
                    arr[iterator++] = div;
                    exp--;
                }  
        //reset wykladnika i inkrementacja dzielnika
            div += 2;
        }  
}

unsigned totient(unsigned arr[]) {

    unsigned now = 1;
    unsigned result = 1;
    unsigned numberOfFactors = 0;
    
    //policzenie ilosci czynnikow jakie ma liczba
    while (arr[numberOfFactors] != 1) {
        numberOfFactors++;
    }
    //liczenie ilosci liczb wzglednie pierwszych
    for (unsigned i = 0; i < numberOfFactors ;i++) {
        if (arr[i] != now) {
            result = result * (arr[i] - 1);
            now = arr[i];
        } 
        else {
            result = result * arr[i];
        }
    }

    return result;
}
