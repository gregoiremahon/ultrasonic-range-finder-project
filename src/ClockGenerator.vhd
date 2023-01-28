-- On genere une clock pour mesurer la largeur des impulsions de l'echo du radar, en comptant le nombre de fronts montants de notre clock pendant que le signal ECHO IN est à 1.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ClockGenerator is 

port(
	clock : out std_logic);
	
end entity ClockGenerator;

architecture arcClockGenerator of ClockGenerator is
	signal subClock : std_logic;
begin
	clock <= subClock;

ET1 : process
begin

	subClock <= '0';
	wait for 0.5 us;
	subClock <= '1';
	wait for 0.5 us;

end process;

end architecture;


	

