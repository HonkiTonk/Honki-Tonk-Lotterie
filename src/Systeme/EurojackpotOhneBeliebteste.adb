with Ada.Text_IO; use Ada.Text_IO;

with Zufallsgenerator;

package body EurojackpotOhneBeliebteste is

   procedure Eurojackpot
   is begin
      
      GezogeneZahlen := (others => 0);
      AnzahlZahlen := 1;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => 50);
               Put_Line (Zwischenspeicher'Image);
         
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
            when 1 .. GezogeneZahlen'Last =>
               null;
               
            when others =>
               exit ZahlenSchleife;
         end case;
         
      end loop ZahlenSchleife;
      
      GezogeneZahlen := Sortieren (ZahlenExtern => GezogeneZahlen);
      
      AnzeigeSchleife:
      for AnzeigeSchleifenwert in GezogeneZahlen'Range loop
         
         if
           AnzeigeSchleifenwert < GezogeneZahlen'Last
         then
            Put (Item => GezogeneZahlen (AnzeigeSchleifenwert)'Image & ",");
            
         else
            Put_Line (Item => GezogeneZahlen (AnzeigeSchleifenwert)'Image);
         end if;
         
      end loop AnzeigeSchleife;
      
      
      
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
      
      Put_Line ("Eurozahlen:" & GezogeneEurozahlen.ZahlEins'Image & "," & GezogeneEurozahlen.ZahlZwei'Image);
      
   end Eurojackpot;
   
   
   
   function Sortieren
     (ZahlenExtern : in GezogeneZahlenArray)
      return GezogeneZahlenArray
   is begin
      
      ZahlenSortieren := ZahlenExtern;
      
      ÄußereSchleife:
      for ÄußereSchleifenwert in ZahlenSortieren'Range loop
         
         Getauscht := False;
         
         InnereSchleife:
         for InnereSchleifenwert in ZahlenSortieren'First .. ZahlenSortieren'Last - ÄußereSchleifenwert loop
         
            if
              ZahlenSortieren (InnereSchleifenwert) > ZahlenSortieren (InnereSchleifenwert + 1)
            then
               Zwischenspeicher := ZahlenSortieren (InnereSchleifenwert);
               ZahlenSortieren (InnereSchleifenwert) := ZahlenSortieren (InnereSchleifenwert + 1);
               ZahlenSortieren (InnereSchleifenwert + 1) := Zwischenspeicher;
               Getauscht := True;
               
            else
               null;
            end if;
         
         end loop InnereSchleife;
         
         case
           Getauscht
         is
            when True =>
               null;
               
            when False =>
               exit ÄußereSchleife;
         end case;
         
      end loop ÄußereSchleife;
      
      return ZahlenSortieren;
      
   end Sortieren;

end EurojackpotOhneBeliebteste;
