library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity div_freq is

	port(
		-- Input ports
		clk: in std_logic;
      freq_inicial,freq_deseada: in integer;			
		
		-- Output ports
		f: out std_logic);
		
end div_freq;


architecture divisor of div_freq is
	signal salida: std_logic :='0';
	signal cuenta: integer range 0 to 250000000 := 0; 
    signal Nciclos: integer range 0 to 25000000:=0;

	begin

    Nciclos<=freq_inicial/(2*freq_deseada);
	process(clk) 
	begin
	
		if rising_edge(clk) then 
		
			if cuenta = Nciclos then
				cuenta <= 0;
				salida <= not salida; -- Se niega el valor de la señal salida y se asigna a sí misma.
			else
				cuenta <= cuenta + 1; 
			end if;
		end if;

	end process;
	
	f <= salida;

end divisor;