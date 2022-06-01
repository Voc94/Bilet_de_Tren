Library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all; 
entity Comparare_Bani is
	port(
	A : in std_logic_vector (15 downto 0);
	B : in std_logic_vector (15 downto 0);
	ok : out std_logic);
end Comparare_Bani;	
architecture main of Comparare_Bani is
begin			  
	process(A,B)
	begin	
		if(A < B) then ok<='0';
		else ok<='1';
		end if;
	end process;
end architecture ;