import math as m

def PrimeNumbers(n):
    if n == 1:
        return 0
    
    def create_sieve(s, n):
        s.append(False) # 0 = False
        s.append(False) # 1 = False
        s.append(True) # 2 = True 
        for i in range(3,n + 1):
            if (i % 2 == 0):
                s.append(False)
            else:
                s.append(True)

    def compute_sieve(s):
        k = int(m.sqrt(n+1))
        for i in range(2, k):
            if s[i]:
                j = i * i
                while j < len(s):
                    s[j] = False
                    j = j + (i * 2)

    def count_primes(s):
        c = 0
        for e in s:
            if e:
                c = c + 1
        return c

    s = []
    create_sieve(s, n)
    compute_sieve(s)
    return count_primes(s)

def Prime(n):
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

def IsPrime(n):
    i = 6
    k = int(m.sqrt(n))
    if n == 2 or n == 3 or n == 5:
        return True
    elif n < 2 or n % 2 == 0 or n % 3 == 0 or n % 5 == 0:
        return False
    else:
        while i <= k and n % (i+1) != 0 and n % (i+5) != 0:
            i = i + 6
    return i > k

