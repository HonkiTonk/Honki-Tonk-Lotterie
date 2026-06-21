with Anzeige;
with Zufallsgenerator;

package body Gluecksspirale is

   procedure Gluecksspirale
   is begin
      
      ZahlenSchleife:
      for ZahlenSchleifenwert in GezogeneZahlen'Range loop
         
         GezogeneZahlen (ZahlenSchleifenwert) := Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => Datentypen.ZahlenauswahlGlücksspirale'First,
                                                                                        EndeExtern    => Datentypen.ZahlenauswahlGlücksspirale'Last);
         
      end loop ZahlenSchleife;
      
      Anzeige.AnzeigeNull (ZahlenExtern => GezogeneZahlen);
      
   end Gluecksspirale;

end Gluecksspirale;
