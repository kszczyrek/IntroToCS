with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Sprawdz_Palindrom is
    Liczba, Liczba_Kopia, Odwrocona_Liczba, System, Reszta : Integer;
begin
    -- Interfejs i wprowadzenie danych
    Put("Podaj liczbe : ");
    Get(Liczba);
    Put("Podaj system : ");
    Get(System);
    -- Algorytm odwracajacy liczbe
    Liczba_Kopia := Liczba;
    Odwrocona_Liczba := 0;
    while Liczba_Kopia > 0 loop
        Reszta := Liczba_Kopia mod System;
        Liczba_Kopia := Liczba_Kopia / System;
        Odwrocona_Liczba := Odwrocona_Liczba * System + Reszta;
    end loop;
    -- Sprawdzenie czy to palindrom w podanym systemie
    if Odwrocona_Liczba = Liczba then
        Put_Line("To palindrom");
    else 
        Put_Line("To nie palindrom");
    end if;
end Sprawdz_Palindrom;
 
