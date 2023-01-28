
-- A partir du nombre de fronts montants de clock lorsque le signal ECHO du capteur est à 1, on mesure la distance de l'objet capté par le capteur
-- 1 front montant clock = 1 us.
-- Il suffit donc de multiplier le nombre de fronts montants retournés par MesureTempsEchoIN par 1us et de ainsi determiner la distance.


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 


entity MesureDistanceEchoIN is 
port(
	distance_object : out unsigned(9 downto 0);
	echo_pulse_state : in std_logic; -- prend 1 ou 0 en fonction de l'état du signal echo_pulse du capteur
	Echo_Pulse_Time : in unsigned(15 downto 0)); -- entre 0 et 30 000 us

end entity MesureDistanceEchoIN;

architecture arcMesureDistance of MesureDistanceEchoIN is


function  divide  (a : UNSIGNED; b : UNSIGNED) return UNSIGNED is
variable a1 : unsigned(a'length-1 downto 0):=a;
variable b1 : unsigned(b'length-1 downto 0):=b;
variable p1 : unsigned(b'length downto 0):= (others => '0');
variable i : integer:=0;

begin
for i in 0 to b'length-1 loop
p1(b'length-1 downto 1) := p1(b'length-2 downto 0);
p1(0) := a1(a'length-1);
a1(a'length-1 downto 1) := a1(a'length-2 downto 0);
p1 := p1-b1;
if(p1(b'length-1) ='1') then
a1(0) :='0';
p1 := p1+b1;
else
a1(0) :='1';
end if;
end loop;
return a1;

end divide;


	
	signal dist : unsigned (9 downto 0); --entre 0 et 450cm (2^9 = 512, 2^10 = 1024) -- On peut mesurer jusqu'à 1024cm
	signal balec : std_logic;
	signal subDelay : unsigned(15 downto 0);
	signal sub_echo_pulse_state : std_logic;
	signal Diviseur : unsigned(15 downto 0) := "0000000000111010";
		
begin
	distance_object <= dist;
	subDelay <= Echo_Pulse_Time;
	sub_echo_pulse_state <= echo_pulse_state;
	ETi : entity work.MesureTempsEchoIN port map (balec, subDelay, sub_echo_pulse_state);
	ETiProcess : process(delay, sub_echo_pulse_state)

	
begin
	if sub_echo_pulse_state = '1' then	
		dist <= divide( subDelay , Diviseur );
	else 
	dist <= "0000000000";		
	end if; 
end process;
end architecture;
