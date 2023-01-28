
library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity TestBench_clock is
end entity;

architecture arcTBclock of TestBench_clock is

signal clock : std_logic := '0';


begin

etiquette : entity work.ClockGenerator port map(clock);

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