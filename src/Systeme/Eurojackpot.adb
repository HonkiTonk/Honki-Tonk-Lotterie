with Ada.Text_IO; use Ada.Text_IO;

with Zufallsgenerator;

package body Eurojackpot is

   procedure Eurojackpot
   is begin
      
     GezogeneZahlen (1) := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 50);
      AnzahlZahlen := 1;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 50);
         
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
            when 1 .. GezogeneZahlen'Last - 1 =>
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
      
      EurozahlEins := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 12);
      
      EurozahlenSchleife:
      loop
      
         EurozahlZwei := Zufallsgenerator.Würfelergebnis (SeitenanzahlExtern => 12);
         
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
      
      Put_Line ("Eurozahlen:" & EurozahlEins'Image & "," & EurozahlZwei'Image);
      
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

end Eurojackpot;
