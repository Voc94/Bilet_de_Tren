---------------------------------------------------------------------------------------------------
--
-- Title       : \1\
-- Design      : BDT
-- Author      : Popa Alexandru-Vasile
-- Company     : UTCN
--
---------------------------------------------------------------------------------------------------
--
-- File        : MUX16:1.vhd
-- Generated   : Mon May 23 14:44:44 2022
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {\1\} architecture {\1\}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX16_1 is
	 port(
		 Sel : in STD_LOGIC_VECTOR(3 downto 0);
		 number : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end MUX16_1;

--}} End of automatically maintained section

architecture main of MUX16_1 is
begin
	  	with Sel select number <=
	"0000000010100101" when "1111",	   --165
	"0000000010100000" when "1110",	   --160
	"0000000010011011" when "1101",	   --155
	"0000000010010110" when "1100",	   --150
	"0000000001110011" when "1011",	   --115
	"0000000001101110" when "1010",	   --110
	"0000000001101001" when "1001",	   --105
	"0000000001100100" when "1000",	   --100
	"0000000001000001" when "0111",	   --65
	"0000000000111100" when "0110",	   --60
	"0000000000110111" when "0101",	   --55
	"0000000000110010" when "0100",	   --50
	"0000000000001111" when "0011",	   --15
	"0000000000001010" when "0010",	   --10
	"0000000000000101" when "0001",	   --5
	"0000000000000000" when others;	   --0
	 -- enter your statements here --

end architecture;
