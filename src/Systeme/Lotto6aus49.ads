package Lotto6aus49 is
   pragma Elaborate_Body;

   procedure Lotto6aus49;

private

   Getauscht : Boolean;

   AnzahlZahlen : Positive;

   Zwischenspeicher : Natural;

   type GezogeneZahlenArray is array (1 .. 6) of Positive;
   GezogeneZahlen : GezogeneZahlenArray;
   ZahlenSortieren : GezogeneZahlenArray;



   function Sortieren
     (ZahlenExtern : in GezogeneZahlenArray)
      return GezogeneZahlenArray;

end Lotto6aus49;
