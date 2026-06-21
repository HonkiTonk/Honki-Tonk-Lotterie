private with Datentypen;

package Gluecksspirale is
   pragma Elaborate_Body;

   procedure Gluecksspirale;
   
private
   
   AnzahlZahlen : Positive;
   
   Zwischenspeicher : Natural;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (Datentypen.ZahlenanzahlGlücksspirale'Range);

end Gluecksspirale;
