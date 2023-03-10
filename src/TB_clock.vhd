-- TestBench du compteur de fronts montants clock sur le signal ECHO du capteur :
-- On automatise les valeurs du signal ECHO du capteur pendant quelques dizaines de us et on compte manuellement le nombre de clock
-- Cela nous permet de v?rifier l'entite MesureTempsEchoIN
library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity TB_clock is
end entity;

architecture arcTBclock of TB_clock is

signal clk : std_logic := '0';
signal echo_pulse : std_logic;


begin

etiquette : entity work.MesureTempsEchoIN port map(clk=> clk, echo_pulse => echo_pulse);

ETProcess1 : process
--variable cptTime : integer; 
	begin
		echo_pulse <= '0';
		wait for 50us;
		echo_pulse <= '1';
		wait for 100us;
		echo_pulse <= '0';
		wait for 50us;
		echo_pulse <= '1';
		wait;
	end process;

end architecture;
