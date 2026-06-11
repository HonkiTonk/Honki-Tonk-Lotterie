with Datentypen;

package Anzeige is
   pragma Elaborate_Body;

   procedure Anzeige
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray);
   
   procedure Superzahl
     (SuperzahlExtern : in Natural)
     with
       Pre => (SuperzahlExtern in 0 .. 9);
   
   procedure Eurozahlen
     (EurozahlEinsExtern : in Positive;
      EurozahlZweiExtern : in Positive)
     with
       Pre => (
                 EurozahlEinsExtern in 1 .. 12
               and
                 EurozahlZweiExtern in 1 .. 12
               and
                 EurozahlEinsExtern < EurozahlZweiExtern
              );

end Anzeige;
