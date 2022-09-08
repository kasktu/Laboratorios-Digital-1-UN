-- Lo primero que se deben colocar son las librerías. Se sugiere compiarlas
-- en todos los archivos del proyecto.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comp_bits is

	port(
		-- Una señal de entrada o salida se define de la siguiente manera:
		-- (nombre de la señal): in/out (tipo de dato);
	
		-- Input ports
		A	: in	std_logic;
		-- * Defina la señal de entrada B

		-- Output ports
		C,D: out std_logic;
		-- * Defina la señal de salida E
		);
		
end comp_bits;

-- * Cambie el nombre de la arquitectura
architecture arch of comp_bits is
	
begin
	-- Descripción del circuito
	-- Considere siempre la sangría para facilitar la compresión del código.

	D <= A and not B;
	
	-- Recuerde el diseño presentado en la guía.
	-- * Describa las operaciones para las señales de salida C y E. 

end arch;
