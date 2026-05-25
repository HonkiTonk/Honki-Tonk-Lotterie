package body Zufallsgenerator is

   function Würfelergebnis
     (SeitenanzahlExtern : in Positive)
      return Positive
   is begin
      
      Zahlenbereich.Reset (Gen => GewählteZahl);
      
      return Zahlenbereich.Random (Gen   => GewählteZahl,
                                   First => 1,
                                   Last  => SeitenanzahlExtern);
                              
   end Würfelergebnis;

end Zufallsgenerator;
