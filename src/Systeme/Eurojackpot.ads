with Datentypen;

package Eurojackpot is
   pragma Elaborate_Body;

   procedure Eurojackpot;
   
private
   
   AnzahlZahlen : Positive;
   EurozahlEins : Positive;
   EurozahlZwei : Positive;
   
   Zwischenspeicher : Natural;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (1 .. 5);

end Eurojackpot;
