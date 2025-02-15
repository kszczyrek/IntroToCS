import totient as t
import sys as s

def main():
    if(len(s.argv) < 2):
        print("Please put arguments for totient(n) throught the commnad line!")
    else:
        for i in range (1, len(s.argv)):
            print(f"totient({s.argv[i]}) = {int(t.totient(int(s.argv[i])))}")

if __name__ == "__main__":
    main()