-- VHDL 4 bits --

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity contador4bitsUpDown is
	port(clock: in std_logic;
		  clear: in std_logic;
		  load : in std_logic;
		  Q    : out std_logic_vector(3 downto 0)
		 );	 
end contador4bitsUpDown;			

architecture comportamental of contador4bitsUpDown is
signal t: unsigned (3 downto 0);

begin
	process (clock, clear, load, t)
	begin
		
	if clock'event and clock = '1' then
		if clear = '1' then
			t <= (others=> '0');
		elsif load = '1' then
			t <= t + 1;
		end if;	
	end if;
	
	Q <= std_logic_vector(t);
	end process;
end comportamental;