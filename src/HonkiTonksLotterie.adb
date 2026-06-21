with Ada.Text_IO; use Ada.Text_IO;

with DoppelteSieben;
with Gluecksspirale;
with Keno;
with Lotto6aus49;
with Eurojackpot;
with Lotto6aus49OhneBeliebteste;
with EurojackpotOhneBeliebteste;

procedure HonkiTonksLotterie
is

   Eingabe : Character;

begin

   EingabeSchleife:
   loop

      Put_Line (Item => "Honki Tonks Lotterie V0.02.2000");
      Put_Line (Item => "1 = 6aus49.");
      Put_Line (Item => "2 = Eurojackpot.");
      Put_Line (Item => "3 = 6aus49 ohne beliebteste Tipps.");
      Put_Line (Item => "4 = Eurojackpot ohne beliebteste Tipps.");
      Put_Line (Item => "5 = Keno.");
      Put_Line (Item => "6 = Gluecksspirale.");
      Put_Line (Item => "7 = Doppelte Sieben.");
      Put_Line (Item => "0 = Ende.");
      New_Line;

      Get_Immediate (Eingabe);

      case
        Eingabe
      is
         when '1' =>
            Lotto6aus49.Lotto6aus49;

         when '2' =>
            Eurojackpot.Eurojackpot;

         when '3' =>
            Lotto6aus49OhneBeliebteste.Lotto6aus49;

         when '4' =>
            EurojackpotOhneBeliebteste.Eurojackpot;

         when '5' =>
            Keno.Keno;

         when '6' =>
            Gluecksspirale.Gluecksspirale;

         when '7' =>
            DoppelteSieben.DoppelteSieben;

         when '0' =>
            exit EingabeSchleife;

         when others =>
            Put_Line (Item => "Falsche Eingabe.");
      end case;

      New_Line (Spacing => 2);

   end loop EingabeSchleife;

end HonkiTonksLotterie;
