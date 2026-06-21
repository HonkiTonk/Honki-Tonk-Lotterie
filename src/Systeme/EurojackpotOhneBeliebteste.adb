with Sortieren;
with Zufallsgenerator;
with Anzeige;

package body EurojackpotOhneBeliebteste is

   procedure Eurojackpot
   is begin
      
      GezogeneZahlen := (others => 0);
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
      
      Anzeige.Anzeige (ZahlenExtern => Sortieren.Sortieren (ZahlenExtern => GezogeneZahlen));
      
      
      
      EurozahlenSchleife:
      loop
         
         GezogeneEurozahlen := (Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlEurozahlen'Last), Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlEurozahlen'Last));
         
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
      
      Anzeige.Eurozahlen (EurozahlenExtern => Sortieren.SortierenEurozahlen (EurozahlenExtern => GezogeneEurozahlen));
      
   end Eurojackpot;

end EurojackpotOhneBeliebteste;
