private with Datentypen;

package Keno is
   pragma Elaborate_Body;

   procedure Keno;
   
private
   
   Eingabe : Character;
   
   CharakterpositionNull : constant Positive := 48;
   
   KenoTyp : Positive;
   Zwischenspeicher : Positive;
   AnzahlZahlen : Positive;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (Datentypen.ZahlenanzahlKeno'Range);

end Keno;
