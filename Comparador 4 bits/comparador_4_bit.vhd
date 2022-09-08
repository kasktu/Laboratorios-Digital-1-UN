-- Para dejar una sección en forma de comentario presione ctrl + Q.
-- La operación opuesta se realiza con ctrl + shift + Q.
-- * Descomente las librerías.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- * Nombre correctamente la entidad (la entidad debe tener el mismo nombre del archivo).
-- No se distinguen las mayúsculas de las minúsculas (name = NAME).

entity comparador_4_bit is

	port(
		-- Input ports
		A: in  std_logic_vector(3 downto 0); 
		B: in  std_logic_vector(3 downto 0);

		-- Output ports
		A_Mayor: out std_logic;
		Iguales: out std_logic;
		B_Mayor: out std_logic);
		
end comparador_4_bit;


architecture comparar of comparador_4_bit is

	-- Un componente se declara de la siguiente forma:
	-- component (nombre de la entidad que se va a declarar como componente)
	-- 	port(
	--			Este port es el mismo de la entidad a declarar como componente.
	--		);
	-- end component;
	
	component mayorMenorByBit
		
    port(
        A: in std_logic_vector(3 downto 0); -- señal del bit de la señal A
        B: in std_logic_vector(3 downto 0); -- señal del bit de la señal B
		
		 --  salida de las comparativas and
        X: out std_logic_vector(6 downto 0);
		  -- comparativa primer bit para el ultimo or
        S: out std_logic_vector(1 downto 0)); 
		
	end component;

signal X: std_logic_vector(6 downto 0);
signal S: std_logic_vector(1 downto 0);
begin
	
	 mayorMenor: mayorMenorByBit
	port map
	(
		A => A,
		B => B,
		X => X,
		S => S
	);

	
	Iguales	 <= X(6); 
	A_Mayor <= X(5) or X(3) or X(1) or S(1);
	B_Mayor <= X(4) or X(2) or X(0) or S(0);


end comparar;