with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure Main is

    function isPrime (Num : in Natural) return Boolean is
        I : Natural := 6;
        K : Natural := Natural(sqrt(Float(Num)));
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
    end isPrime;

    N : Natural := 0;
begin
    while True loop
    Get(N);
    if isPrime(N) = True then
        Put_Line("Liczba jest pierwsza");
    else 
        Put_Line("Liczba nie jest pierwsza");
    end if;
    end loop;
end Main;
 