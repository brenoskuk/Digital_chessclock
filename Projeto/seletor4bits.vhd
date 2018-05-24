
library ieee;
--Seletor de 4 bits com base em um bit seletor
use ieee.std_logic_1164.all;

entity seletor4bits is
	port(
		seletor : in std_logic;
		entrada0: in std_logic_vector(3 downto 0);
		entrada1: in std_logic_vector(3 downto 0);
		
		saida:  out std_logic_vector(3 downto 0));
end entity;

architecture combinatorio of seletor4bits is
	
	signal s_entrada0 : std_logic_vector(3 downto 0);
	signal s_entrada1 : std_logic_vector(3 downto 0);


begin
	s_entrada0 <= entrada0;
	s_entrada1 <= entrada1;
	with seletor select
	saida <= s_entrada0 when '0',
				s_entrada1 when '1';
end combinatorio;