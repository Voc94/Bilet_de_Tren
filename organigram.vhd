-------------------------------------------------------------------------------
--
-- Title       : decision
-- Design      : bancomat
-- Author      : grig
-- Company     : Universitatea Tehnica Cluj Napoca
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\ATM\bancomat\src\decision.vhd
-- Generated   : Tue May  8 22:41:50 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {decision} architecture {decision}}
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity organigram is
	port(OK: in Std_logic; 
		 RESET: in std_logic;
		 Comparator1,Comparator2:in std_logic;
		 dis,cost,cash,debt : in std_logic_vector (15 downto 0);
		 mode1,mode2,mode3,mode4,mode5 : out std_logic;
		 led_error : out std_logic; 
		 show_number : out std_logic_vector (15 downto 0);
		 chitanta : out std_logic
 		 ); 
end organigram;

--}} End of automatically maintained section

architecture main of organigram is	 
type STARE_T is (selectare_km,afiseazakm,pret,select_bani,bani,rest,error);
signal stare,nxstare: STARE_T;

begin 
	CLS: process (RESET,OK)
	begin
		 if (RESET = '1') then
		 STARE <= selectare_km;  
		 elsif(ok='1' and ok'event) then
		 stare <= nxstare;
		 end if;
	end process CLS;
	CLC: process (stare,dis,cost,cash,debt,comparator1,comparator2)
	begin	   
		show_number<="0000000000000000";
		led_error<='0';	
		mode3<='0';
		mode1<='0';
		mode5<='0';
		case stare is	
			when selectare_km =>  
			mode5<='1';
			mode4<='1';
			mode1 <= '1'; 
			show_number<="0000000000000000";
			nxstare<=afiseazakm;
			when afiseazakm =>	
			mode5<='0';
			mode4<='0';
			mode1 <= '1';  
			show_number<=dis;
			nxstare<=pret;
			when pret =>nxstare<=select_bani;	
			show_number<=cost;				
			when select_bani =>
			mode2<='0';	 
			show_number<=cash;
			nxstare<=bani; 
			mode3<='1';
			when bani =>  	
			show_number<=cash; 
			if comparator1 > '0' and comparator2 > '0' then nxstare<=rest; 
			else nxstare<=error;	 
			end if;	  
			when error => 
			led_error<='1';
			nxstare<=select_bani;
			when rest => 
			show_number<=debt;
			nxstare <= selectare_km; 
		  end case;
	end process CLC;
end architecture;
