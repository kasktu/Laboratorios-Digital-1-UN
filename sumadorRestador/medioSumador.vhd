library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity medioSumador is

	port(
		A : in std_logic;
		B : in std_logic;
		
		C_out : out std_logic;
		S : out std_logic
		
	);

end medioSumador;

architecture suma of medioSumador is 

begin

	S <= A xor B;
	C_out <= A and B;

end suma;