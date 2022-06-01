Library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all; 
entity Comparare_Distanta is
	port(
	A : in std_logic_vector (15 downto 0);
	pret : out std_logic_vector (15 downto 0));
end Comparare_Distanta;
architecture main of Comparare_Distanta is   
begin  			
	process(A)
	variable B : std_logic_vector(15 downto 0);	
	begin	
	if A = "0000000000000000" then pret<="0000000000000000";
	else
	B:="0000000000011001";	    --25
	if A>B then
	B:="0000000001100100";		--100
		if A>B then
		B:="0000000011111010";		--250
			if A>B then
			B:="0000001111101000"; 		--1000
				if A < B or A = B then
				 pret<="0000000001100100";--100	
				end if;
			else pret<="0000000000110010";	  --50 
			end if;
		else pret<="0000000000011001";	 --25  
		end if;
	else pret<="0000000000001010";  --10
	end if;	
	end if;
	end process; 
end architecture;