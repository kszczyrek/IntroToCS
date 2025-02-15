package EulersFunction is

   type FactorizationArray is array(1..63) of Natural;
   
   function Prime_Factorization (N : in  Natural) return FactorizationArray;

   function Totient (N : in Positive) return Positive;
 
end EulersFunction;