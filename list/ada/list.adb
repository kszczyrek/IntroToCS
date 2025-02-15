with Ada.Text_IO; use Ada.Text_IO;

package body list is
   function isEmpty (l : ListT) return Boolean is
   begin
      return l.first = null;
   end isEmpty;

   function Get (l : ListT; i : in Integer) return Integer is
      n : NodePtr := l.first;
   begin
      for j in 2..i loop 
         n := n.next;
      end loop;
      return n.elem;
   end Get;

   function Pop (l : in out ListT) return Integer is
      n : NodePtr := l.first;
      e : Integer := n.elem;
   begin
      l.first := n.next;
      if l.first = null then -- last element
         l.last := null;
      end if;
      Free (n);
      return e;
   end Pop;

   procedure Push (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      n.next := l.first;
      l.first := n;
      if l.last = null then -- first element
         l.last := n;
      end if;
   end Push;

   procedure Append (l : in out ListT; e : Integer) is
      n : NodePtr := new Node;
   begin
      n.elem := e;
      if l.first = null then -- first element
         l.first := n;
      else
         l.last.next := n;
      end if;
      l.last := n;
   end Append;

   procedure Insert ( l : in out ListT; i : Integer; e : Integer) is
      n : NodePtr := new Node;
      k : NodePtr := l.first;
   begin
      if i = 1 then
         push(l, e);
      elsif i-1 = Length(l) then
         Append(l, e);
      else
         n.elem := e;
         for j in 2..i-1 loop 
            k := k.next;
         end loop;
         n.next := k.next;
         k.next := n;
      end if;   
   end Insert;

   procedure Put (l : in out ListT; i : in Integer; e : in Integer) is
      n : NodePtr := l.first;
   begin
      if isEmpty(l) then
         Push(l, e);
      elsif i - 1 = Length(l) then
         Append(l, e);
      else
         for j in 2 .. i loop
            n := n.next;
         end loop;
         n.elem := e;
      end if;
   end Put;

   procedure Delete (l : in out ListT; i : Integer) is
      n : NodePtr := l.first;
      k : NodePtr := l.last;
      temp : Integer := 0;
   begin
      if i = Length(l) then
         for j in 2..i-1 loop 
            n := n.next;
         end loop;
         n.next := null;
         l.last := n;
         Free(k);
      elsif i = 1 then
         temp := Pop(l);
      else 
         for j in 2..i-1 loop -- i - 2 razy sie wykonuje
            n := n.next;
         end loop;
         k := n.next;
         n.next := k.next;
         Free(k); -- [n] -> [k(i-ty element)] -> [k.next] srodkowego usuwamy
      end if;
   end Delete;

   procedure Clean (l : in out ListT) is
      temp : Integer;
   begin
      while not isEmpty(l) loop
         temp := Pop(l);
      end loop;
   end Clean;

   procedure Print (l : ListT) is
      n : NodePtr := l.first;
   begin
      while n /= null loop
         Put (n.elem'Image);
         n := n.next;
      end loop;
      Put_Line (" (" & Length (l)'Image & " )");
   end Print;

   function Length (l : ListT) return Integer is
      i : Integer := 0;
      n : NodePtr := l.first;
   begin
      while n /= null loop
         i := i + 1;
         n := n.next;
      end loop;
      return i;
   end Length;
end list;
