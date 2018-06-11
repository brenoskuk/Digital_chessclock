--somador6

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity somador6 is

	port (a 		: 	 in std_logic_vector (3 downto 0);
			cin 	:	 in std_logic;
			saida	: out std_logic_vector(3 downto 0);
			cout	: out std_logic);
			
end somador6;


architecture soma of somador6 is

		
		signal soma : std_logic_vector(3 downto 0);
		signal r2_inter  		: std_logic_vector(3 downto 0);
		signal s_carry : std_logic;

		begin

		soma <= ('0' & a) + ("0000" & cin);

		s_carry <= '1' when soma > 5 else '0';
		
		
		with s_carry select
			r2_inter <=
				"0000" when '1',
				soma when others;
		cout <= s_carry;
		saida <= r2_inter(3 downto 0);
		
		
end soma;
		
		