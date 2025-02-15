import package as p
import sys as s
def main():
    if (len(s.argv) < 2):
        print("Please use command line to use functions 'ip x' = isPrime(x) 'pr x' = CountPrimesLeq(n) 'pr x' getXthPrime(x)")
    else:
        if (s.argv[1] == "ip"):
            print(p.IsPrime(int(s.argv[2]))) 
        elif (s.argv[1] == "pr"):
            print(p.Prime(int(s.argv[2])))
        elif (s.argv[1] == "pn"):
            print(p.PrimeNumbers(int(s.argv[2])))
        else:
            print("Invalid input")
if __name__ == "__main__":
    main()