-- Somador decimal em VHDL

library ieee;
use ieee.std_logic_1164.all;

entity relogioDigital is
-- PARA TESTES O ARQUIVO divisorDeClock foi alterado para dividir o clock por 2
	port (clk		: in  std_logic;
			enable	: in  std_logic;
			load		: in 	std_logic;
			clear		: in 	std_logic;
			seletor	: in 	std_logic;
			carga1	: in 	std_logic_vector(3 downto 0);
			carga2	: in 	std_logic_vector(3 downto 0);
			
			-- saidas pro display sete segmentos:
			
			saida1	: out std_logic_vector(6 downto 0); 
			saida2	: out std_logic_vector(6 downto 0)	
			);
end relogioDigital;

architecture blocosRelogio of relogioDigital is
	
	-- Sinal de 1 Hz (saida do divisor de clk)
	signal 	clock1Hz : std_logic;
	
	-- Sinais de saida dos contadores (4 bits)
	signal  	s_saida1	: std_logic_vector(3 downto 0);
	signal  	s_saida2	: std_logic_vector(3 downto 0);
	
	-- Componentes de acordo com a interface padrão
	component divisorDeClock is
		port(
			-- input do clock
			clk     : in std_logic;                 
			-- output dos clocks
			clkout1Hz  	 : out std_logic;
			clkout100Hz  : out std_logic;
			clkout1KHz   : out std_logic;
			clkout440Hz  : out std_logic;
			clkout1760Hz : out std_logic		    
		);
	end component;
	
	
	component contadorDecadaUpDown is
		port(
			clock1Hz		: in std_logic;
			clear			: in std_logic;
			load 			: in std_logic;
			dir  			: in std_logic;
			enable		: in std_logic;
			data			: in std_logic_vector (3 downto 0); 
			rco     		: out std_logic;
			Q    			: out std_logic_vector(3 downto 0));
	end component;
	
	
	component setesegmentos is
		port (entrada	: in  std_logic_vector(3 downto 0);
				saida:  out std_logic_vector(6 downto 0));
	end component;

begin
	-- Bloco 1: divisor de clock
	-- em um primeiro momento as demais saidas de clock sao deixadas em aberto
	Bloco_1: divisorDeClock port map(clk, clock1Hz, open, open, open, open);
	
	-- Bloco 2: contador de decada
	Bloco_2: contadorDecadaUpDown port map(clock1Hz, clear, load, '0', 
														not(seletor) and enable, carga1, open, s_saida1);
	-- Bloco 3: contador de decada
	Bloco_3: contadorDecadaUpDown port map(clock1Hz, clear, load, '0', 
														seletor and enable, carga2, open, s_saida2);
	-- Bloco 4: setesegmentos 1
	Bloco_4: setesegmentos port map(s_saida1, saida1);
	
	-- Bloco 5: setesegmentos 2
	Bloco_5: setesegmentos port map(s_saida2, saida2);
end blocosRelogio;