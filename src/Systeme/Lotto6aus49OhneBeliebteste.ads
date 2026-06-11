with Datentypen;

package Lotto6aus49OhneBeliebteste is
   pragma Elaborate_Body;

   procedure Lotto6aus49;

private

   AnzahlZahlen : Positive;

   Zwischenspeicher : Natural;
   
   subtype BeliebterZahlenbereichEins is Positive range 1 .. 13;
   subtype BeliebterZahlenbereichZwei is Positive range 17 .. 19;
   subtype BeliebterZahlenbereichDrei is Positive range 23 .. 27;
   subtype BeliebterZahlenbereichVier is Positive range 31 .. 33;
   subtype BeliebterZahlenbereichFünf is Positive range 49 .. 49;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (1 .. 6);

end Lotto6aus49OhneBeliebteste;
