with Ada.Text_IO; use Ada.Text_IO;

package body Anzeige is

   procedure Anzeige
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
   is begin
      
      AnzeigeSchleife:
      for AnzeigeSchleifenwert in ZahlenExtern'Range loop
         
         if
           AnzeigeSchleifenwert < ZahlenExtern'Last
         then
            Put (Item => ZahlenExtern (AnzeigeSchleifenwert)'Image & ",");
            
         else
            Put_Line (Item => ZahlenExtern (AnzeigeSchleifenwert)'Image);
         end if;
         
      end loop AnzeigeSchleife;
      
   end Anzeige;
   
   
   
   procedure Superzahl
     (SuperzahlExtern : in Natural)
   is begin
      
      Put_Line ("Superzahl:" & SuperzahlExtern'Image);
      
   end Superzahl;
   
   
   
   procedure Eurozahlen
     (EurozahlEinsExtern : in Positive;
      EurozahlZweiExtern : in Positive)
   is begin
      
      Put_Line ("Eurozahlen:" & EurozahlEinsExtern'Image & "," & EurozahlZweiExtern'Image);
      
   end Eurozahlen;

end Anzeige;
