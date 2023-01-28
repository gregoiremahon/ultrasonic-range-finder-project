library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 


entity MesureDistance is 
port(
	distance_object : out integer;
	echo_pulse : in std_logic);
end entity MesureDistance;


Architecture arcMeasDistance of MesureDistance is

signal subDistance : integer := 0;
--signal echo_pulse : std_logic := '0';
signal Echo_Pulse_Time : unsigned(21 downto 0);
signal echo_pulse_state : std_logic; -- prend 1 ou 0 en fonction de l'état du signal echo_pulse du capteur
signal clk : std_logic;
begin
distance_object <= subDistance;
ET1 : entity work.MesureTempsEchoIN port map (clk => clk, echo_pulse => echo_pulse, Echo_Pulse_Time => Echo_Pulse_Time, echo_pulse_state => echo_pulse_state);
	
		ETProcess: Process(echo_pulse_state)
		begin
			if falling_edge(echo_pulse_state) then 
			subDistance <= ((to_integer(Echo_Pulse_Time)*20)  / 58000); -- returns the distance in cm from Echo_Pulse_Time in us
			end if;
		end Process;
end architecture;



