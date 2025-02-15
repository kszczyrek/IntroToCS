with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body EulersFunction is

   function Prime_Factorization (N : in  Natural) return FactorizationArray is
      
      Arr : FactorizationArray := (others => 1);
      Number : Natural := N;
      Divisor : Natural := 2;
      Exponent : Natural := 0;
      Index : Natural := 1;
      K : Natural := 0;
      IsFirstFactor : Boolean := True;

   begin 

       -- Warunek dla jedynki
        if Number = 1 then
            return Arr;
        end if;

        -- Dzielenie przez 2
        while Number mod Divisor = 0 loop
            Number := Number / Divisor;
            Exponent := Exponent + 1; 
        end loop;
            if Exponent > 0 then
               while Exponent /= 0 loop
                  Arr(Index) := 2;
                  Index := Index + 1; 
                  Exponent := Exponent - 1;
               end loop;   
            end if;

        -- Dzielenie przez co d+2 zaczynajac od 3
            Divisor := 3;

        while Number > 1 loop
            K := Natural(sqrt(float(Number)));
        -- Przerwanie petli jesli dzielnik jest wiekszy od pierwiastka z liczby
            if Divisor > K then
               Arr(Index) := Number;
               Index := Index + 1; 
               Number := 1;
            end if;
        -- Petla dzielaca liczbe przez jej czynniki i zwiekszajaca wykladnika
            while Number mod Divisor = 0 loop
                Number := Number / Divisor;
                Exponent := Exponent + 1; 
            end loop;
        -- Warunek wypisujacy czynniki
            if Exponent > 0 then
               while Exponent /= 0 loop
                  Arr(Index) := Divisor;
                  Index := Index + 1; 
                  Exponent := Exponent - 1;
               end loop;   
            end if;
        -- Reset wykladnika i inkrementacja dzielnika
            Divisor := Divisor + 2;
        end loop;

      return Arr;

   end Prime_Factorization;

   function Totient (N : in Positive) return Positive is
      
      Now, Result, I : Natural := 1;
      PrimeFactorsCounter : Natural := 0;
      Arr : FactorizationArray := Prime_Factorization(Natural(N));

   begin

      -- Totient(1) = 1
      if Arr(1) = 1 then
         return 1;
      end if;

      -- We count how much prime factors there is, 
      -- because array has 63 indexes(we can have maximum 63 prime factors)
      -- and when index is empty it has value 1 by default 
      -- but we can't iterate throught 1 because of the algorithm
      while Arr(I) /= 1 loop
         PrimeFactorsCounter := PrimeFactorsCounter + 1;
         I := I + 1;
      end loop;

      for J in 1..PrimeFactorsCounter loop
         if Arr(J) /= Now then
            Result := Result * (Arr(J) - 1);
            Now := Arr(J);
         else 
            Result := Result * Arr(J);
         end if;
      end loop;

      return Positive(Result);

   end Totient;

end EulersFunction;