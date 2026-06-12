with Datentypen;

package Lotto6aus49OhneBeliebteste is
   pragma Elaborate_Body;

   procedure Lotto6aus49;

private

   AnzahlZahlen : Positive;

   Zwischenspeicher : Natural;
   
   subtype BeliebterZahlenbereichEins is Datentypen.Zahlenauswahl6aus49 range 1 .. 13;
   subtype BeliebterZahlenbereichZwei is Datentypen.Zahlenauswahl6aus49 range 17 .. 19;
   subtype BeliebterZahlenbereichDrei is Datentypen.Zahlenauswahl6aus49 range 23 .. 27;
   subtype BeliebterZahlenbereichVier is Datentypen.Zahlenauswahl6aus49 range 31 .. 33;
   subtype BeliebterZahlenbereichFünf is Datentypen.Zahlenauswahl6aus49 range 49 .. 49;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (Datentypen.Zahlenanzahl6aus49'Range);

end Lotto6aus49OhneBeliebteste;
