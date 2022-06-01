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

entity MUX16_1km is
	 port(
		 Sel : in STD_LOGIC_VECTOR(3 downto 0);
		 number : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end MUX16_1km;

--}} End of automatically maintained section

architecture main of MUX16_1km is
begin
	  	with Sel select number <=
	"0000001111101000" when "1111",
	"0000001100100000" when "1110",
	"0000001010111100" when "1101",
	"0000001001011000" when "1100",
	"0000000111110100" when "1011",
	"0000000100101100" when "1010",
	"0000000011001000" when "1001",
	"0000000001100100" when "1000",
	"0000000001010000" when "0111",
	"0000000001000110" when "0110",
	"0000000000111100" when "0101",
	"0000000000110010" when "0100",
	"0000000000011110" when "0011",
	"0000000000010100" when "0010",
	"0000000000001010" when "0001",
	"0000000000000000" when others;
	 -- enter your statements here --

end architecture;
