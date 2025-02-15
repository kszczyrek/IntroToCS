#include <stdio.h>
#include <math.h>

typedef double (*functype)(double);

void write(functype f, double x) {
    printf("%f\n", f(x));
}

double halfcos(double x) {
    return cos(x / 2);
}

double findzero(functype f, double a, double b, double eps) {
    double mid;
    // Sprawdzanie warunków początkowych
    if (f(a) * f(b) >= 0) {
        printf("Funkcja nie spełnia warunku f(a) * f(b) < 0\n");
        return NAN; 
    }
    // Algorytm bisekcji
    while ((b - a) > eps) {
        mid = (a + b) / 2.0;
        if (f(mid) == 0.0) {
            return mid; // Dokładne miejsce zerowe
        } else if (f(a) * f(mid) < 0) {
            b = mid;
        } else {
            a = mid;
        }
    }
    return (a + b) / 2.0; // Przybliżone miejsce zerowe
}

int main() {
    double a = 0, b = 0;
    double epsilons[] = {1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6, 1e-7, 1e-8};
    int it = 8;
    printf("Podaj a: ");
    scanf("%lf", &a);
    printf("Podaj b: ");
    scanf("%lf", &b);

    printf("Znajdowanie miejsca zerowego funkcji cos(x/2) w przedziale [%.3f, %.3f]:\n", a, b);
    for (int i = 0; i < it; i++) {
        double eps = epsilons[i];
        double zero = (findzero(halfcos, a, b, eps));
        printf("eps = %.1e, zero = %.8f\n", eps, zero);
    }

    return 0;
}