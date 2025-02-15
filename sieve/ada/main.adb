with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Exceptions; use Ada.Exceptions;
procedure PrimeNumbers is

   procedure GetNaturalNumber(input : in out Integer)  is
      begin
         while True loop
            Put_Line("Prosze podac liczbe naturalna: ");
            Get(input);
            if input > 0 then
               exit;
            else 
               Put_Line("Niepoprawne wejscie - liczba nie jest naturalna: ");
            end if;
         end loop;
      end GetNaturalNumber;

   function PrimeNumbers (n : Natural) return Natural is
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
      return CountPrimes(s);
   end PrimeNumbers;

   n : Integer;
begin

   GetNaturalNumber(n);
   Put("W zakresie od 0 do podanej liczby jest ");
   Ada.Integer_Text_IO.Put(PrimeNumbers(Natural(n)), 0);
   Put_Line(" liczb pierwszych");

      exception
         when Data_Error =>
            Put_Line("To nie jest liczba calkowita");
end PrimeNumbers;

