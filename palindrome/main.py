def main():
    # Wprowadzenie zmiennych
    a = int(input("Podaj liczbe: "))
    p = int(input("Podaj system: "))
    liczba = a
    odwrocona_liczba = 0

    # Algorytm odwracajacy liczbe
    while liczba > 0:
        pom = liczba % p
        liczba = liczba // p
        odwrocona_liczba = odwrocona_liczba * p + pom

    # Sprawdzenie czy to palindrom w podanym systemie
    if odwrocona_liczba == a:
        print ("To palindrom")
    else:
        print("To nie palindrom")

if __name__ == "__main__":
    main()