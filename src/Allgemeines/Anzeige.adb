with Ada.Text_IO; use Ada.Text_IO;

package body Anzeige is

   procedure Anzeige
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
   is begin
      
      AnzeigeSchleife:
      for AnzeigeSchleifenwert in ZahlenExtern'Range loop
         
         if
           ZahlenExtern (AnzeigeSchleifenwert) = 0
         then
            null;
            
         elsif
           AnzeigeSchleifenwert < ZahlenExtern'Last
         then
            Put (Item => ZahlenExtern (AnzeigeSchleifenwert)'Image & ",");
            
         else
            Put_Line (Item => ZahlenExtern (AnzeigeSchleifenwert)'Image);
         end if;
         
      end loop AnzeigeSchleife;
      
   end Anzeige;
   
   
   
   procedure AnzeigeNull
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
      
   end AnzeigeNull;
   
   
   
   procedure Superzahl
     (SuperzahlExtern : in Natural)
   is begin
      
      Put_Line (Item => "Superzahl:" & SuperzahlExtern'Image);
      
   end Superzahl;
   
   
   
   procedure Eurozahlen
     (EurozahlenExtern : in Datentypen.Eurozahlen)
   is begin
      
      Put_Line (Item => "Eurozahlen:" & EurozahlenExtern.ZahlEins'Image & "," & EurozahlenExtern.ZahlZwei'Image);
      
   end Eurozahlen;

end Anzeige;
