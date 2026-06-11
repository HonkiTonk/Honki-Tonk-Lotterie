with Datentypen;

package EurojackpotOhneBeliebteste is
   pragma Elaborate_Body;

   procedure Eurojackpot;
   
private
   
   UnbeliebteKombination : Boolean;
   
   AnzahlZahlen : Positive;
   
   Zwischenspeicher : Natural;
   
   type Eurozahlen is record
      
      ZahlEins : Positive;
      ZahlZwei : Positive;
      
   end record;
   
   GezogeneEurozahlen : Eurozahlen;
   
   subtype BeliebterZahlenbereichEins is Positive range 2 .. 20;
   subtype BeliebterZahlenbereichZwei is Positive range 22 .. 29;
   
   GezogeneZahlen : Datentypen.GezogeneZahlenArray (1 .. 5);
   
   type BeliebteKombinationenArray is array (1 .. 32) of Eurozahlen;
   BeliebteKombinationen : constant BeliebteKombinationenArray := (
                                                                   1  => (1, 8),
                                                                   2  => (2, 4),
                                                                   3  => (2, 5),
                                                                   4  => (2, 6),
                                                                   5  => (2, 7),
                                                                   6  => (2, 8),
                                                                   7  => (2, 9),
                                                                   8  => (2, 10),
                                                                   9  => (3, 4),
                                                                   10 => (3, 5),
                                                                   11 => (3, 6),
                                                                   12 => (3, 7),
                                                                   13 => (3, 8),
                                                                   14 => (3, 9),
                                                                   15 => (3, 10),
                                                                   16 => (3, 11),
                                                                   17 => (4, 5),
                                                                   18 => (4, 6),
                                                                   19 => (4, 7),
                                                                   20 => (4, 8),
                                                                   21 => (4, 9),
                                                                   22 => (4, 10),
                                                                   23 => (5, 6),
                                                                   24 => (5, 7),
                                                                   25 => (5, 8),
                                                                   26 => (5, 9),
                                                                   27 => (5, 10),
                                                                   28 => (6, 7),
                                                                   29 => (6, 8),
                                                                   30 => (6, 9),
                                                                   31 => (7, 8),
                                                                   32 => (7, 9)
                                                                  );
   
end EurojackpotOhneBeliebteste;
