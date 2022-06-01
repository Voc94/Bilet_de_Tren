
Library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;	
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all; 
entity bilet_de_tren is
	port(
	ok,clk,reset : in std_logic;
	add5 : in std_logic;
	add10 : in std_logic;
	add50 : in std_logic;
	add100 : in std_logic;
	eliberare_bilet : out std_logic;  
	led_erroare : out std_logic;
	anod: out std_logic_vector(3 downto 0);
	catod: out std_logic_vector(6 downto 0));
end bilet_de_tren ;	
architecture main of bilet_de_tren is	 

signal mode : std_logic;
signal add_input : std_logic_vector(3 downto 0);  
signal sum_km : std_logic_vector(15 downto 0):="0000000000000000"; 	

component registru is
	port (
			CLK,L,R:  in STD_LOGIC;
			Din:  in STD_LOGIC_VECTOR (15 downto 0);
			Dout: out STD_LOGIC_VECTOR (15 downto 0)
		  );
end component; 
component organigram is
	port(OK: in Std_logic; 
		 RESET: in std_logic;
		 Comparator1,Comparator2:in std_logic;
		 dis,cost,cash,debt : in std_logic_vector (15 downto 0);
		 mode1,mode2,mode3,mode4 : out std_logic;
		 led_error : out std_logic; 
		 show_number : out std_logic_vector (15 downto 0);
		 chitanta : out std_logic
 		 ); 
end component; 
component MUX16_1km is
	 port(
		 Sel : in STD_LOGIC_VECTOR(3 downto 0);
		 number : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end component;
component Comparare_Distanta is
	port(
	A : in std_logic_vector (15 downto 0);
	pret : out std_logic_vector (15 downto 0));
end component;	
component afisor is
	port(
		number:in std_logic_vector(15 downto 0);
		clk: in STD_LOGIC;
		clear: in STD_LOGIC;
		LED_out: out STD_LOGIC_VECTOR(6 downto 0);
		anode: out STD_LOGIC_VECTOR(3 downto 0);	 --pentru selectarea unui singur afisaj (active pe 0)
      enable_afisor: in STD_LOGIC);
end component;	
component MUX16_1 is
	 port(
		 Sel : in STD_LOGIC_VECTOR(3 downto 0);
		 number : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end component;
component Comparare_Bani is
	port(
	A : in std_logic_vector (15 downto 0);
	B : in std_logic_vector (15 downto 0);
	ok : out std_logic);
end component;	  
component generator_SPA is
	port (
			R, CLK:  in STD_LOGIC;
		      Dout: out STD_LOGIC_VECTOR (15 downto 0)
		  );											 
end component;
component Comparare_Rest is
	port(
	A : in std_logic_vector (15 downto 0);
	B : in std_logic_vector (15 downto 0);
	mai_mare : out std_logic;	   
	S : out std_logic_vector (15 downto 0));
end component;
signal bani_temp,bani_casa : std_logic_vector (15 downto 0);
signal km_temp,km,pret,bani,rest,number,scadere1,scadere2 : std_logic_vector (15 downto 0);
signal comparator1,comparator2 : std_logic :='0';
signal mode1,mode2,mode3,mode4,mode5 : std_logic;

begin 							 					
	uc: organigram port map(ok,reset,comparator1,comparator2,km,pret,bani,rest,mode1,mode2,mode3,mode4,led_erroare,number,eliberare_bilet);
	genereaza_numar: generator_SPA port map(mode4,clk,bani_temp); 
	memorare_rest: registru port map(clk,mode3,reset,bani_temp,bani_casa);
	add_input<=add100&add50&add10&add5;
	number_select: MUX16_1KM port map(add_input,km_temp); 
	memorare_km: registru port map(clk,mode5,reset,km_temp,km);
	comparare: Comparare_Distanta port map(km,pret);
	memorare_pret: registru port map(clk,mode1,reset,pret,scadere2);
	cash_select: MUX16_1 port map(add_input,bani);	 
	comparare_suma_introdusa: Comparare_Bani port map (bani,scadere2,comparator1);
	memorare_bani_introdusi: registru port map(clk,mode2,reset,bani,scadere1);
	comparare_scadere_rest: Comparare_Rest port map(bani,scadere2,comparator2,rest);
	afiseaza: afisor port map(number,clk,reset,catod,anod,'1');
end architecture;