with Zufallsgenerator;
with Sortieren;
with Anzeige;

package body Lotto6aus49Optimiert is

   procedure Lotto6aus49
     (ZahlenanzahlExtern : in Positive)
   is begin
      
      LottoSchleife:
      loop
         
         GezogeneZahlen := (others => 0);
         Zahlenposition := GezogeneZahlen'First;
      
         ZahlenSchleife:
         loop
         
            Zwischenspeicher := Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => BeliebterZahlenbereichEins'Last + 1,
                                                                       EndeExtern    => BeliebterZahlenbereichFünf'First - 1);
         
            PrüfenSchleife:
            for PrüfenSchleifenwert in GezogeneZahlen'First .. Zahlenposition loop
            
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
                 PrüfenSchleifenwert = Zahlenposition
               then
                  GezogeneZahlen (Zahlenposition) := Zwischenspeicher;
                  Zahlenposition := Zahlenposition + 1;
               
               else
                  null;
               end if;
            
            end loop PrüfenSchleife;
         
            if
              Zahlenposition in GezogeneZahlen'First .. ZahlenanzahlExtern
            then
               null;
               
            else
               exit ZahlenSchleife;
            end if;
         
         end loop ZahlenSchleife;
         
         Summe := 0;
         
         SummeSchleife:
         for SummeSchleifenwert in GezogeneZahlen'Range loop
            
            Summe := Summe + GezogeneZahlen (SummeSchleifenwert);
            
         end loop SummeSchleife;
         
         if
           Summe >= 164
         then
            exit LottoSchleife;
              
         else
            null;
         end if;
         
      end loop LottoSchleife;
      
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

end Lotto6aus49Optimiert;
