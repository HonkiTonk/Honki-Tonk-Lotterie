with Zufallsgenerator;
with Sortieren;
with Anzeige;

package body Eurojackpot is

   procedure Eurojackpot
   is begin
      
      GezogeneZahlen (GezogeneZahlen'First) := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlEurojackpot'Last);
      AnzahlZahlen := GezogeneZahlen'First;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlEurojackpot'Last);
         
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
      
      Anzeige.Anzeige (ZahlenExtern => Sortieren.SortierenEurojackpot (ZahlenExtern => GezogeneZahlen));
      
      GezogeneEurozahlen.ZahlEins := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlEurozahlen'Last);
      
      EurozahlenSchleife:
      loop
      
         GezogeneEurozahlen.ZahlZwei := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlEurozahlen'Last);
         
         if
           GezogeneEurozahlen.ZahlEins = GezogeneEurozahlen.ZahlZwei
         then
            null;
            
         else
            exit EurozahlenSchleife;
         end if;
         
      end loop EurozahlenSchleife;
      
      Anzeige.Eurozahlen (EurozahlenExtern => Sortieren.SortierenEurozahlen (EurozahlenExtern => GezogeneEurozahlen));
      
   end Eurojackpot;

end Eurojackpot;
