with Zufallsgenerator;
with Sortieren;
with Anzeige;

package body Lotto6aus49 is

   procedure Lotto6aus49
   is begin
      
      GezogeneZahlen (GezogeneZahlen'First) := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.Zahlenauswahl6aus49'Last);
      AnzahlZahlen := GezogeneZahlen'First;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.Zahlenauswahl6aus49'Last);
         
         PrüfenSchleife:
         for PrüfenSchleifenwert in GezogeneZahlen'First .. AnzahlZahlen loop
            
            if
              GezogeneZahlen (PrüfenSchleifenwert) = Zwischenspeicher
            then
               exit PrüfenSchleife;
               
            elsif
              PrüfenSchleifenwert = AnzahlZahlen
            then
               AnzahlZahlen := AnzahlZahlen + 1;
               GezogeneZahlen (AnzahlZahlen) := Zwischenspeicher;
               
            else
               null;
            end if;
            
         end loop PrüfenSchleife;
         
         case
           AnzahlZahlen
         is
            when GezogeneZahlen'First .. GezogeneZahlen'Last - 1 =>
               null;
               
            when others =>
               exit ZahlenSchleife;
         end case;
         
      end loop ZahlenSchleife;
      
      Anzeige.Anzeige (ZahlenExtern => Sortieren.Sortieren (ZahlenExtern => GezogeneZahlen));
      
      Anzeige.Superzahl (SuperzahlExtern => Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => Datentypen.ZahlenauswahlSuperzahl'First,
                                                                                   EndeExtern    => Datentypen.ZahlenauswahlSuperzahl'Last));
      
   end Lotto6aus49;

end Lotto6aus49;
