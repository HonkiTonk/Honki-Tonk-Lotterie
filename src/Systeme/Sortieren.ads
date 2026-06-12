with Datentypen;

package Sortieren is
   pragma Preelaborate;

   function SortierenLotto6aus49
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray;
   
   function SortierenEurojackpot
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
   
   Lotto6aus49Sortieren : Datentypen.GezogeneZahlenArray (Datentypen.Zahlenanzahl6aus49'Range);
   EurojackpotSortieren : Datentypen.GezogeneZahlenArray (Datentypen.ZahlenanzahlEurojackpot'Range);

end Sortieren;
