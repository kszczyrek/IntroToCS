import math as m

def getNaturalNumber():
    while True:
        try:
            n = int(input("Podaj liczbę naturalną: "))  
            if n > 0:
                return n  
            else:
                print("To nie jest liczba naturalna. Spróbuj ponownie.")
        except ValueError:
            print("To nie jest liczba naturalna. Spróbuj ponownie.")  
     

def primenumbers(n):
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

def main():
    n = getNaturalNumber()
    print(f"W {n}. pierwszych liczbach naturalnych jest {primenumbers(n)} liczb pierwszych")

if __name__ == "__main__":
    main()