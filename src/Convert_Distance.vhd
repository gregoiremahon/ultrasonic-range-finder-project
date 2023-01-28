library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 


entity Convert_Distance is 
port(
	distance_centaine : out integer;
	distance_dizaine : out integer;
	distance_unit : out integer);
end entity Convert_Distance;

architecture arcConvert_distance of Convert_Distance is
signal distance_object : integer;
signal blabla : std_logic;
begin
ET1 : entity work.MesureDistance port map(echo_pulse => blabla, distance_object => distance_object);

Process(distance_object)
begin
distance_centaine <= (distance_object/100);
distance_dizaine <= ((distance_object mod 100)/10);
distance_unit <= ((distance_object mod 100)mod 10);
end Process;
end architecture;