with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Main is

   type FuncType is access function (x : Float) return Float;

   function HalfCos(x : Float) return Float is
   begin
      return Cos(x / 2.0);
   end HalfCos;

   function FindZero(f : FuncType; a, b, eps : in out Float) return Float is
      mid : Float;
   begin
      -- Sprawdzanie warunku początkowego
      if f(a) * f(b) >= 0.0 then
         Put_Line ("Funkcja nie spełnia warunku f(a) * f(b) < 0");
         return -1.0; 
      end if;

       -- Algorytm bisekcji
         while (b - a) > eps loop
               mid := (a + b) / 2.0;
            if f(mid) < eps then
               return mid; 
            elsif f(a) * f(mid) < 0.0 then
               b := mid;
            else
               a := mid;
            end if;
         end loop;
         return (a + b) / 2.0; -- Przybliżone miejsce zerowe
   end FindZero;

   a, b : Float;
   epsilons : array(1 .. 8) of Float := (1.0e-1, 1.0e-2, 1.0e-3, 1.0e-4, 1.0e-5, 1.0e-6, 1.0e-7, 1.0e-8);
   zero : Float;
begin
   Put ("Podaj a: ");
   Get(a);
   Put ("Podaj b: ");
   Get(b);

   a := a * 3.14159265358979;
   b := b * 3.14159265358979;
   -- Wypisanie wyników dla różnych dokładności
   Put_Line("Znajdowanie miejsca zerowego funkcji cos(x/2) w przedziale [a, b]:");
   for i in 1 .. 8 loop
      zero := FindZero(HalfCos'Access, a, b, epsilons(i));
      Put("eps = " & Float'Image(epsilons(i)) & ", zero = ");
      Ada.Float_Text_IO.Put(zero / 3.14159265358979, Fore => 0, Aft => 10, Exp => 0);
      Put_Line("");
   end loop;
end Main;