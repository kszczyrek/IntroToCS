import math

def halfcos(x):
    return math.cos(x / 2)

def findZero(f, a, b, eps):
    # Sprawdzanie warunków początkowych
    if f(a) * f(b) >= 0:
        print("Funkcja nie spełnia warunku f(a) * f(b) < 0")
        return float('nan')
    
    # Algorytm bisekcji
    while (b - a) > eps:
        mid = (a + b) / 2.0
        if f(mid) == 0.0:
            return mid  # Dokładne miejsce zerowe
        elif f(a) * f(mid) < 0:
            b = mid
        else:
            a = mid
    return (a + b) / 2.0  # Przybliżone miejsce zerowe

def main():
    epsilons = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8]
    a = float(input("Podaj a: "))
    b = float(input("Podaj b: "))

    print(f"Znajdowanie miejsca zerowego funkcji cos(x/2) w przedziale [{a}, {b}]:")
    
    for eps in epsilons:
        zero = findZero(halfcos, a * math.pi, b * math.pi, eps) / math.pi
        print(f"eps = {eps:.1e}, zero = {zero:.8f}")

if __name__ == "__main__":
    main()