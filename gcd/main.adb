with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure NWD is
    A : Natural;
    B : Natural;
    C : Natural;
begin

    -- Interfejs i podanie zmiennych
    Put_Line("Oblicz NWD(a,b)!");
    Put("Podaj liczbe A: ");
     Get(A);
    Put("Podaj liczbe B: ");
     Get(B);
    Put("NWD(" & Natural'Image(A) & "," & Natural'Image(B) & ") =");

    -- Algorytm NWD(A,B)
    while B /= 0 loop
        C := B;
        B := A mod B;
        A := C;
    end loop;

    -- Wypisanie NWD
    Put_Line(Natural'Image(A));

end NWD;