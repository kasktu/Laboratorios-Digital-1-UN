library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SumadorCompleto is

	port(
	    -- Puertos de Entrada
		A : in std_logic;
		B : in std_logic;
		C_in : in std_logic;
	
		-- Puertos de salida
		C_out : out std_logic;
		S : out std_logic

	);

end SumadorCompleto;

architecture sumador of SumadorCompleto is

begin

	-- Acarreo de Salida
   C_out <= (A and B) or ((A xor B) and C_in);

	-- Salida de la suma
   S <= A xor (B xor C_in);


end sumador;