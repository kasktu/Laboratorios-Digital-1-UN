library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comparador_bit is

    port(
        A: in std_logic; -- señal del bit de la señal A
        B: in std_logic; -- señal del bit de la señal B

        -- salida de la comparativa para encender los leds
        S: out std_logic_vector(2 downto 0));
    

end comparador_bit;

architecture comparar of comparador_bit is
    signal Y0,Y1,Y2: std_logic;
begin
    -- logica interna de comparacion de señales
    Y0 <= not A and B;
    Y1 <= A and not B;
	 Y2 <= Y0 nor Y1;
    -- señales externas para la comparativa de los siguientes bits
    S(0) <= Y0;
    S(1) <= Y2;
    S(2) <= Y1;

end comparar ; 