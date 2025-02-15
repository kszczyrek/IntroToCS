import math
def main():
    # Wprowadzenie danych
    print("Oblicz funkcje kwadratowa")
    a = float(input("Podaj a: "))
    b = float(input("Podaj b: "))
    c = float(input("Podaj c: "))
    delta = (b * b) - (4 * a * c)
    # Policzenie pierwiastkow i ich wypisanie
    if delta < 0:
        print("Ta funkcja nie ma miejsc zerowych.")
    elif delta == 0:
        x1 = (-1.0 * b) / (2.0 * a)
        print(f"Ta funkcja ma jedno miejsce zerowe x1 = {x1}")
    else:
        x1 = (-1.0 * b - math.sqrt(delta) / (2 * a))
        x2 = (-1.0 * b + math.sqrt(delta) / (2 * a))
        print(f"Ta funkcja ma dwa miejsca zerowe x1 = {x1:.3f} i x2 = {x2:.3f}")

if __name__ == "__main__":
    main()