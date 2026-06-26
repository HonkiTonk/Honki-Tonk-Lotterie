private with Datentypen;

package Lotto6aus49 is
   pragma Elaborate_Body;

   procedure Lotto6aus49
     (ZahlenanzahlExtern : in Positive)
     with
       Pre => (
                 ZahlenanzahlExtern in 6 .. 12
              );

   procedure Vollsystem
     (AlleZahlenExtern : in Boolean);

private

   Eingabe : Character;

   Zahlenposition : Positive;
   Zwischenspeicher : Positive;

   GezogeneZahlen : Datentypen.GezogeneZahlenArray (Datentypen.Zahlenanzahl6aus49Vollsystem'Range);

end Lotto6aus49;
