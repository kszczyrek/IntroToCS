def main():
    #Interfejs i wprowadzenie zmiennych
    a = int(input("Podaj liczbe a: "))
    b = int(input("Podaj liczbe b: "))
    print(f"NWD({a},{b}) = ", end="")
    #Algorytm
    while (b != 0):
        c = b
        b = a%b
        a = c
    print(a)
#Wywolanie funkcji main
if __name__ == "__main__":
    main()