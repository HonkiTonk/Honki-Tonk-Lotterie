package body Sortieren is
   
   function Sortieren
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray
   is begin
      
      ZahlenSortieren := (others => 0);
      
      ZuweisenSchleife:
      for ZuweisenSchleifenwert in ZahlenExtern'Range loop
         
         ZahlenSortieren (ZuweisenSchleifenwert) := ZahlenExtern (ZuweisenSchleifenwert);
         
      end loop ZuweisenSchleife;
      
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
   
   
   
   function SortierenEurozahlen
     (EurozahlenExtern : in Datentypen.Eurozahlen)
      return Datentypen.Eurozahlen
   is begin
      
      if
        EurozahlenExtern.ZahlEins > EurozahlenExtern.ZahlZwei
      then
         return (EurozahlenExtern.ZahlZwei, EurozahlenExtern.ZahlEins);
         
      else
         return EurozahlenExtern;
      end if;
      
   end SortierenEurozahlen;

end Sortieren;
