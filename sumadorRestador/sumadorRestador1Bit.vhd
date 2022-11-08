library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sumadorRestador1Bit is
    port(
        --inputs
        A,B,C_in,O: in std_logic;
        --outputs
        C_out,S: out std_logic
    );
end sumadorRestador1Bit;

architecture operacion of sumadorRestador1Bit is

    begin
    S     <= (A xor (B xor C_in)) or (A and (not B) and O);
    C_out <= ((not A) and B and (not C_in)) or (A and B and O) or (A and C_in and O) or (B and C_in)or ((not A) and (not B) and C_in and (not O));

end operacion;