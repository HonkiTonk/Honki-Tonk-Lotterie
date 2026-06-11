package Eurojackpot is
   pragma Elaborate_Body;

   procedure Eurojackpot;
   
private
   
   Getauscht : Boolean;
   
   AnzahlZahlen : Positive;
   EurozahlEins : Positive;
   EurozahlZwei : Positive;
   
   Zwischenspeicher : Natural;
   
   type GezogeneZahlenArray is array (1 .. 5) of Natural;
   GezogeneZahlen : GezogeneZahlenArray;
   ZahlenSortieren : GezogeneZahlenArray;
   
   
   
   function Sortieren
     (ZahlenExtern : in GezogeneZahlenArray)
      return GezogeneZahlenArray;

end Eurojackpot;
