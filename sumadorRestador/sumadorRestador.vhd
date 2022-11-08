library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sumadorRestador is
  port (
    A,B: in std_logic_vector(2 downto 0);
    X: in std_logic;

    C1: out std_logic;
    S: out std_logic_vector(2 downto 0));
    
end sumadorRestador;

architecture operacion of sumadorRestador is

    component medioSumador

        port(
            A : in std_logic;
            B : in std_logic;
            
            C_out : out std_logic;
            S : out std_logic
            
        );

	end component;

    component sumadorRestador1Bit

    port(
        A,B,C_in,O: in std_logic;
        --outputs
        C_out,S: out std_logic        
    );

end component;

    signal C: std_logic_vector(1 downto 0);

begin

   bit0 : medioSumador

	port map(
		
		A => A(0),
		B => B(0),
		C_out => C(0),
		S => S(0)
	);
   bit1 : sumadorRestador1Bit

	port map(
		
		A => A(0),
		B => B(0),
      C_in => C(0),
		O => X,
		C_out => C(1),
		S => S(1)

	);
    bit2 : sumadorRestador1Bit

	port map(
		
		A => A(0),
		B => B(0),
      C_in => C(1),
		O => X,
		C_out => C1,
		S => S(2)

	);


end operacion ; 