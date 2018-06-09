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
			seletor	: in 	std_logic;  							--j1 = 0, j2 = 1
			modo		: in 	std_logic;  							--j1/j2 ou j12/j21
			metodo	: in	std_logic_vector(1 downto 0); 	--Normal = 00, Fischer = 01, Bronstein = 10
			FIMJ1		: in	std_logic;								--fim da vez do J1	
			FIMJ2		: in	std_logic;								--fim da vez do J2	
			
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
	signal 	rco1D : std_logic;
	signal	rco1E : std_logic;
	signal	rco2A : std_logic;
	signal	rco2B : std_logic;
	signal	rco2C : std_logic;
	signal 	rco2D : std_logic;
	signal	rco2E : std_logic;
	
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

	
	signal soma_F1C	:	std_logic_vector(3 downto 0);
	signal soma_F1D	:	std_logic_vector(3 downto 0);
	signal soma_F2C	:	std_logic_vector(3 downto 0);
	signal soma_F2D	:	std_logic_vector(3 downto 0);
	signal soma_B1C	:	std_logic_vector(3 downto 0);
	signal soma_B1D	:	std_logic_vector(3 downto 0);
	signal soma_B2C	:	std_logic_vector(3 downto 0);
	signal soma_B2D	:	std_logic_vector(3 downto 0);
	signal soma1C	:	std_logic_vector(3 downto 0);
	signal soma1D	:  std_logic_vector(3 downto 0);
	signal soma2C	:  std_logic_vector(3 downto 0);
	signal soma2D	:  std_logic_vector(3 downto 0);
	
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
			clock		: in std_logic;
			clear			: in std_logic;
			load 			: in std_logic;
			dir  			: in std_logic;
			enable		: in std_logic;
			data			: in std_logic_vector (3 downto 0); 
			rco     		: out std_logic;
			Q    			: out std_logic_vector(3 downto 0));
	end component;
	
	
		component contador6 is
		port(
			clock		: in std_logic;
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

-- INICIO: LOGICA PARA O INCREMENTO DO METODO SELECIONADO 
	
	--FISCHER
		
		--somadores FISCHER C:  deve somar a s_saidaC (segundos) com DELTA. Pode haver rco
	
		--Jogador 1 saida dos segundos (1C)
	somadorF1: somadorBCD port map(s_saida1C, "0101", '0',soma_F1C, rco_F1);
		--Jogador 2 saida dos segundos (2C)
	somadorF2: somadorBCD port map(s_saida2C, "0101", '0',soma_F2C, rco_F2);
	
		--somadores FISCHER D: deve somar a s_saidaD (segundos) com eventual RCO 	
	
		--Jogador 1 saida dos minutos (1D)
	somadorF3: somadorBCD port map(s_saida1D, "0000", rco_F1,soma_F1D, open);
		--Jogador 2 saida dos minutos (2D)
	somadorF4: somadorBCD port map(s_saida2D, "0000", rco_F2,soma_F2D, open);
	
	
	--BRONSTEIN
	
	
	-- Contadores para o metodo de BRONSTEIN: sempre que a vez do jogador comeca devem contar ate o delta selecionado

		-- Contador de segundos que inicia quando o jogador inicia sua vez 
	Bloco_3A: contadorDecadaUpDown port map(clk, FIMJ2, '0', '1', '1', "0000", open, s_LOADB1);
	Bloco_3B: contadorDecadaUpDown port map(clk, FIMJ1, '0', '1', '1', "0000", open, s_LOADB2);
	
		-- Caso a contagem nao tenha estourado mantem a contagem. Caso contrario atribui ao load o delta
	
	C1<= s_LOADB1 when s_LOADB1 < 5 else "0101";
	C2<= s_LOADB2 when S_LOADB2 < 5 else "0101";
	
	
		--somadores BRONSTEIN C:  deve somar a s_saidaC (segundos) com DELTA. Pode haver rco
	
		--somadorB_C: Jogador 1 saida dos segundos (1C)
	somadorB1: somadorBCD port map(s_saida1C, C1, '0', soma_B1C, rco_B1);
		--somadorB_C: Jogador 2 saida dos segundos (2C)
	somadorB2: somadorBCD port map(s_saida2C, C2, '0', soma_B2C, rco_B2);
	
		
		--somadores BRONSTEIN D:  deve somar a s_saidaD (minutos) com eventual RCO
		
		--somadorB_D: s_saidaD + rco_B, sai soma_B2;
	somadorB3: somadorBCD port map(s_saida1D, "0000", rco_B1, soma_B1D, open);
	somadorB4: somadorBCD port map(s_saida2D, "0000", rco_B2, soma_B2D, open);
	

-- FIM: LOGICA PARA O INCREMENTO DO METODO SELECIONADO 



-- INICIO: SELECAO DO INCREMENTO REALIZADO (Fisher, Bronstein ou Normal) 
	
	--JOGADOR 1:
	
		-- digito dos segundos C
	with metodo select
	soma1C <= "0000"  when "00", 	-- soma1C recebe zero
			  soma_F1C when "01", 	-- soma1C recebe a soma Fischer referente ao digito C
		     soma_B1C when "10"; 	-- soma1C recebe a soma Bronstein referente ao digito C
	
		-- digitos dos minutos D
	with metodo select
	soma1D <="0000" when "00",		-- sina1D recebe zero
				soma_F1D when "01", 	-- soma1D recebe soma Fischer
				soma_B1D when "10"; 	-- soma1D recebe soma Bronstein
	
	
	--Jogador 2:
	
			-- digito dos segundos C
	with metodo select
	soma2C <= "0000"  when "00", 	-- soma2C recebe zero
			  soma_F2C when "01", 	-- soma2C recebe a soma Fischer referente ao digito C
		     soma_B2C when "10"; 	-- soma2C recebe a soma Bronstein referente ao digito C
	
		-- digitos dos minutos D
	with metodo select
	soma2D <="0000" when "00",		-- sina2D recebe zero
				soma_F2D when "01", 	-- soma2D recebe soma Fischer
				soma_B2D when "10"; 	-- soma2D recebe soma Bronstein

-- FIM:  SELECAO DO INCREMENTO REALIZADO
	
-- INICIO: DIVISOR DE CLOCK
	CLOCK_DIV: divisorDeClock port map(clk, clock1Hz, clock100Hz, open, open, open);
-- FIM: DIVISOR DE CLOCK


-- INICIO: CONTADORES DOS JOGADORES

	-- JOGADOR 1

	-- Bloco 1A: contador centesimal (1/100)
	Bloco_1A: contadorDecadaUpDown port map(clock100Hz, '0', preset, '0',  
														not(seletor) and enable, "0000", rco1A, s_saida1A);  
	-- Bloco 1B: contador decimal (1/10)
	Bloco_1B: contadorDecadaUpDown port map(Clk, '0', preset, '0', 
														not(seletor) and enable and rco1A, "0000", rco1B, s_saida1B);
	-- Bloco 1C: contador unidades 1 (1)
	Bloco_1C: contadorDecadaUpDown port map(clk, '0', preset or (dar_load and seletor) , '0',
														not(seletor) and enable and rco1A and rco1B, load1, rco1C, s_saida1C);
	-- Bloco 1D: contador dezenas (10) OBS: conta ate 60 segundos
	Bloco_1D: contador6 port map(clk, '0',  preset or (dar_load and seletor) ,'0', 
														not(seletor) and enable and rco1A and rco1B and rco1C, load2, rco1D, s_saida1D);
														
	-- Bloco 1E: contador minutos (1 min)
	Bloco_1E: contadorDecadaUpDown port map(clk, '0',  preset or (dar_load and seletor) ,'0', 
														not(seletor) and enable and rco1A and rco1B and rco1C and rco1D, load2, rco1E, s_saida1E);
														
	-- Bloco 1F: contador dezenas minutis (10 min) OBS: conta ate 60 minutos
	Bloco_1F: contador6 port map(clk, '0',  preset or (dar_load and seletor) ,'0', 
														not(seletor) and enable and rco1A and rco1B and rco1C and rco1D and rco1E, load2, open, s_saida1F);
	
	
	
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