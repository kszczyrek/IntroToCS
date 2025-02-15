with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with PrimeNumberFunctions; use PrimeNumberFunctions;
procedure Main is

begin
  
if (Argument(1) = "pn") then
   Ada.Integer_Text_IO.Put(PrimeNumbers(Positive'Value(Argument(2))), 0);
   Put_Line("");
elsif (Argument(1) = "pr") then
   Ada.Integer_Text_IO.Put(Prime(Positive'Value(Argument(2))), 0);
   Put_Line("");
elsif (Argument(1) = "ip") then   
   if (IsPrime(Positive'Value(Argument(2)))) then
      Put_Line("True");
   else
      Put_Line("False");
   end if;
end if;

end Main;
 