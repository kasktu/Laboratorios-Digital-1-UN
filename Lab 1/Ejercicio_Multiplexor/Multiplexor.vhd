library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity  multiplexor is 

	port(
	
-- nombre : in tipo_dato;

-- Entradas
	--Se pueden nombrar una a una o de las siguientes formas
	--S0,S1 : in std_logic;
	--S: in std_logic_vector(0 to 1)-- bit significativo a la derecha
	S: in std_logic_vector(1 downto 0);-- bit significativo a la izquierda
	D: in std_logic_vector(3 downto 0);-- El 3 es la cantidad de datos 
-- Tipos de datos
  -- + bit
  -- + std_logic
  -- + bit_vector
  -- + std_logic_vector
  -- + integer
	
-- Salidas
	Y : out std_logic);
	
 end multiplexor;	
 
 architecture selecion of multiplexor is
 --Tipos de operaciones
   -- not
	-- and
	-- or
	-- xor
	-- xand
	-- nand
	-- nor	
 signal Y0,Y1,Y2,Y3 : std_logic;
 begin
-- descripcion 
	--Y <= (not S(0) and not S(1) and D(0)) or (not S(0) and S(1) and D(1)) or (S(0) and not S(1) and D(2)) or (S(0) and S(1) and D(3));
 -- Descripcion Estructurada
   
	--Y0 <= not S(0) and not S(1) and D(0);
--	Y1 <= not S(0) and S(1) and D(1);
-- Y2 <= S(0) and not S(1) and D(2);
--	Y3 <= S(0) and S(1) and D(3);

--	Y <= Y0 or Y1 or Y2 or Y3;
	
-- Descripcion algoritmica concurrente

	with S select
	Y<= D(0) when "00",
	    D(1) when "01",
   	 D(2) when "10",
	    D(3) when "11";
end selecion;	