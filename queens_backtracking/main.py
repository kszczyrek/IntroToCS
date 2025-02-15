def ustaw(i, n, c, pos, bijeWiersz, bijePrzek1, bijePrzek2):
    for j in range(1, n+1):
        if not bijeWiersz[j] and not bijePrzek1[i+j] and not bijePrzek2[n+i-j]:
            pos[i] = j
            bijeWiersz[j] = bijePrzek1[i+j] = bijePrzek2[n+i-j] = True
            if i < n:
                ustaw(i+1, n, c, pos, bijeWiersz, bijePrzek1, bijePrzek2)
            else:
                print(pos [1:])
                c[0] += 1
            pos[i] = 0
            bijeWiersz[j] = bijePrzek1[i+j] = bijePrzek2[n+i-j] = False

def hetmani(n, c):
    pos = [0] * (n+1) #definicja listy n+1 wielkosci (n+1 zeby indeksy zaczynaly sie od jeden)
    bijeWiersz = [False] * (n+1) #definicja listy n+1 wielkosci (n+1 zeby indeksy zaczynaly sie od jeden)
    bijePrzek1 = [False] * (2*n+1)
    bijePrzek2 = [False] * (2*n+1)
    ustaw(1, n, c, pos, bijeWiersz, bijePrzek1, bijePrzek2)

def main():
    n = 0 #tworze tablicy aby przekazywany byl oryginal zmiennej zeby nie musiala byc ona kopiowana
    n = int(input("Podaj wielkosc szachownicy (wysokosc): "))
    c = [0]
    hetmani(n, c)
    print(f"Liczba rozwiazan to {c[0]}")

if __name__ == "__main__":
    main()