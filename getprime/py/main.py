def getPrime(n):
    
    primes = [2]  
    potential_prime = 3  

    while len(primes) < int(n):
        is_prime = True
        for prime in primes:
            if prime * prime > potential_prime:
                break
            if potential_prime % prime == 0:
                is_prime = False
                break
        if is_prime:
            primes.append(potential_prime)

        potential_prime += 2

    return primes[-1]

def main():

    n = int(input("Ktora liczbe pierwsza chcesz znac? "))
    print(f"{n}. liczba pierwsza to: {getPrime(n)}")

if __name__ == "__main__":
    main()