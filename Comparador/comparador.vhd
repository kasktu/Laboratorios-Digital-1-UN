-- Para dejar una sección en forma de comentario presione ctrl + Q.
-- La operación opuesta se realiza con ctrl + shift + Q.
-- * Descomente las librerías.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- * Nombre correctamente la entidad (la entidad debe tener el mismo nombre del archivo).
-- No se distinguen las mayúsculas de las minúsculas (name = NAME).

entity comparador is

	port(
		-- Input ports
		A: in  std_logic_vector(3 downto 0); 
		B: in  std_logic_vector(3 downto 0);

		-- Output ports
		S:	out std_logic_vector(2 downto 0)); -- S(2): A>B, S(1): A=B, S(0): A<B
		
end comparador;


architecture comparar of comparador is

	-- Declaración de señales y componentes
	-- Para declarar una señal se utiliza la palabra signal, y no se pone in/out.
	
	signal C,D,E: std_logic_vector(3 downto 0); -- Se declaran vectores para las salidas C y D de los 4 comparadores.
	-- * Declare una señal para la salida E de los comparadores.

	-- Un componente se declara de la siguiente forma:
	-- component (nombre de la entidad que se va a declarar como componente)
	-- 	port(
	--			Este port es el mismo de la entidad a declarar como componente.
	--		);
	-- end component;
	
	component compararbits
		
		port(
		
			-- Input ports
		A	: in	std_logic;
		B 	: in 	std_logic;

		-- Output ports
		C,D,E: out std_logic
		
		
		);
		
	end component;
	
	
begin
	-- Descripción del circuito

	-- La instanciación de un componente se realiza de la siguiente manera:
	
	-- (nombre de la instancia) : (nombre del componente a instanciar)
	--	port map(
	--	(señal del componente) => (señal a la que corresponde en el archivo actual),
	-- ...
	--	);
	
	-- Este es un ejemplo de una instanciación completa
	comp3 : compararbits
		port map(
			A => A(3),
			B => B(3),
			C => C(3),
			D => D(3),
			E => E(3)
		);
		
	-- Este es un ejemplo de una instanciación simplificada.
	-- Lo imporante aquí es colocar las señales en el mismo orden en el que estén en su declaración.

	comp2 : compararbits port map(A(2),B(2),C(2),D(2),E(2));
		
	-- * Instancie el componente comp_bits para los bits en la posicion 1 de forma completa.
	
	comp1 : compararbits
		port map(
			A => A(1),
			B => B(1),
			C => C(1),
			D => D(1),
			E => E(1)
		);
	-- * Instancie el componente comp_bits para los bits en la posicion 0 de forma simplificada.
	comp0 : compararbits port map(A(0),B(0),C(0),D(0),E(0));

	-- A > B
	S(2) <= D(3) or (C(3) and D(2)) or (C(3) and C(2) and D(1)) or (C(3) and C(2) and C(1) and D(0)); 
	
	-- A = B
	S(1) <= C(3) and C(2) and C(1) and C(0);
	
	-- A < B
	S(0) <= E(3) or (C(3) and E(2)) or (C(3) and C(2) and E(1)) or (C(3) and C(2) and C(1) and E(0));

end comparar;

-- * Finalmente diríjase al project navigator y seleccione Files, de clic derecho en comparador y
-- defínalo como top entity. Esto permitirá que Quartus considere esta entidad como programa principal.

-- Para verificar que no hay problemas de sintaxis ejecute la función análisis y síntesis en el menú de tareas.
-- Proceda ahora a verificar el funcionamiento de su programa en el simulador. 