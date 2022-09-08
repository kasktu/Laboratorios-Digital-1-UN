library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  Demultiplexor is 

	port(
	
	S: in std_logic_vector(1 downto 0);
	Y: in std_logic;

	Z: out std_logic_vector(3 downto 0));
	
end Demultiplexor;
 
architecture selecion of Demultiplexor is

 begin
	Z(0) <= Y when S = "00" else '0';
	Z(1) <= Y when S = "01" else '0';
	Z(2) <= Y when S = "10" else '0';
	Z(3) <= Y when S = "11" else '0';
end selecion;	