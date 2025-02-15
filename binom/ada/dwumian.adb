with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Dwumian is

function Minimum (N : in Natural; BuforK : in Natural) return Natural is
    K : Natural := BuforK;
    begin 
        if ((N - K) < K) then
            return N - K;
        else 
            return K;
        end if;
    end Minimum;

function ObliczDwumian (N : in Natural; K : in Natural) return Natural is
    Arr : array (0 .. K) of Natural;
    I : Natural := 1;
    Z : Natural := 0; 
begin
    Arr(0) := 1;

    while I <= N loop
        if I <= K then
            Arr(I) := 1;
            Z := I - 1;
        else 
            Z := K;
        end if;
        while Z >= 1 loop
            Arr(Z) := Arr(Z) + Arr(Z-1);
            Z := Z - 1;
        end loop;
        I := I+1;
    end loop;
    
    return Arr(K);
end ObliczDwumian;

end Dwumian;