library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mayorMenorByBit is
    port(
        A: in std_logic_vector(3 downto 0); -- señal del bit de la señal A
        B: in std_logic_vector(3 downto 0); -- señal del bit de la señal B

        X: out std_logic_vector(6 downto 0);
        S: out std_logic_vector(1 downto 0));
end  mayorMenorByBit;

architecture mayorMenorIgual4Bit of  mayorMenorByBit is 
    component comparador_bit
            
        port(
            A: in std_logic; -- señal del bit de la señal A
            B: in std_logic; -- señal del bit de la señal B

            -- salida de la comparativa para encender los leds
            S: out std_logic_vector(2 downto 0));
            
        end component;
        
    signal S1,S2,S3,S4: std_logic_vector(2 downto 0);
    begin
        bit1 : comparador_bit 
		port map
		(
			A => A(3),
			B => B(3),
			S => S1
		);
		
	bit2 : comparador_bit 
	port map
	(
		A => A(2),
		B => B(2),
		S => S2
	);
	
	bit3 : comparador_bit 
	port map
	(
		A => A(1),
		B => B(1),
		S => S3
	);
	
	bit4 : comparador_bit 
	port map
	(
		A => A(0),
		B => B(0),
		S => S4
	);

    X(0) <= S1(1) and S2(0);
	X(1) <= S1(1) and S2(2);
	X(2) <= S1(1) and S2(1) and S3(0);
	X(3) <= S1(1) and S2(1) and S3(2);
	X(4) <= S1(1) and S2(1) and S3(1) and S4(0);
	X(5) <= S1(1) and S2(1) and S3(1) and S4(2);
	X(6) <= S1(1) and S2(1) and S3(1) and S4(1);
    
    S(0) <= S1(0);
    S(1) <= S1(2);
end mayorMenorIgual4Bit;