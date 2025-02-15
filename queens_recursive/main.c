#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

void printArray(int arr[], int n) {
    for (int i = 1; i<=n; i++) {
        printf("%d", arr[i]);
    }
    printf("\n");
}

bool isThereDiagonalCapture(int arr[], int n) {
    for(int j = 1; j <= n-1; j++) 
        for(int i = j+1; i <= n; i++)
            if(abs(j-i) == abs(arr[j]-arr[i]))
                return true;
    return false;
}

void generatePermutations(int arr[], int n, int arrayLenght, int *counter) {
    int temp = 0;
    if (n == 1) {
        if (!isThereDiagonalCapture(arr, arrayLenght)) {
            printArray(arr, arrayLenght);
            (*counter)++;
        }
    }
    else {
        for(int j = 1; j <= n; j++) {
            temp = arr[j];
            arr[j] = arr[n];
            arr[n] = temp;
            generatePermutations(arr, n-1, arrayLenght, counter);
            arr[n] = arr[j];
            arr[j] = temp;
    }
    }   
}

int main(void) {
    
    int n, counterOfSolutions = 0;
    printf("How large do you want the board to be? Width and length: ");
    scanf("%d", &n);

    //definicja tablicy od 1 do n
    int *arr = (int *)malloc(n+1 * sizeof(int));
    for (int i = 1; i<=n; i++) {
        arr[i] = i;
    }
    //uzycie funkcji
    generatePermutations(arr, n, n, &counterOfSolutions);
    printf("Number of solutions: %d\n", counterOfSolutions);
    return 0;
}
