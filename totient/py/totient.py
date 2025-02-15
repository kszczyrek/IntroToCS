import math as m

def primeFactorization(num):
    # Definicja zmiennych
    div = 2
    l = []
    # Warunek dla 1
    if num == 1:
        l.append(1)
    # Dzielenie przez 2
    while num % div == 0:
        num = num / div
        l.append(div)
    # Dzielenie przez div + 2 poczawszy od 3
    div = 3
    while num > 1:
        k = int(m.sqrt(num))
    # Przerwanie jesli zostala liczba pierwsza
        if div > k:
            l.append(num)
            num = 1
    # Petla dzielaca przez czynniki pierwsze i liczaca wykladnik
        while num % div == 0:
            num = num / div
            l.append(div)
    #inkrementacja dzielnika
        div = div + 2
    return l

def totient(n):
    l = primeFactorization(n)
    now = 1
    result = 1
    for i in range(0, len(l)):
        if l[i] != now:
            result = result * (l[i] - 1)
            now = l[i]
        else:
            result = result * l[i]
    return result