with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Main is

procedure Hetmani (N : in out Integer; C : in out Integer) is
   
   type Pos is array (1 .. N) of Integer;
   type W1 is array (1 .. N) of Boolean;
   type P1 is array (2 .. 2*N) of Boolean;
   type P2 is array (1-N .. N-1) of Boolean;
   Position : Pos := (others => 0);
   Bije_wiersz : W1 := (others => False);
   Bije_przek : P1 :=(others => False);
   Bije_przek2 : P2 :=(others => False);

   procedure Ustaw (I : in Integer; N : in out Integer; C : in out Integer; Position : in out Pos; Bije_wiersz : in out W1; Bije_przek : in out P1; Bije_przek2 : in out P2) is
   begin
      for J in 1 .. N loop
         if not (Bije_wiersz(J) or Bije_przek(I+J) or Bije_przek2(I-J)) then
            Position(I) := J;
            Bije_wiersz(J) := True;
            Bije_przek(I+J) := True;
            Bije_przek2(I-J) := True;
            if I < N then
               Ustaw(I+1, N, C, Position, Bije_wiersz, Bije_przek, Bije_przek2);
            else 
               for K in 1 .. N loop
                  Ada.Integer_Text_IO.Put(Position(K), 0);
               end loop;
               C := C + 1;
               Put_Line("");
            end if;
            Position(I) := 0;
            Bije_wiersz(J) := False;
            Bije_przek(I+J) := False;
            Bije_przek2(I-J) := False;
         end if;
      end loop;
   end Ustaw;

begin
   Ustaw(1, N, C, Position, Bije_wiersz, Bije_przek, Bije_przek2);   
end Hetmani;

   N : Integer := 0;
   C : Integer := 0;

begin
   Put("Podaj bok kwadratu N na ktorym chcesz sprawdzic ilosc rozwiazan dla N hetmanow: ");
   Get(N);
   Hetmani(N, C);
   Put("Liczba rozwiazan: "); Ada.Integer_Text_IO.Put(C, 0); Put_Line(""); --Linijka tekstu
end Main;