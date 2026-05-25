with Ada.Text_IO; use Ada.Text_IO;

with Lotto6aus49;
with Eurojackpot;

procedure HonkiTonksLotterie
is

   Eingabe : Character;

begin

   EingabeSchleife:
   loop

      Put_Line ("Honki Tonks Lotterie V0.01.0000");
      Put_Line ("1 = 6aus49.");
      Put_Line ("2 = Eurojackpot.");
      Put_Line ("0 = Ende.");
      New_Line;

      Get_Immediate (Eingabe);

      case
        Eingabe
      is
         when '1' =>
            Lotto6aus49.Lotto6aus49;

         when '2' =>
            Eurojackpot.Eurojackpot;

         when '0' =>
            exit EingabeSchleife;

         when others =>
            New_Line (Spacing => 5);
      end case;

      New_Line (Spacing => 2);

   end loop EingabeSchleife;

end HonkiTonksLotterie;
