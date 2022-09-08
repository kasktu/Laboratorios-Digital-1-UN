library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  Multiplexor is 

	port(
	
	S: in std_logic_vector(1 downto 0);
	D: in std_logic_vector(3 downto 0);

	Y : out std_logic);
	
 end Multiplexor;	
 
 architecture selecion of Multiplexor is
	signal Y0,Y1,Y2,Y3 : std_logic;
 begin
	Y0 <= not S(0) and not S(1) and D(0);
	Y1 <= not S(0) and S(1) and D(1);
	Y2 <= S(0) and not S(1) and D(2);
	Y3 <= S(0) and S(1) and D(3);

	Y <= Y0 or Y1 or Y2 or Y3;
end selecion;