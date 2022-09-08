library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity sumador is

	port
	(
		-- Input ports -- Sumador 
		SR	: in  std_logic;
		
		A: in std_logic_vector(3 downto 1);
		B: in std_logic_vector(3 downto 1);
		
		-- Output ports -- Sumador 
		Sout: out std_logic_vector(4 downto 1)

	);
end sumador;

architecture estructural of sumador is
signal Cin,Cout: std_logic_vector(3 downto 1);
begin
	Cin(1) <= SR;

	Sout(1) <= not((not A(1) xor (SR xor not B(1))) xor Cin(1));
	
	Cout(1) <= (Cin(1) and (not A(1) or (SR xor not B(1)))) or (not A(1) and (SR xor not B(1))); -- El Cout1 es el Cin2 
	
	Cin(2) <= Cout(1);
	
	Sout(2) <= not(((not A(2) xor (SR xor not B(2))) xor Cin(2)));
	
	Cout(2) <= (Cin(2) and (not A(2) or (SR xor not B(2)))) or (not A(2) and (SR xor not B(2))); -- El Cout2 es el Cin3

	Cin(3) <= Cout(2);
	
	Sout(3) <= not((not A(3) xor (SR xor not B(3))) xor Cin(3));

	Cout(3) <= ((Cin(3) and (not A(3) or (SR xor not B(3)))) or (not A(3) and (SR xor not B(3)))) ;
	
	Sout(4) <= not ((Cout(3) and not(SR)) or ((not Cout(3)) and SR));
	
	


end estructural;