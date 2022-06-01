Library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all; 
entity Comparare_Rest is
	port(
	A : in std_logic_vector (15 downto 0);
	B : in std_logic_vector (15 downto 0);
	mai_mare : out std_logic;
	S : out std_logic_vector (15 downto 0));
end Comparare_Rest;		   	  
architecture main of Comparare_Rest is 
component fullsubtractor
Port (    
		A : in STD_LOGIC_VECTOR (15 downto 0);	
		B : in std_logic_vector (15 downto 0);
		S : out std_logic_vector (15 downto 0));
end component;		
begin  			 
	process(A,B)	  
	begin	 
		if(A>B or A = B) then mai_mare<='1';
		else mai_mare<='0';	 
		end if;
	end process; 
	U1:fullsubtractor port map(A,B,S);
end architecture ;