with Ada.Text_IO; use Ada.Text_IO;

with Anzeige;
with Zufallsgenerator;
with Sortieren;

package body Keno is

   procedure Keno
   is begin
      
      KenoTypSchleife:
      loop
         
         Put_Line (Item => "Keno Typ festlegen.");
         Put_Line (Item => "1 = Keno Typ 10.");
         Put_Line (Item => "2 - 9 = Keno Typ 2 - 9.");
         Put_Line (Item => "0 = Zurueck.");
         New_Line;
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '1' =>
               KenoTyp := 10;
               exit KenoTypSchleife;
               
            when '2' .. '9' =>
               KenoTyp := Character'Pos (Eingabe) - CharakterpositionNull;
               exit KenoTypSchleife;
               
            when '0' =>
               return;
               
            when others =>
               Put_Line (Item => "Falsche Eingabe.");
         end case;

         New_Line (Spacing => 2);
         
      end loop KenoTypSchleife;
      
      GezogeneZahlen := (others => 0);
      GezogeneZahlen (1) := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlKeno'Last);
      AnzahlZahlen := GezogeneZahlen'First;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.ZahlenauswahlKeno'Last);
         
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
         
         if
           AnzahlZahlen >= KenoTyp
         then
            exit ZahlenSchleife;
               
         else
            null;
         end if;
         
      end loop ZahlenSchleife;
      
      Anzeige.Anzeige (ZahlenExtern => Sortieren.Sortieren (ZahlenExtern => GezogeneZahlen));
      
   end Keno;

end Keno;
