with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Dwumian; 

procedure Main is
    N : Natural;
    K : Natural;
begin
    Put("Podaj n: ");
     Get(N);
    Put("Podaj k: ");
     Get(K);
    Put("Dwumian z n =" & Natural'Image(N) & " i k =" & Natural'Image(K) & " to ");
    Ada.Integer_Text_IO.Put(Dwumian.ObliczDwumian(N,Dwumian.Minimum(N, K)), 0);    
end Main;
 