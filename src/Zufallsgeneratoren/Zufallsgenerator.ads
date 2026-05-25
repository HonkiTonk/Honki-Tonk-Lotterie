private with Ada.Numerics.Discrete_Random;

package Zufallsgenerator is
   pragma Elaborate_Body;
   
   function Würfelergebnis
     (SeitenanzahlExtern : in Positive)
      return Positive;
   
private
   
   package Zahlenbereich is new Ada.Numerics.Discrete_Random (Result_Subtype => Integer);
   
   GewählteZahl : Zahlenbereich.Generator;

end Zufallsgenerator;
