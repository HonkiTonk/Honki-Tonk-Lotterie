package Datentypen is
   pragma Pure;

   type GezogeneZahlenArray is array (Positive range <>) of Positive;

   type Eurozahlen is record

      ZahlEins : Positive;
      ZahlZwei : Positive;

   end record;

   subtype Zahlenauswahl6aus49 is Positive range 1 .. 49;
   subtype ZahlenauswahlEurojackpot is Positive range 1 .. 50;
   subtype ZahlenauswahlEurozahlen is ZahlenauswahlEurojackpot range 1 .. 12;

   subtype Zahlenanzahl6aus49 is Zahlenauswahl6aus49 range 1 .. 6;
   subtype ZahlenanzahlEurojackpot is ZahlenauswahlEurozahlen range 1 .. 5;

   subtype ZahlenauswahlSuperzahl is Natural range 0 .. 9;

end Datentypen;
