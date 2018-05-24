-- VHDL divisor de clocks 1,100,1000,440,1760 simultaneo

library IEEE;
use IEEE.std_logic_1164.all;

entity divisorDeClock is
	-- declaracao das divisoes
	-- vaolores padrao respectivamente:
	-- 50000000, 500000, 50000, 113636, 20409
	generic (    
	   DIV1Hz 	   : integer := 50000000;
		DIV100Hz		: integer := 500000; 
		DIV1KHz 		: integer := 50000;
		DIV440Hz 	: integer := 113636; 
		DIV1760Hz 	: integer := 20409
				);
	 
	port (
		-- input do clock
		clk     : in std_logic;                 
		-- output dos clocks
		clkout1Hz  	 : out std_logic;
		clkout100Hz  : out std_logic;
		clkout1KHz   : out std_logic;
		clkout440Hz  : out std_logic;
		clkout1760Hz : out std_logic		  
		  
    );
end entity divisorDeClock;

architecture comportamental of divisorDeClock is
	signal clkout1Hz_signal : std_logic;        
	signal clkout100Hz_signal : std_logic;
	signal clkout1kHz_signal : std_logic;
	signal clkout440Hz_signal : std_logic;
	signal clkout1760Hz_signal : std_logic;
begin
    
	clkdiv_proc : process (clk)
		-- declara variaveis referentes as distintas
		--divisoes de clock requeridas
		variable count1 		: integer range 0 to
		DIV1Hz 		-1;
		variable count100		: integer range 0 to
		DIV100Hz  	-1;
		variable count1k 		: integer range 0 to
		DIV1KHz		-1;
		-- as ultimas divisoes nao sao exatas mas encaixam na precisao de 5%
		variable count440 	: integer range 0 to DIV440Hz		-1;
		variable count1760 	: integer range 0 to DIV1760Hz	-1;
    begin
        if rising_edge(clk) then
				-- divisao de clock para 1Hz
            if count1=DIV1Hz/2-1 then      
                clkout1Hz_signal <= not clkout1Hz_signal;
                count1 := count1 + 1;
				elsif count1=DIV1Hz-1 then     
                clkout1Hz_signal <= not clkout1Hz_signal;
                count1 := 0;                 
            else
                count1 := count1 + 1;
            end if;
				-- divisao de clock para 100Hz
            if count100=DIV100Hz/2-1 then      
                clkout100Hz_signal <= not clkout100Hz_signal;
                count100 := count100 + 1;
				elsif count100=DIV100Hz-1 then     
                clkout100Hz_signal <= not clkout100Hz_signal;
                count100 := 0;                 
            else
                count100 := count100 + 1;
            end if;
				-- divisao de clock para 1KHz
            if count1K=DIV1KHz/2-1 then      
                clkout1KHz_signal <= not clkout1KHz_signal;
                count1K := count1K + 1;
				elsif count1K=DIV1KHz-1 then     
                clkout1KHz_signal <= not clkout1KHz_signal;
                count1K := 0;                 
            else
                count1K := count1K + 1;
            end if;
				-- divisao de clock para 440Hz
            if count440=DIV440Hz/2-1 then      
                clkout440Hz_signal <= not clkout440Hz_signal;
                count440 := count440 + 1;
				elsif count440=DIV440Hz-1 then     
                clkout440Hz_signal <= not clkout440Hz_signal;
                count440 := 0;                 
            else
                count440 := count440 + 1;
            end if;
				-- divisao de clock para 1760Hz
            if count1760=DIV1760Hz/2-1 then      
                clkout1760Hz_signal <= not clkout1760Hz_signal;
                count1760 := count1760 + 1;
				elsif count1760=DIV1760Hz-1 then     
                clkout1760Hz_signal <= not clkout1760Hz_signal;
                count1760 := 0;                 
            else
                count1760 := count1760 + 1;
            end if;
				
        end if;
	end process;
	-- saidas ligadas com os respectivos signals
	clkout1Hz 		<= clkout1Hz_signal;
	clkout100Hz 	<= clkout100Hz_signal;
	clkout1KHz 		<= clkout1KHz_signal;
	clkout440Hz 	<= clkout440Hz_signal;
	clkout1760Hz 	<= clkout1760Hz_signal;


	 
end comportamental;