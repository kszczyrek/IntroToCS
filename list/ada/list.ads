with Ada.Unchecked_Deallocation;

package list is
   type ListT is private;

   function isEmpty (l : ListT) return Boolean;
   function Pop (l : in out ListT) return Integer;
   procedure Push (l : in out ListT; e : Integer);
   procedure Append (l : in out ListT; e : Integer);

   function Get (l : ListT ; i : in Integer) return Integer;
   procedure Put (l : in out ListT; i : in Integer; e : in Integer);
   procedure Insert (l : in out ListT; i : Integer; e : Integer);
   procedure Delete (l : in out ListT; i : Integer);
   procedure Clean (l : in out ListT);

   procedure Print (l : ListT);
   function Length (l : ListT) return Integer;
private
   type Node;
   type NodePtr is access Node;
   type Node is record
      elem : Integer := 0;
      next : NodePtr := null;
   end record;

   type ListT is record
      first : NodePtr := null;
      last  : NodePtr := null;
   end record;

   procedure Free is
      new Standard.Ada.Unchecked_Deallocation (Node, NodePtr);
end list;
