library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity  anti_rebote is 
	    port(
			-- Input ports
			tau,pulse: in std_logic;
			-- Output ports
			pulse_out: out std_logic);

end anti_rebote;

architecture registro of anti_rebote is

	signal reg: std_logic_vector(1000 downto 0);
    begin

        process(tau,pulse)
        
        begin

            if rising_edge(tau) then 
                reg <= reg(999 downto 0) & not pulse; 
            end if;
            if reg = "00" then 
                pulse_out <='1';
            else 
                pulse_out <= '0';
            end if;
	
	end process;
end registro;