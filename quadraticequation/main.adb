with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure FunkcjaKwadratowa is
    -- Deklaracja zmiennych
    A : Float;
    B : Float;
    C : Float;
    Del : Float;
    X1 : Float;
    X2 : Float;
begin
    -- Wprowadzenie wartosci wspolczynnikow A, B, C
     Put_Line("Oblicz funkcje kwadratowa!");   
    Put("Podaj wartosc wspolczynnika A: ");
     Get(A);
    Put("Podaj wartosc wspolczynnika B: ");
     Get(B);
    Put("Podaj wartosc wspolczynnika C: ");
     Get(C);

    -- Policzenie delty i pierwiastkow
    Del := (B * B) - (Float(4) * A * C);

    -- Policzenie pierwiastkow
    -- Delta mniejsza od zera
    if Del < Float(0) then
        Put_Line("Funkcja nie ma miejsc zerowych");
    end if;

    -- Delta wieksza od zera
    if Del > Float(0) then
        X1 := ((Float(-1) * B) - Sqrt(Del)) / (Float(2) * A);
         X2 := ((Float(-1) * B) + Sqrt(Del)) / (Float(2) * A);
        
        Ada.Text_IO.Put("Ta funkcja ma dwa miejsca zerowe X1 = ");
         Ada.Float_Text_IO.Put(Item => X1, Fore => 0, Aft => 3, Exp => 0);
        Ada.Text_IO.Put(" i X2 = ");
         Ada.Float_Text_IO.Put(Item => X2, Fore => 0, Aft => 3, Exp => 0);
        Put_Line("");
    end if;

    -- Delta rowna zero
    if Del = Float(0) then
        X1 := ((Float(-1) * B) / (Float(2) * A));
        
        Ada.Text_IO.Put("Ta funkcja ma jedno miejsce zerowe X1 = ");
         Ada.Float_Text_IO.Put(Item => X1, Fore => 0, Aft => 3, Exp => 0);
        Put_Line("");
    end if;

end FunkcjaKwadratowa;
 