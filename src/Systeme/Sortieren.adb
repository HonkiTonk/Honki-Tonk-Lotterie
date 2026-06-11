package body Sortieren is
   
   function SortierenLotto6aus49
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray
   is begin
      
      Lotto6aus49Sortieren := ZahlenExtern;
      
      ÄußereSchleife:
      for ÄußereSchleifenwert in Lotto6aus49Sortieren'Range loop
         
         Getauscht := False;
         
         InnereSchleife:
         for InnereSchleifenwert in Lotto6aus49Sortieren'First .. Lotto6aus49Sortieren'Last - ÄußereSchleifenwert loop
         
            if
              Lotto6aus49Sortieren (InnereSchleifenwert) > Lotto6aus49Sortieren (InnereSchleifenwert + 1)
            then
               Zwischenspeicher := Lotto6aus49Sortieren (InnereSchleifenwert);
               Lotto6aus49Sortieren (InnereSchleifenwert) := Lotto6aus49Sortieren (InnereSchleifenwert + 1);
               Lotto6aus49Sortieren (InnereSchleifenwert + 1) := Zwischenspeicher;
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
      
      return Lotto6aus49Sortieren;
      
   end SortierenLotto6aus49;
   
   
   
   function SortierenEurojackpot
     (ZahlenExtern : in Datentypen.GezogeneZahlenArray)
      return Datentypen.GezogeneZahlenArray
   is begin
      
      EurojackpotSortieren := ZahlenExtern;
      
      ÄußereSchleife:
      for ÄußereSchleifenwert in EurojackpotSortieren'Range loop
         
         Getauscht := False;
         
         InnereSchleife:
         for InnereSchleifenwert in EurojackpotSortieren'First .. EurojackpotSortieren'Last - ÄußereSchleifenwert loop
         
            if
              EurojackpotSortieren (InnereSchleifenwert) > EurojackpotSortieren (InnereSchleifenwert + 1)
            then
               Zwischenspeicher := EurojackpotSortieren (InnereSchleifenwert);
               EurojackpotSortieren (InnereSchleifenwert) := EurojackpotSortieren (InnereSchleifenwert + 1);
               EurojackpotSortieren (InnereSchleifenwert + 1) := Zwischenspeicher;
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
      
      return EurojackpotSortieren;
      
   end SortierenEurojackpot;

end Sortieren;
