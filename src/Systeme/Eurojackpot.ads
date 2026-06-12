with Datentypen;

package Eurojackpot is
   pragma Elaborate_Body;

   procedure Eurojackpot;
   
private
   
   AnzahlZahlen : Positive;
   Zwischenspeicher : Positive;
   
   GezogeneEurozahlen : Datentypen.Eurozahlen;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (Datentypen.ZahlenanzahlEurojackpot'Range);

end Eurojackpot;
