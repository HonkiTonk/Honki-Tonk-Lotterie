private with Ada.Numerics.Discrete_Random;

package Zufallsgenerator is
   pragma Elaborate_Body;
   
   function Zufallswert
     (EndeExtern : in Positive)
      return Positive
     with
       Post => (Zufallswert'Result <= EndeExtern);
   
   function ZufallswertMitAnfang
     (AnfangeExtern : in Positive;
      EndeExtern : in Positive)
      return Positive
     with
       Post => (ZufallswertMitAnfang'Result in AnfangeExtern .. EndeExtern);
   
private
   
   package Zahlenbereich is new Ada.Numerics.Discrete_Random (Result_Subtype => Positive);
   
   GewählteZahl : Zahlenbereich.Generator;

end Zufallsgenerator;
