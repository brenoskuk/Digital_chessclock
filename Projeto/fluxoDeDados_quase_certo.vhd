-- fluxoDeDados.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity fluxoDeDados is
-- Fluxo de Dados do relogio digital em VHDL

	port (clk		: in  std_logic;
			enable	: in  std_logic;
			preset	: in 	std_logic;
			seletor	: in 	std_logic;  --j1 = 0, j2 = 1
			modo		: in 	std_logic;
			metodo	: in	std_logic;
			dar_load	: in	std_logic;
		--Fischer = 0, Bronstein = 1
			
			-- saidas para os displays de sete segmentos:
			
			display0	: out 	std_logic_vector(6 downto 0);
			display1	: out 	std_logic_vector(6 downto 0);
			display2	: out 	std_logic_vector(6 downto 0);
			display3	: out 	std_logic_vector(6 downto 0);
			display4	: out 	std_logic_vector(6 downto 0); 
			display5	: out 	std_logic_vector(6 downto 0)
			);
end fluxoDeDados;

architecture fluxo of fluxoDeDados is
	
	-- Sinal de 100 Hz (saida do divisor de clk)
	signal 	clock100Hz : std_logic;
	signal	clock1Hz	  : std_logic;
	
	-- Sinais de saida dos contadores (4 bits)
	signal  	s_saida1A	: std_logic_vector(3 downto 0);
	signal  	s_saida1B	: std_logic_vector(3 downto 0);
	signal	s_saida1C	: std_logic_vector(3 downto 0);
	signal	s_saida1D	: std_logic_vector(3 downto 0);
	signal  	s_saida2A	: std_logic_vector(3 downto 0);
	signal  	s_saida2B	: std_logic_vector(3 downto 0);
	signal	s_saida2C	: std_logic_vector(3 downto 0);
	signal	s_saida2D	: std_logic_vector(3 downto 0);
	
	-- Sinais de passagem para os displays
	signal  	s_D0	: std_logic_vector(3 downto 0);
	signal  	s_D1	: std_logic_vector(3 downto 0);
	signal  	s_D2	: std_logic_vector(3 downto 0);
	signal  	s_D3	: std_logic_vector(3 downto 0);
	signal  	s_D4	: std_logic_vector(3 downto 0);
	signal  	s_D5	: std_logic_vector(3 downto 0);
	
	-- Sinais de logica de passagem entre os seletores
	signal  	s_seletor0	: std_logic_vector(3 downto 0);
	signal  	s_seletor1	: std_logic_vector(3 downto 0);
	signal  	s_seletor2	: std_logic_vector(3 downto 0);
	signal  	s_seletor3	: std_logic_vector(3 downto 0);
	signal  	s_seletor4	: std_logic_vector(3 downto 0);
	signal  	s_seletor5	: std_logic_vector(3 downto 0);
				
	
	-- Sinal dos RCOs
	signal 	rco1A : std_logic;
	signal 	rco1B : std_logic;
	signal	rco1C : std_logic;
	signal	rco2A : std_logic;
	signal	rco2B : std_logic;
	signal	rco2C : std_logic;
	
	-- Sinal de saida
	signal s_display0 : std_logic_vector(6 downto 0);
	signal s_display1 : std_logic_vector(6 downto 0);
	signal s_display2 : std_logic_vector(6 downto 0);
	signal s_display3 : std_logic_vector(6 downto 0);
	signal s_display4 : std_logic_vector(6 downto 0);
	signal s_display5 : std_logic_vector(6 downto 0);
	
	--signals Fischer e Bronstein
	
	signal s_LOADB1:	std_logic_vector(3 downto 0);
	signal s_LOADB2:	std_logic_vector(3 downto 0);
	signal C1		:	std_logic_vector(3 downto 0);
	signal C2		:	std_logic_vector(3 downto 0);

	
	signal soma_F1	:	std_logic_vector(3 downto 0);
	signal soma_F2	:	std_logic_vector(3 downto 0);
	signal soma_F3	:	std_logic_vector(3 downto 0);
	signal soma_F4	:	std_logic_vector(3 downto 0);
	signal soma_B1	:	std_logic_vector(3 downto 0);
	signal soma_B2	:	std_logic_vector(3 downto 0);
	signal soma_B3	:	std_logic_vector(3 downto 0);
	signal soma_B4	:	std_logic_vector(3 downto 0);
	signal soma1	:	std_logic_vector(3 downto 0);
	signal soma2	:  std_logic_vector(3 downto 0);
	signal soma3	:  std_logic_vector(3 downto 0);
	signal soma4	:  std_logic_vector(3 downto 0);
	
	signal load1	: std_logic_vector(3 downto 0);
	signal load2	: std_logic_vector(3 downto 0);
	signal load3	: std_logic_vector(3 downto 0);
	signal load4	: std_logic_vector(3 downto 0);
	
	signal rco_B1	:	std_logic;
	signal rco_B2	:	std_logic;
	signal rco_F1	:	std_logic;
	signal rco_F2	:	std_logic;
		
	
	
	
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
	
	component seletor4bits is
		port (
		seletor : in std_logic;
		entrada1: in std_logic_vector(3 downto 0);
		entrada2: in std_logic_vector(3 downto 0);
		
		saida:  out std_logic_vector(3 downto 0));
	
	end component;
	
	component somadorBCD is
		port ( 
			a		:	in std_logic_vector(3 downto 0);
			b		: 	in std_logic_vector(3 downto 0);
			cin	:  in std_logic;
			saida	:	out std_logic_vector(3 downto 0);
			cout	:	out std_logic);
	end component;

begin 
	
	
	--componentes adicionais
	
	-- Contador LOADB

	Bloco_3A: contadorDecadaUpDown port map(clk, '0', preset and seletor, '1', metodo and enable and not(s_LOADB1(3)), "0000", open, s_LOADB1);
	Bloco_3B: contadorDecadaUpDown port map(clk, '0', preset and not(seletor), '1', metodo and enable and not(s_LOADB2(3)), "0000", open, s_LOADB2);
	
	
	
	--"comparador"
	
	C1<= s_LOADB1 when s_LOADB1 < 5 else "0101";
	C2<= s_LOADB2 when S_LOADB2 < 5 else "0101";
	
	--somadorF_C: s_saidaC + "0101", sai soma_F1 e eventual rco_F;
	somadorF1: somadorBCD port map(s_saida1C, "0101", '0',soma_F1, rco_F1);
	somadorF2: somadorBCD port map(s_saida2C, "0101", '0',soma_F2, rco_F2);
	


	--somadorF_D: s_saidaD + rco_F, sai soma_F2;	
	somadorF3: somadorBCD port map(s_saida1D, "0000", rco_F1,soma_F3, open);
	somadorF4: somadorBCD port map(s_saida2D, "0000", rco_F2,soma_F4, open);
	
	--somadorB_C: s_saidaC + C, sai soma_B1 e eventual rco_B;
	somadorB1: somadorBCD port map(s_saida1C, C1, '0', soma_B1, rco_B1);
	somadorB2: somadorBCD port map(s_saida2C, C2, '0', soma_B2, rco_B2);
	
	
	--somadorB_D: s_saidaD + rco_B, sai soma_B2;
	somadorB3: somadorBCD port map(s_saida1D, "0000", rco_B1, soma_B3, open);
	somadorB4: somadorBCD port map(s_saida2D, "0000", rco_B2,soma_B4, open);
	
	-- seleciona se o load do contador de unidades recebera dados Fischer ou Bronstein ou preset 
	
	--essa primeira parte é para o primeiro jogador;
	
	
	
	
	with metodo select
	soma1<= soma_F1 when '0', -- soma1 recebe a soma Fischer
		     soma_B1 when '1'; -- soma1 recebe a soma Bronstein
	
	
	
	with preset select
		load1<= "0000" when '1', -- contador de unidades é resetado (preset)
			      soma1	   when '0'; -- contador de unidades recebe soma1
	
	
	-- seleciona se o load do contador de dezenas recebera dados Fischer ou Bronstein ou preset 
	with metodo select
	soma2<=soma_F3 when '0', -- soma2 recebe soma Fischer
		    soma_B3 when '1'; -- soma2 recebe soma Bronstein
	
	
	with preset select
	load2 <= "0001" when '1', -- contador de dezenas é resetado (preset)
			    soma2  when '0'; -- contador de dezenas recebe soma2
	
	
	--agora jogador 2
	
	
	with metodo select
	soma3<= soma_F2 when '0',
		     soma_B2 when '1';
	
	
	
	with preset select
	load3 <= "0000" when '1',
		    	 soma3	 when '0';
	
	
	-- seleciona se o load do contador de dezenas recebera dados Fischer ou Bronstein ou preset 
	with metodo select
	soma4<=soma_F4 when '0',
		    soma_B4 when '1';
	
	
	with preset select
	load4 <= "0001" when '1',
		    	 soma4  when '0';
	
	-- Bloco D: divisor de clock
	-- em um primeiro momento as demais saidas de clock sao deixadas em aberto
	Bloco_0: divisorDeClock port map(clk, clock1Hz, clock100Hz, open, open, open);
	
	
	-- Bloco 1 eh referente aos contadores do jogador 1

	-- Bloco 1A: contador de decada centesimal 1
	Bloco_1A: contadorDecadaUpDown port map(clock100Hz, '0', preset, '0',  
														not(seletor) and enable, "0000", rco1A, s_saida1A);  -- os hífens representam "don't care" no std_logic
	-- Bloco 1B: contador de decada decimal 1
	Bloco_1B: contadorDecadaUpDown port map(clock100Hz, '0', preset, '0', 
														not(seletor) and enable and rco1A, "0000", rco1B, s_saida1B);
	-- Bloco 1C: contador de decada das unidades 1
	Bloco_1C: contadorDecadaUpDown port map(clk, '0', preset or (dar_load and seletor) , '0',
														not(seletor) and enable, load1, rco1C, s_saida1C);
	-- Bloco 1D: contador de decada das dezenas 1
	Bloco_1D: contadorDecadaUpDown port map(clk, '0',  preset or (dar_load and seletor) ,'0', 
														not(seletor) and enable and rco1C, load2, open, s_saida1D);
	
	-- Bloco 2 eh referente aos contadores do jogador 2
	
	-- Bloco 2A: contador de decada centesimal 2
	Bloco_2A: contadorDecadaUpDown port map(clock100Hz, '0', preset, '0',  
														seletor and enable, "0000", rco2A, s_saida2A);  
	-- Bloco 2B: contador de decada decimal 2
	Bloco_2B: contadorDecadaUpDown port map(clock100Hz, '0', preset, '0', 
														seletor and enable and rco2A, "0000", rco2B, s_saida2B);
	-- Bloco 2C: contador de decada das unidades 2
	Bloco_2C: contadorDecadaUpDown port map(clk, '0', preset or (dar_load and not(seletor)) , '0',
														seletor and enable, load3, rco2C, s_saida2C);
	-- Bloco 2D: contador de decada das dezenas 2
	Bloco_2D: contadorDecadaUpDown port map(clk, '0', preset or (dar_load and not(seletor)),'0', 
															seletor and enable and rco2C, load4, open, s_saida2D);
	
	
	
	-- blocos de logica seletora dos sinais dos displays:
	Bloco_Seletor0a: seletor4bits port map(seletor, "0001", "0010", s_seletor0);
	Bloco_Seletor0b: seletor4bits port map(modo, s_seletor0, s_saida2C, s_D0);
	
	
	Bloco_Seletor1: seletor4bits port map(modo,"0000", s_saida2D, s_D1);
	
	Bloco_Seletor2a: seletor4bits port map(seletor, s_saida1A, s_saida2A, s_seletor2);
	Bloco_Seletor2b: seletor4bits port map(modo, s_seletor2, "0000", s_D2);
	
	Bloco_Seletor3a: seletor4bits port map(seletor, s_saida1B, s_saida2B, s_seletor3);
	Bloco_Seletor3b: seletor4bits port map(modo, s_seletor3, "0000", s_D3);
	
	Bloco_Seletor4a: seletor4bits port map(seletor, s_saida1C, s_saida2C, s_seletor4);
	Bloco_Seletor4b: seletor4bits port map(modo, s_seletor4, s_saida1C, s_D4);
	
	Bloco_Seletor5a: seletor4bits port map(seletor, s_saida1D, s_saida2D, s_seletor5);
	Bloco_Seletor5b: seletor4bits port map(modo, s_seletor5, s_saida1D, s_D5);
	
	
	
	-- Bloco D eh referente aos seis displays disponiveis 
	
	-- Bloco D1: setesegmentos D1
	Bloco_D1: setesegmentos port map(s_D0, s_display0);
	-- Bloco D2: setesegmentos D2
	Bloco_D2: setesegmentos port map(s_D1, s_display1);
	-- Bloco D3: setesegmentos D3
	Bloco_D3: setesegmentos port map(s_D2, s_display2);
	-- Bloco D5: setesegmentos D4
	Bloco_D4: setesegmentos port map(s_D3, s_display3);
	-- Bloco D5: setesegmentos D5
	Bloco_D5: setesegmentos port map(s_D4, s_display4);
	-- Bloco D6: setesegmentos D6
	Bloco_D6: setesegmentos port map(s_D5, s_display5);
	
	-- Logica para determinar caracteres que nao sao de 0 a 9
	display0 <= s_display0;
	
	with modo select
	display1 <= s_display1 when '1',
				  "1111111"  when '0';
	with modo select			
	display2 <= s_display2 when '0',
				  "1111111"  when '1';
	with modo select
	display3 <= s_display3 when '0',
				  "1111111"  when '1';
	display4 <= s_display4;
	display5 <= s_display5;
		 
					
	
	
end fluxo; 