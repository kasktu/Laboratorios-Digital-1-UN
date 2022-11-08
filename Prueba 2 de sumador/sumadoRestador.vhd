library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sumadoRestador is

	port(
		-- Puertos de entrada
		A: in  std_logic_vector(2 downto 0); 
		B: in  std_logic_vector(2 downto 0);
		Sel : in std_logic;
		
		-- Puertos de salida
		C_out: out std_logic;
		S:	out std_logic_vector(2 downto 0)
	);

end sumadoRestador;

architecture suma of sumadoRestador is

-- Señales de interconexion entre los sumadores
signal aux2 : std_logic_vector(1 downto 0);

	component SumadorCompleto

		port(
			-- Puertos de entrada
			A : in std_logic;
			B : in std_logic;
			C_in : in std_logic;
	
			-- Puertos de salida
			C_out : out std_logic;
			S : out std_logic
		);

	end component;


begin

	comp0_SumadorCompleto : SumadorCompleto
		port map(
			A => A(0),
			B => (B(2) xor Sel),
			C_in => Sel,

			C_out => aux2(0),
			S => S(0)
		);

	comp1_SumadorCompleto : SumadorCompleto
		port map(
			A => A(1),
			B => (B(1) xor Sel),
			C_in => aux2(0),

			C_out => aux2(1),
			S => S(1)
		);

	comp2_SumadorCompleto : SumadorCompleto
		port map(
			A => A(2),
			B => (B(2) xor Sel ),
			C_in => aux2(1),

			C_out => C_out,
			S => S(2)
		);


end suma;