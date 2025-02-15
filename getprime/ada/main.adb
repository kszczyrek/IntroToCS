with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is
    function getPrime (N : in Natural) return Natural is
        Primes : array (1 .. N) of Natural; 
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

        return Primes(N);    

    end getPrime;

N : Natural := 0;
begin
    Get(N);
    Ada.Integer_Text_IO.Put(N, 0); 
    Put(". liczba pierwsza to: ");
    Ada.Integer_Text_IO.Put(getPrime(N), 0);
end Main;
 