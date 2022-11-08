library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity contador is
       port (
        f1hz,Reset,start,stp:in std_logic:='0';
        
        --Salida del numero en binario
        Num: out std_logic_vector (5 downto 0));
end entity contador;

architecture Count of contador is

    signal numero: std_logic_vector (5 downto 0);
    signal control: std_logic:='1';
    signal cuenta,res,stopp : integer range 0 to 60:=0;
begin
    ResStart:process(Reset,stp)--Prosceso de control  
    begin
        -- controla el reset hasta que no se suelta no arranca la cuenta
        if Reset='1' then 
            res <= 1;
			elsif Reset='0' then 
				res<= 0;
        elsif rising_edge(Reset) then 
            res <=1;
        end if;
		  -- control de pausa de la señal de control
        if start ='1' then 
            stopp <=0;
        elsif rising_edge(stp) then 
            stopp <=1;
			end if;
    end process ResStart;
	 stop:process 
	 begin
		if stopp =1 then 
			control <='0';
		end if;
		wait until start ='1';
		control<='1';
	 end process stop;
	 contar:process(f1hz)
	 begin
		--control de la cuenta segun la señal de control
        if res=1 or cuenta = 60 then
            cuenta <= 0;
			elsif falling_edge(f1hz) and control='1' then
				cuenta <= cuenta+1;
			end if;
		 Num<= std_logic_vector(to_unsigned(cuenta, Num'length));
	 end process contar;
	 
end architecture Count;