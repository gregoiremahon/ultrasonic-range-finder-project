    
-- On utilise notre clock g�n�r�e dans ClockGenerator pour mesurer le temps � l'�tat haut du signal ECHO renvoy� par le t�l�metre ultrasons
-- Le t�l�metre renvoie un signal num�rique dont le temps � 1 est proportionnel � la distance de l'objet qu'il a d�tect�

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MesureTempsEchoIN is 
port(  
	echo_pulse : in std_logic;
	led : out std_logic;
	clk : in std_logic;
	Echo_Pulse_Time : out unsigned(21 downto 0); -- entre 0 et 255us 
	echo_pulse_state : out std_logic);
end entity MesureTempsEchoIN;

architecture arcMesureTempsEchoIN of MesureTempsEchoIN is
	signal Echo_Pulse_Interne : unsigned(21 downto 0);
begin
	Echo_Pulse_Time <= Echo_Pulse_Interne; -- Dans notre autre entit� de mesure de distance, on utilisera le signal subdelay, qui correspondra au nombre de fronts montants de notre clock tant que le signal est � l'�tat haut.
ET1 : process(clk, echo_pulse)
begin
	if echo_pulse = '1' then
			led <= '1';
			echo_pulse_state <= '1';
			if rising_edge(clk) then 	
				Echo_Pulse_Interne <= Echo_Pulse_Interne + 1; -- 1 Echo_Pulse_Interne == 20ns
			end if;
			if Echo_Pulse_Interne > "0101101110001101100000" then -- Si on depa?passe le temps maximal de 30ms, pas d'objet detect� 
				echo_pulse_state <= '0';
			end if;
			if rising_edge(echo_pulse) then 
			Echo_Pulse_Interne <= "0000000000000000000000";
			end if;		
		
	else
		led <= '0';
		echo_pulse_state <= '0';
	end if; 
end process;
end architecture arcMesureTempsEchoIN;
