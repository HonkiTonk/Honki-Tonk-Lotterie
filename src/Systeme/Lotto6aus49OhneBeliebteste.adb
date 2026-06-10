with Ada.Text_IO; use Ada.Text_IO;

with Zufallsgenerator;

package body Lotto6aus49OhneBeliebteste is

   procedure Lotto6aus49
   is begin
      
      GezogeneZahlen (1) := Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => BeliebterZahlenbereichEins'Last + 1,
                                                                   EndeExtern    => BeliebterZahlenbereichFünf'First - 1);
      AnzahlZahlen := 1;
      
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
              Zwischenspeicher in BeliebterZahlenbereichZwei
              or
                Zwischenspeicher in BeliebterZahlenbereichDrei
                or
                  Zwischenspeicher in BeliebterZahlenbereichVier
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
      
      SuperzahlSchleife:
      loop
      
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => 10);
      
         case
           Zwischenspeicher
         is
            when 10 =>
               Zwischenspeicher := 0;
               exit SuperzahlSchleife;
               
            when 1 | 2 | 4 | 9 =>
               exit SuperzahlSchleife;
            
            when others =>
               null;
         end case;
         
      end loop SuperzahlSchleife;
      
      Put_Line ("Superzahl:" & Zwischenspeicher'Image);
      
   end Lotto6aus49;
   
   
   
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

end Lotto6aus49OhneBeliebteste;
