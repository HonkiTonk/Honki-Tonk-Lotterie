package Datentypen is
   pragma Pure;

   type GezogeneZahlenArray is array (Positive range <>) of Natural;

   type Eurozahlen is record

      ZahlEins : Positive;
      ZahlZwei : Positive;

   end record;

   subtype Zahlenauswahl6aus49 is Positive range 1 .. 49;

   subtype ZahlenauswahlEurojackpot is Positive range 1 .. 50;
   subtype ZahlenauswahlEurozahlen is ZahlenauswahlEurojackpot range 1 .. 12;

   subtype ZahlenauswahlKeno is Positive range 1 .. 70;

   subtype ZahlenauswahlGlücksspirale is Natural range 0 .. 9;



   GrößterZahlenbereich : constant Positive := 12;

   subtype Zahlenanzahl6aus49Vollsystem is Zahlenauswahl6aus49 range 1 .. 12;
   subtype ZahlenanzahlEurojackpot is ZahlenauswahlEurozahlen range 1 .. 5;
   subtype ZahlenanzahlKeno is ZahlenauswahlKeno range 1 .. 10;
   subtype ZahlenanzahlGlücksspirale is ZahlenauswahlGlücksspirale range 1 .. 7;

   subtype ZahlenauswahlSuperzahl is Natural range 0 .. 9;

   type VollsystemZahlenbereichArray is array (Character'Val (Character'Pos ('1')) .. '6') of Zahlenanzahl6aus49Vollsystem;
   VollsystemZahlenbereich : constant VollsystemZahlenbereichArray := (
                                                                       '1' => 7,
                                                                       '2' => 8,
                                                                       '3' => 9,
                                                                       '4' => 10,
                                                                       '5' => 11,
                                                                       '6' => 12
                                                                      );

end Datentypen;
