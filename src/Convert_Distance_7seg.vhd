library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

entity Convert_Distance_7seg is 
port(	
	Unit : out std_logic_vector(0 to 6);
	Dizaine : out std_logic_vector(0 to 6);
	Centaine : out std_logic_vector(0 to 6)
	--Segout : out std_logic_vector(0 to 6)
);
end entity Convert_Distance_7seg;

architecture arcConvertDistTo7seg of Convert_Distance_7seg is
signal Distance_Dizaine : integer;
signal Distance_Centaine : integer;
signal Distance_Unit : integer;

begin
ET1 : entity work.Convert_Distance port map(distance_centaine=>Distance_Centaine, distance_dizaine=>Distance_Dizaine, distance_unit=>Distance_Unit);
Process(Distance_Centaine, Distance_Dizaine, Distance_Unit)
begin
			if Distance_Centaine = 0 then 
				Centaine <= "0000001";
			elsif Distance_Centaine = 1 then 
				Centaine <= "0110000";
			elsif Distance_Centaine = 2 then  
				Centaine <= "1101101";
			elsif Distance_Centaine = 3 then  
				Centaine <= "1111001";
			elsif Distance_Centaine = 4 then  
				Centaine <= "0110011";
			elsif Distance_Centaine = 5 then  
				Centaine <= "1011011";
			elsif Distance_Centaine = 6 then  
				Centaine <= "1011111";
			elsif Distance_Centaine = 7 then  
				Centaine <= "1110000";
			elsif Distance_Centaine = 8 then  
				Centaine <= "1111111";
			elsif Distance_Centaine = 9 then  
				Centaine <= "1111011";
			end if;

			if Distance_Dizaine = 0 then 
				Dizaine <= "0000001";
			elsif Distance_Dizaine = 1 then 
				Dizaine <= "0110000";
			elsif Distance_Dizaine = 2 then  
				Dizaine <= "1101101";
			elsif Distance_Dizaine = 3 then  
				Dizaine <= "1111001";
			elsif Distance_Dizaine = 4 then  
				Dizaine <= "0110011";
			elsif Distance_Dizaine = 5 then  
				Dizaine <= "1011011";
			elsif Distance_Dizaine = 6 then  
				Dizaine <= "1011111";
			elsif Distance_Dizaine = 7 then  
				Dizaine <= "1110000";
			elsif Distance_Dizaine = 8 then  
				Dizaine <= "1111111";
			elsif Distance_Dizaine = 9 then  
				Dizaine <= "1111011";
			end if;

			if Distance_Unit = 0 then 
				Unit <= "0000001";
			elsif Distance_Unit = 1 then 
				Unit <= "0110000";
			elsif Distance_Unit = 2 then  
				Unit <= "1101101";
			elsif Distance_Unit = 3 then  
				Unit <= "1111001";
			elsif Distance_Unit = 4 then  
				Unit <= "0110011";
			elsif Distance_Unit = 5 then  
				Unit <= "1011011";
			elsif Distance_Unit = 6 then  
				Unit <= "1011111";
			elsif Distance_Unit = 7 then  
				Unit <= "1110000";
			elsif Distance_Unit = 8 then  
				Unit <= "1111111";
			elsif Distance_Unit = 9 then  
				Unit <= "1111011";
			end if;
end Process;
end architecture;


