with Datentypen;

package Lotto6aus49 is
   pragma Elaborate_Body;

   procedure Lotto6aus49;

private

   AnzahlZahlen : Positive;
   Zwischenspeicher : Positive;

   GezogeneZahlen : Datentypen.GezogeneZahlenArray (Datentypen.Zahlenanzahl6aus49'Range);

end Lotto6aus49;
