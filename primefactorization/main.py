import math

def primeFactorization(num):
    # Definicja zmiennych
    div = 2
    k = int(math.sqrt(num))
    exp = 0
    isFirstFactor = True

    print(f"{num} =", end="")
    # Warunek dla 1
    if num == 1:
        print(" 1")
    # Dzielenie przez 2
    while num % div == 0:
        num = num / div
        exp = exp + 1
    if exp > 0:
        print(" 2", end="")
        isFirstFactor = False
        if exp > 1:
            print(f"^{exp}", end="")
        exp = 0
    # Dzielenie przez div + 2 poczawszy od 3
    div = 3
    while num > 1:
        k = int(math.sqrt(num))
    # Przerwanie jesli zostala liczba pierwsza
        if div > k:
            if isFirstFactor == False:
                print(" *", end="")
            print(f" {int(num)}", end="")
            num = 1
    # Petla dzielaca przez czynniki pierwsze i liczaca wykladnik
        while num % div == 0:
            num = num / div
            exp = exp + 1
    # Wypisanie czynnikow
        if exp > 0:
            if isFirstFactor == False:
                print(" *", end="")
            print(f" {div}", end="")
            isFirstFactor = False
            if exp > 1:
                print(f"^{exp}", end="")
    # Reset wykladnika i inkrementacja dzielnika
        exp = 0
        div = div + 2
    print()

def main():
    liczba = int(input())
    primeFactorization(liczba)
    
if __name__ == "__main__":
    main()
            

