with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
procedure Main is

    procedure Prime_Factorization (N : in  Natural) is
        Number : Natural := N;
        Divisor : Natural := 2;
        K : Natural := Natural(sqrt(float(Number)));
        Exponent : Natural := 0;
        IsFirstFactor : Boolean := True;
    begin
            Ada.Integer_Text_IO.Put(Number, 0);
            Put(" =");
        -- Warunek dla jedynki
        if Number = 1 then
            Put(" 1");
        end if;
        -- Dzielenie przez 2
        while Number mod Divisor = 0 loop
            Number := Number / Divisor;
            Exponent := Exponent + 1; 
        end loop;
            if Exponent > 0 then
                Put(" 2");
                IsFirstFactor := False;
                if Exponent > 1 then
                    Put("^");
                    Ada.Integer_Text_IO.Put(Exponent, 0);
                end if;
                Exponent := 0;
            end if;
        -- Dzielenie przez co d+2 zaczynajac od 3
            Divisor := 3;
        while Number > 1 loop
            K := Natural(sqrt(float(Number)));
        -- Przerwanie petli jesli dzielnik jest wiekszy od pierwiastka z liczby
            if Divisor > K then
                if IsFirstFactor = False then
                    Put(" *");
                end if;
                    Put(Natural'Image(Number));
                    Number := 1;
            end if;
        -- Petla dzielaca liczbe przez jej czynniki i zwiekszajaca wykladnika
            while Number mod Divisor = 0 loop
                Number := Number / Divisor;
                Exponent := Exponent + 1; 
            end loop;
        -- Warunek wypisujacy czynniki
                if Exponent > 0 then
                    if IsFirstFactor = False then
                        Put(" *");
                    end if;
                    Put(Natural'Image(Divisor));
                    IsFirstFactor := False;
                    if Exponent > 1 then
                        Put("^"); 
                        Ada.Integer_Text_IO.Put(Exponent, 0);
                    end if;
                end if;
        -- Reset wykladnika i inkrementacja dzielnika
                Exponent := 0;
                Divisor := Divisor + 2;
        end loop;
    end Prime_Factorization;

    N : Natural := 0;
begin
    Get(N);
    Prime_Factorization(N);
end Main;
 