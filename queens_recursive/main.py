def isThereDiagonalCapture(l):
    n = len(l) - 1
    for j in range(1, n):
        for i in range(j+1, n+1):
            if abs(j-i) == abs(l[j] - l[i]):
                return True
    return False

def generatePermutations(l, k, counter):
    if k == 1:
        if not isThereDiagonalCapture(l):
            print(l[1:])
            counter[0] = counter[0] + 1
    else:
        for j in range(1, k+1):
            l[j], l[k] = l[k], l[j]
            generatePermutations(l, k-1, counter) #Generujemy kolejne permutacje rekurencyjnie schodzac w dol dzialajac na tablicy dlugosci jednej mniej niz poprzednio.
            l[j], l[k] = l[k], l[j]               #Gdy zejdziemy do dzialania na tablicy dlugosci jeden to sprawdzamy czy jakies hetmany sie bije po skosie funkcja isTHereDIagonalCapture()
                                                  #Jesli hetmany sie nie bija po skosie to wypisujemy te tablicy jako wynik i zwiekszamy licznik rozwiazan o 1                                                 

def main():
    counter = [0]
    print("What height and width of chessboard you want to have?: ")
    n = int(input())  
    lis = list(range(n+1))
    generatePermutations(lis, n, counter)
    print(f"Number of solutions: {counter}")

if __name__=="__main__":
    main()