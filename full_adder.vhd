Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity full_adder_vhdl_code is
 Port ( A : in STD_LOGIC;
 B : in STD_LOGIC;
 Cin : in STD_LOGIC;
 S : out STD_LOGIC;
 Cout : out STD_LOGIC);
end full_adder_vhdl_code;
 
architecture gate_level of full_adder_vhdl_code is
 
begin
 
 S <= A xor B xor Cin ;
 Cout <= ((not(A) and B) or (B and Cin)) or (not(A) and Cin); 
end gate_level;
