-- Unidade de controle do relogioDigital --

library ieee;
use ieee.std_logic_1164.all;


entity unidadeDeControle is
	port(clock		: in std_logic;
		  reset		: in std_logic;
		  start 		: in std_logic;
		  B0 			: in std_logic;
		  B1 			: in std_logic;		
		  saida   	: out std_logic_vector(2 downto 0);
		  saidaS0	: out std_logic;
		  saidaS1	: out std_logic_vector(1 downto 0)
		 );	 
end unidadeDeControle;			

architecture comportamental of unidadeDeControle is
TYPE transition 		is (baixo, alto);
TYPE State_type 		is (S0, S1, S2, JOGO, PAUSA);
TYPE subStateS0		is (incrementa, decrementa);
type subStateS1		is (normal, fisher, bronstein);
signal t : transition;
signal tB1: transition;
signal tB0: transition;
signal MG : State_type;
signal MS0 : subStateS0;
signal MS1 : subStateS1;


begin
	process (clock, start, reset)
	begin
	
		if reset = '0' then 
			MG <= S0;

		elsif clock'event and clock = '1' then
			-- t eh a maquina de estados de transicao
			case t IS
				when baixo =>
					if start = '0' then t <= alto; end if;
			
				when alto =>
					if start = '1' then t <= baixo; end if;
				
			end case;	
			
			case tB0 is
				when baixo=>
					if B0 = '0' then tB0<=alto;end if;
					
				when alto=>
					IF B0 = '1' THEN tB0<=baixo; end if;
					
			end case;
			
			case tB1 is
				when baixo=>
					if B1 = '0' then tB1 <= alto;end if;
					
				when alto=>
					if B1 = '1' then tB1 <= baixo;end if;
			end case;
			-- MG eh a maquina de estados geral
			case MG IS
				when S0 =>
					if start = '1' and t = alto then
						MG <= S1;
					end if;
				when S1 =>
					if start = '1' and t = alto then
						MG <= S2;
					end if;
				when S2 =>
					if start = '1' and t = alto then
						MG <= JOGO;
					end if;
				when JOGO =>
					if start = '1' and t = alto then
						MG <= PAUSA;
					end if;
				when PAUSA =>
					if start = '1' and t = alto then
						MG <= JOGO;
					end if;
			end case;
			
			-- MSO eh a submaquina de estados de S0
			case MS0 IS
				when decrementa =>
					if B1 = '1' and tB1 = alto then
						MS0 <= incrementa;
					end if;
					if B0 = '1' and tB0 = alto then
						MS0 <= decrementa;
					end if;
				when incrementa =>
					if B1 = '1' and tB1 = alto then
						MS0 <= incrementa;
					end if;
					if B0 = '1' and tB0 = alto then
						MS0 <= decrementa;
					end if;
				-- AO LINKAR COM O FLUXO DE DADOS TEM Q ADD ESTADO TEMPRARIO
			end case;
			
			--seleciona modo de jogo MS1
			
			case MS1 is
				when normal=>
					if B1 = '1' and tB1 = alto then
						MS1 <= fisher;
					end if;
					if B0 = '1' and tB0 = alto then
						MS1 <=normal;
					end if;
					
				when fisher=>
					if B0 = '1' and tB0 = alto then
						MS1 <= normal;
					end if;
					if B1 = '1' and tB1 = alto then
						MS1 <= bronstein;
					end if;
				
				when bronstein=>
					if B0 = '1' and tB0 = alto then
						MS1 <= fisher;
					end if;
					if B1 = '1' and tB1 = alto then
						MS1 <= bronstein;
					end if;
				
				end case;
				
			
		end if;
	end process;
		
		with MG select
		
		saida <= "000" when S0,
					"001" when s1,
					"010" when s2,
					"011" when JOGO,
					"100" when PAUSA,
					"101" when others;
					
		with MS0 select
		
		saidaS0 <= 	'1' when incrementa,
						'0' when decrementa;
						
		with MS1 select
		
		saidaS1 <= "00" when normal,
					  "01" when fisher,
					  "10" when bronstein;
					
	
end comportamental;
