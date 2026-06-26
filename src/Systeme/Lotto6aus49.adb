with Ada.Text_IO; use Ada.Text_IO;

with Zufallsgenerator;
with Sortieren;
with Anzeige;
with Lotto6aus49OhneBeliebteste;

package body Lotto6aus49 is

   procedure Lotto6aus49
     (ZahlenanzahlExtern : in Positive)
   is begin
      
      GezogeneZahlen := (others => 0);
      GezogeneZahlen (GezogeneZahlen'First) := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.Zahlenauswahl6aus49'Last);
      Zahlenposition := GezogeneZahlen'First;
      
      ZahlenSchleife:
      loop
         
         Zwischenspeicher := Zufallsgenerator.Zufallswert (EndeExtern => Datentypen.Zahlenauswahl6aus49'Last);
         
         PrüfenSchleife:
         for PrüfenSchleifenwert in GezogeneZahlen'First .. Zahlenposition loop
            
            if
              GezogeneZahlen (PrüfenSchleifenwert) = Zwischenspeicher
            then
               exit PrüfenSchleife;
               
            elsif
              PrüfenSchleifenwert = Zahlenposition
            then
               Zahlenposition := Zahlenposition + 1;
               GezogeneZahlen (Zahlenposition) := Zwischenspeicher;
               
            else
               null;
            end if;
            
         end loop PrüfenSchleife;
         
         if
           Zahlenposition in GezogeneZahlen'First .. ZahlenanzahlExtern - 1
         then
            null;
               
         else
            exit ZahlenSchleife;
         end if;
         
      end loop ZahlenSchleife;
      
      Anzeige.Anzeige (ZahlenExtern => Sortieren.Sortieren (ZahlenExtern => GezogeneZahlen));
      
      Anzeige.Superzahl (SuperzahlExtern => Zufallsgenerator.ZufallswertMitAnfang (AnfangeExtern => Datentypen.ZahlenauswahlSuperzahl'First,
                                                                                   EndeExtern    => Datentypen.ZahlenauswahlSuperzahl'Last));
      
   end Lotto6aus49;
   
   
   
   procedure Vollsystem
     (AlleZahlenExtern : in Boolean)
   is begin
      
      VollsystemSchleife:
      loop
         
         Put_Line (Item => "Zahlenanzahl festlegen:");
         Put_Line (Item => "1 - 6 = 7 - 12 Zahlen.");
         Put_Line (Item => "0 = Zurueck.");
         New_Line;
         
         Get_Immediate (Eingabe);
         
         case
           Eingabe
         is
            when '1' .. '6' =>
               exit VollsystemSchleife;
               
            when '0' =>
               return;
               
            when others =>
               Put_Line (Item => "Falsche Eingabe.");
         end case;

         New_Line (Spacing => 3);
         
      end loop VollsystemSchleife;
      
      case
        AlleZahlenExtern
      is
         when True =>
            Lotto6aus49 (ZahlenanzahlExtern => Datentypen.VollsystemZahlenbereich (Eingabe));
            
         when False =>
            Lotto6aus49OhneBeliebteste.Lotto6aus49 (ZahlenanzahlExtern => Datentypen.VollsystemZahlenbereich (Eingabe));
      end case;
      
   end Vollsystem;

end Lotto6aus49;
