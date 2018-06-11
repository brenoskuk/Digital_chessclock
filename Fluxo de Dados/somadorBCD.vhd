--somadorBCD

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity somadorBCD is

	port (a 		: 	 in std_logic_vector (3 downto 0);
			b		:	 in std_logic_vector (3 downto 0);
			cin 	:	 in std_logic;
			saida	: out std_logic_vector(3 downto 0);
			cout	: out std_logic);
			
end somadorBCD;


architecture soma of somadorBCD is

		
		signal soma : std_logic_vector(4 downto 0);
		signal r2_inter  		: std_logic_vector(4 downto 0);
		signal s_carry : std_logic;

		begin

		soma <= ('0' & a) + ('0'& b) + ("0000" & cin);

		s_carry <= '1' when soma > 9 else '0';
		
		
		with s_carry select
			r2_inter <=
				(soma + "0110") when '1',
				soma when others;
		cout <= r2_inter(4);
		saida <= r2_inter(3 downto 0);
		
		
end soma;
		
		