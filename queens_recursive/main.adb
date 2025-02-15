with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with QueensProblem; use QueensProblem;
procedure Main is
X : Natural := 0;
begin
   Put("How large do you want the board to be? Widht and height = "); 
   Get(X);
   HowCanYouFitNQueens(X);
end Main;
 