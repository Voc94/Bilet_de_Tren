library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity generator_SPA is
	port (
			R, CLK:  in STD_LOGIC;
		      Dout: out STD_LOGIC_VECTOR (15 downto 0)
		  );											 
end entity;
architecture structural of generator_SPA is	
component registru_spa is
		port (
				CLK, L, ST, DR, R, SI:  in STD_LOGIC;
							      Din:  in STD_LOGIC_VECTOR (7 downto 0);
								 Dout: out STD_LOGIC_VECTOR (7 downto 0)
		  	  );
	end component;
	component XOR2 is	  				
		port ( A, B:  in STD_LOGIC;
			      Y: out STD_LOGIC);	
	end component;

signal X: STD_LOGIC;
signal Y: STD_LOGIC_VECTOR (7 downto 0);
begin
	reg: registru_spa port map (CLK => CLK, L=> R, ST => '0', DR => '1', R=> '0', SI => X, Din => "00010000", Dout => Y);
	xor1: XOR2 port map (Y(7), Y(4), X);
	Dout <= "0000000000"&Y (7 downto 2);	 
end architecture;