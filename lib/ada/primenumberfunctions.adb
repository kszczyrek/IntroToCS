with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body PrimeNumberFunctions is

   function PrimeNumbers (n : Positive) return Positive is

   type Sieve is array (2 .. n) of Boolean;

      procedure ComputeSieve (s : in out Sieve) is
         l : Natural := 3;
         j : Natural;
         k : Natural := Natural(Sqrt(Float(n)));
      begin
        s(2) := True;
         while l <= s'Last loop
            s(l) := True;
            l := l + 2;
         end loop;
         for i in s'First .. k loop
            if s(i) then
               j := i * i;
               while j <= n loop
                  s(j) := False;
                  j := j + (i * 2);
               end loop;
            end if;
         end loop;
      end ComputeSieve;

      function CountPrimes (s : Sieve) return Natural is
         l : Natural := 3;
         c : Natural := 0;
      begin
            if s(2) then
               c := c + 1; 
            end if;
         while l <= s'Last loop
            if s(l) then
               c := c + 1;
            end if;
               l := l + 2;
         end loop;
         return c;
      end CountPrimes;

      s : Sieve;
   begin
      ComputeSieve(s);
      return Positive(CountPrimes(s));

   end PrimeNumbers;

   function Prime (N : Positive) return Positive is 
  
      Primes : array (1 ..N) of Natural; 
      FoundPrimes : Natural := 1;
      PotentialPrime : Natural := 3;
      IsPrime : Boolean;

   begin

      Primes(1) := 2;
        
        while FoundPrimes < N loop
            
            IsPrime := True;
            
            for J in 1 .. FoundPrimes loop
    
                if (Primes(J) * Primes(J)) > PotentialPrime then
                    exit;
                elsif (PotentialPrime mod Primes(J)) = 0 then
                    IsPrime := False;                    
                end if;

            end loop;

            if IsPrime then
                FoundPrimes := FoundPrimes + 1;
                Primes(FoundPrimes) := PotentialPrime;
            end if;

            PotentialPrime := PotentialPrime + 2;

        end loop;            

        return Positive(Primes(N));    
      
   end Prime;
   
   function IsPrime (n : Positive) return Boolean is

      Num : Natural := Natural(n);
      I : Natural := 6;
      K : Natural := Natural(sqrt(Float(n)));

   begin

      if Num = 2 or Num = 3 or Num = 5 then
         return True;
      end if;
      if Num < 2 or Num mod 2 = 0 or Num mod 3 = 0 or Num mod 5 = 0 then
         return False;
      end if;
      while I <= K and Num mod (I+1) /= 0 and Num mod(I + 5) /= 0 loop
         I := I + 6;
      end loop;
      return (I > K);

   end IsPrime;

end PrimeNumberFunctions;