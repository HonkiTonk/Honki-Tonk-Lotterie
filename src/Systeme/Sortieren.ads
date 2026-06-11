with Datentypen;

package Sortieren is
   pragma Elaborate_Body;

   function SortierenLotto6aus49
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray;
   
   function SortierenEurojackpot
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray;
   
private

   Getauscht : Boolean;

   Zwischenspeicher : Natural;
   
   Lotto6aus49Sortieren : Datentypen.GezogeneZahlenArray (1 .. 6);
   EurojackpotSortieren : Datentypen.GezogeneZahlenArray (1 .. 5);

end Sortieren;
