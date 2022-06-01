library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;	
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all; 

-- Entitate:
entity registru is
	port (
	CLK, L, R:  in STD_LOGIC; 
	Din:  in STD_LOGIC_VECTOR (15 downto 0);
	Dout: out STD_LOGIC_VECTOR (15 downto 0)
		  );
end entity;

-- Arhitectura:
architecture comportamental of registru is 
signal M : std_logic_vector (15 downto 0);
begin
process (CLK, L, R, Din)
	begin
		if (CLK = '1') and (CLK'EVENT) then
			if (R = '1') then 			   			-- Resetare
				M <= "0000000000000000";
			elsif (L = '1') then					-- Incarcare paralela
				M <= Din;
			end if;
		end if;
	end process;
	Dout <= M;
end architecture;