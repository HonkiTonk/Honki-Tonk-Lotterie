with Zufallsgenerator;
with Sortieren;
with Anzeige;

package body Lotto6aus49OhneBeliebteste is

   procedure Lotto6aus49
   is begin
      
      GezogeneZahlen (GezogeneZahlen'First) := Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => BeliebterZahlenbereichEins'Last + 1,
                                                                                      EndeExtern    => BeliebterZahlenbereichFünf'First - 1);
      AnzahlZahlen := GezogeneZahlen'First;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => BeliebterZahlenbereichEins'Last + 1,
                                                                    EndeExtern    => BeliebterZahlenbereichFünf'First - 1);
         
         PrüfenSchleife:
         for PrüfenSchleifenwert in GezogeneZahlen'First .. AnzahlZahlen loop
            
            if
              GezogeneZahlen (PrüfenSchleifenwert) = Zwischenspeicher
            then
               exit PrüfenSchleife;
               
            elsif
              Zwischenspeicher in BeliebterZahlenbereichZwei'Range
              or
                Zwischenspeicher in BeliebterZahlenbereichDrei'Range
                or
                  Zwischenspeicher in BeliebterZahlenbereichVier'Range
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
      
      SuperzahlSchleife:
      loop
      
         Zwischenspeicher := Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => Datentypen.ZahlenauswahlSuperzahl'First,
                                                                    EndeExtern    => Datentypen.ZahlenauswahlSuperzahl'Last);
      
         case
           Zwischenspeicher
         is
            when 0 | 1 | 2 | 4 | 9 =>
               exit SuperzahlSchleife;
            
            when others =>
               null;
         end case;
         
      end loop SuperzahlSchleife;
      
      Anzeige.Superzahl (SuperzahlExtern => Zwischenspeicher);
      
   end Lotto6aus49;

end Lotto6aus49OhneBeliebteste;
