package body Zufallsgenerator is

   function Zufallswert
     (EndeExtern : in Positive)
      return Positive
   is begin
      
      Zahlenbereich.Reset (Gen => GewählteZahl);
      
      return Zahlenbereich.Random (Gen   => GewählteZahl,
                                   First => 1,
                                   Last  => EndeExtern);
                              
   end Zufallswert;
   
   
   
   function ZufallswertMitAnfang
     (AnfangeExtern : in Positive;
      EndeExtern : in Positive)
      return Positive
   is begin
      
      Zahlenbereich.Reset (Gen => GewählteZahl);
      
      return Zahlenbereich.Random (Gen   => GewählteZahl,
                                   First => AnfangeExtern,
                                   Last  => EndeExtern);
                              
   end ZufallswertMitAnfang;

end Zufallsgenerator;
