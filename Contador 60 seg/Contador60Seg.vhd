library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Contador60Seg is
    port (
        Res,Strt,Stp,clk: in std_logic;-- entradas de todos lo botones y el clk
        Count: out std_logic_vector(6 downto 0) --Salida a la pantalla en 7Seg (sin la tierra)
    );
end entity Contador60Seg;

architecture Count of Contador60Seg is

    signal Reset,Start,Stopp: std_logic;--Señales de los botones sin rebote
    signal f1000hz,f1hz: std_logic:='0';-- señales de las diferentes frecuencias a usar
    signal freq_inicial:integer range 0 to 50000000:=50000000;-- frecuencia de reloj en hz
	signal freq_1000hz:integer range 0 to 25000000:=1000;
	signal numero:std_logic_vector( 5 downto 0);
    component anti_rebote
    port(
        -- Input ports
        tau,pulse: in std_logic;
        -- Output ports
        pulse_out: out std_logic);
    end component;

    component div_freq 
	port(
		-- Input ports
		clk: in std_logic;
      freq_inicial,freq_deseada: in integer;			
		
		-- Output ports
		f: out std_logic);
    end component;
    component contador
       port (
        f1hz,Reset,start,stp:in std_logic:='0';
        
        --Salida del numero en binario
        Num: out std_logic_vector (5 downto 0));
    end component;

begin
    --Sistemas antirebote de cada Boton
	anti_rebote_res: anti_rebote
	port map(f1000hz,Res,Reset);    

	anti_rebote_start: anti_rebote
	port map(f1000hz,Strt,Start);

	anti_rebote_stop: anti_rebote
	port map(f1000hz,Stp,Stopp);   

	--Diferentes señales a usar en el diseño   
	senal_1000hz : div_freq
	port map (clk,freq_inicial,freq_1000hz,f1000hz);

    --Contador de 60 seg(entrada de 1hz, crear componente en base a las otras señales)
    cuenta:contador -- nos devuelve el numero como integer
    port map (f1hz,Reset,Start,Stopp,numero);
    --Demas componentes
    
        
end architecture Count;