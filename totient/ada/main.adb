with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with EulersFunction; use EulersFunction;
procedure Main is

begin

   if Argument_Count < 1 then
      Put_Line("Please, pass the arguments throught the command line");   
   end if;

   for J in 1..Argument_Count loop
      Put("Totient("); Ada.Integer_Text_IO.Put(Positive'Value(Argument(J)), 0); Put(") = ");
      Ada.Integer_Text_IO.Put(Totient(Positive'Value(Argument(J))), 0);
      Put_Line("");
   end loop;

end Main;
   