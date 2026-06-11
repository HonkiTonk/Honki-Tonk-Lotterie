with Zufallsgenerator;
with Sortieren;
with Anzeige;

package body Eurojackpot is

   procedure Eurojackpot
   is begin
      
      GezogeneZahlen (GezogeneZahlen'First) := Zufallsgenerator.Zufallswert (EndeExtern => 50);
      AnzahlZahlen := GezogeneZahlen'First;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => 50);
         
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
      
      GezogeneZahlen := Sortieren.SortierenEurojackpot (ZahlenExtern => GezogeneZahlen);
      
      Anzeige.Anzeige (ZahlenExtern => GezogeneZahlen);
      
      EurozahlEins := Zufallsgenerator.Zufallswert (EndeExtern => 12);
      
      EurozahlenSchleife:
      loop
      
         EurozahlZwei := Zufallsgenerator.Zufallswert (EndeExtern => 12);
         
         if
           EurozahlEins = EurozahlZwei
         then
            null;
            
         else
            exit EurozahlenSchleife;
         end if;
         
      end loop EurozahlenSchleife;
      
      if
        EurozahlEins > EurozahlZwei
      then
         Zwischenspeicher := EurozahlEins;
         EurozahlEins := EurozahlZwei;
         EurozahlZwei := Zwischenspeicher;
         
      else
         null;
      end if;
      
      Anzeige.Eurozahlen (EurozahlEinsExtern => EurozahlEins,
                          EurozahlZweiExtern => EurozahlZwei);
      
   end Eurojackpot;

end Eurojackpot;
