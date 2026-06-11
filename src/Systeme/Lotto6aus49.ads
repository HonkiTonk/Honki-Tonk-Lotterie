with Datentypen;

package Lotto6aus49 is
   pragma Elaborate_Body;

   procedure Lotto6aus49;

private

   AnzahlZahlen : Positive;

   Zwischenspeicher : Natural;

   GezogeneZahlen : Datentypen.GezogeneZahlenArray (1 .. 6);

end Lotto6aus49;
