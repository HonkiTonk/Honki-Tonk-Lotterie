with Sortieren;
with Zufallsgenerator;
with Anzeige;

package body EurojackpotOhneBeliebteste is

   procedure Eurojackpot
   is begin
      
      GezogeneZahlen := (others => 100);
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
              Zwischenspeicher in BeliebterZahlenbereichEins'Range
              or
                Zwischenspeicher in BeliebterZahlenbereichZwei'Range
            then
               exit PrüfenSchleife;
               
            elsif
              PrüfenSchleifenwert = AnzahlZahlen
            then
               GezogeneZahlen (AnzahlZahlen) := Zwischenspeicher;
               AnzahlZahlen := AnzahlZahlen + 1;
               
            else
               null;
            end if;
            
         end loop PrüfenSchleife;
         
         case
           AnzahlZahlen
         is
            when GezogeneZahlen'First .. GezogeneZahlen'Last =>
               null;
               
            when others =>
               exit ZahlenSchleife;
         end case;
         
      end loop ZahlenSchleife;
      
      GezogeneZahlen := Sortieren.SortierenEurojackpot (ZahlenExtern => GezogeneZahlen);
      
      Anzeige.Anzeige (ZahlenExtern => GezogeneZahlen);
      
      
      
      EurozahlenSchleife:
      loop
         
         GezogeneEurozahlen := (Zufallsgenerator.Zufallswert (EndeExtern => 12), Zufallsgenerator.Zufallswert (EndeExtern => 12));
         
         if
           GezogeneEurozahlen.ZahlEins = GezogeneEurozahlen.ZahlZwei
         then
            null;
            
         else
            UnbeliebteKombination := True;
            
            BeliebtheitSchleife:
            for BeliebtheitSchleifenwert in BeliebteKombinationen'Range loop
               
               if
                 GezogeneEurozahlen.ZahlEins = BeliebteKombinationen (BeliebtheitSchleifenwert).ZahlEins
                 and
                   GezogeneEurozahlen.ZahlZwei = BeliebteKombinationen (BeliebtheitSchleifenwert).ZahlZwei
               then
                  UnbeliebteKombination := False;
                  exit BeliebtheitSchleife;
                  
               elsif
                 GezogeneEurozahlen.ZahlEins = BeliebteKombinationen (BeliebtheitSchleifenwert).ZahlZwei
                 and
                   GezogeneEurozahlen.ZahlZwei = BeliebteKombinationen (BeliebtheitSchleifenwert).ZahlEins
               then
                  UnbeliebteKombination := False;
                  exit BeliebtheitSchleife;
                  
               else
                  null;
               end if;
                                
            end loop BeliebtheitSchleife;
            
            case
              UnbeliebteKombination
            is
               when True =>
                  exit EurozahlenSchleife;
                  
               when False =>
                  null;
            end case;
         end if;
         
      end loop EurozahlenSchleife;
      
      if
        GezogeneEurozahlen.ZahlEins > GezogeneEurozahlen.ZahlZwei
      then
         Zwischenspeicher := GezogeneEurozahlen.ZahlEins;
         GezogeneEurozahlen.ZahlEins := GezogeneEurozahlen.ZahlZwei;
         GezogeneEurozahlen.ZahlZwei := Zwischenspeicher;
         
      else
         null;
      end if;
      
      Anzeige.Eurozahlen (EurozahlEinsExtern => GezogeneEurozahlen.ZahlEins,
                          EurozahlZweiExtern => GezogeneEurozahlen.ZahlZwei);
      
   end Eurojackpot;

end EurojackpotOhneBeliebteste;
