def binomalThorem(n, k):
    if ((n-k) < k):
        k = n - k
    l = list(range(k+1))
    i, z = {1, 0}
    l[0] = 1  
    while i <= n:
        if i <= k:
            l[i] = 1
            z = i - 1
        else:
            z = k
        while z >= 1:
            l[z] = l[z] + l[z-1]
            z = z - 1
        i = i + 1
    return l[k]

def main():
    n = int(input("Podaj n: "))
    k = int(input("Podaj k: "))
    print(f"Dwumian newtona z n = {n} i k = {k} to: {binomalThorem(n, k)}")

if __name__ == "__main__":
    main()