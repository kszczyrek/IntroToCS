with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use  Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

with list; use list;

procedure Main is
   l : ListT;
   r, i : Integer;
   command : Unbounded_String;
   continue : Boolean := True;
begin
   while continue loop
      Put ("Command: ");
      Get_Line (command);
      if command = "Pop" then
         if not isEmpty (l) then
            r := Pop (l);
            Put_Line ("Result: " & r'Image);
         else
            Put_Line ("Error - stack is empty!");
         end if;
      elsif command = "Get" then
         if not isEmpty(l) then
            Put("Index: ");
            Get (i);
            Skip_Line;
            if (i > Length(l)) then
               Put_Line("Error - bad index!");
            else
               Put_Line("Result:" & Integer'Image(Get(l, i)));
            end if; 
         else 
            Put_Line("Error - stack is empty!");
         end if;
         -- Czemu robi sie Unknown command?
      elsif command = "Push" then
         Put ("Value: ");
         Get (r);
         Skip_Line;
         Push (l, r);
         Put_Line ("Result: OK");
      elsif command = "Append" then
         Put ("Value: ");
         Get (r);
         Skip_Line;
         Append (l, r);
         Put_Line ("Result: OK");
      elsif command = "Put" then
         Put("Index: ");
         Get(i);
         if i-1 > Length(l) then
            Put_Line("Error - bad index!");
            Skip_Line;
         else
            Put("Value: ");
            Get(r);
            Skip_Line;
            list.Put(l, i, r);
            Put_Line("Result: OK");
         end if;
      elsif command = "Insert" then
         Put("Index: ");
         Get(i);
         if i-1 > Length(l) then
            Put_Line("Error - bad index!");
            Skip_Line;
         else 
            Put("Value: ");
            Get(r);
            Skip_Line;
            Insert(l, i, r);
         Put_Line("Result: OK");
         end if;
      elsif command = "Delete" then
         Put("Index: ");
         Get(i);
         Skip_Line;
         if i > Length(l) then
            Put_Line("Error - bad index!");
         else
            list.Delete(l, i);
            Put_Line("Result: OK");
         end if;         
      elsif command = "Clean" then
         Clean(l);
         Put_Line("Result: OK");
      elsif command = "Print" then
         Put ("Result: ");
         Print (l);
      elsif command = "Length" then
         r := Length (l);
         Put_Line ("Result: " & r'Image);
      elsif command = "Exit" then
         continue := False;
      else
         Put_Line ("Unknown command!");
      end if;
   end loop;
   --  clean list
   while not isEmpty (l) loop
      r := Pop (l);
   end loop;
end Main;

