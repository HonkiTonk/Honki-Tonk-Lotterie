with Datentypen;

package Anzeige is
   pragma Elaborate_Body;

   procedure Anzeige
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray);
   
   procedure Superzahl
     (SuperzahlExtern : in Natural)
     with
       Pre => (SuperzahlExtern in Datentypen.ZahlenauswahlSuperzahl'Range);
   
   procedure Eurozahlen
     (EurozahlenExtern : in Datentypen.Eurozahlen)
     with
       Pre => (
                 EurozahlenExtern.ZahlEins in Datentypen.ZahlenauswahlEurozahlen'Range
               and
                 EurozahlenExtern.ZahlZwei in Datentypen.ZahlenauswahlEurozahlen'Range
               and
                 EurozahlenExtern.ZahlEins < EurozahlenExtern.ZahlZwei
              );

end Anzeige;
