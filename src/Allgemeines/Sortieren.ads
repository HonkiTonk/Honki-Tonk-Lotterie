with Datentypen;

package Sortieren is
   pragma Preelaborate;
   
   function Sortieren
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray;
   
   function SortierenEurozahlen
     (EurozahlenExtern : in Datentypen.Eurozahlen)
      return Datentypen.Eurozahlen
     with
       Pre => (EurozahlenExtern.ZahlEins /= EurozahlenExtern.ZahlZwei),
   
       Post => (SortierenEurozahlen'Result.ZahlEins < SortierenEurozahlen'Result.ZahlZwei);
   
private

   Getauscht : Boolean;

   Zwischenspeicher : Positive;
   
   ZahlenSortieren : Datentypen.GezogeneZahlenArray (1.. Datentypen.GrößterZahlenbereich);

end Sortieren;
