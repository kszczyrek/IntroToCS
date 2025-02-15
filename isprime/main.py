import math

def isPrime(num):
    i = 6
    k = int(math.sqrt(num))
    if num == 2 or num == 3 or num == 5:
        return True
    elif num < 2 or num % 2 == 0 or num % 3 == 0 or num % 5 == 0:
        return False
    else:
        while i <= k and num % (i+1) != 0 and num % (i+5) != 0:
            i = i + 6
    return i > k

def main():
    n = int(input())
    if isPrime(n) == True:
        print("To jest liczba pierwsza")
    else:
        print("To nie jest liczba pierwsza")

if __name__=="__main__":
    main()