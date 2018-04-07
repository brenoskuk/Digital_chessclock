-- VHDL contador 4 bits up down com clear assincrono --

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity contador4bitsUpDown is
	port(clock		: in std_logic;
		  clear		: in std_logic;
		  load 		: in std_logic;
		  dir  		: in std_logic;
		  enable		: in std_logic;
		  data		: in std_logic_vector (3 downto 0); 
		  rco     	: out std_logic;
		  Q    		: out std_logic_vector(3 downto 0)
		  
		 );	 
end contador4bitsUpDown;			

architecture comportamental of contador4bitsUpDown is
signal t: unsigned (3 downto 0);

begin
	process (clock, enable, clear, load, t)
	begin
		
		
		-- sincronicidade ocorre dentro deste if --
		if clock'event and clock = '1' then
			-- se enable for 1 realiza contagem --
			if enable = '1' then	
				if dir = '1' then
					t <= t + 1;
				elsif dir = '0' then
					t <= t - 1;
				end if;
			end if;
			-- carrega data em load independente da contagem --	
			if load = '1' then
				t <= unsigned(data);
			end if;	
		end if;
	
		-- clear assincrono joga os valores para zero --
		-- independente do que ocorreu--
		if clear = '1' then
			t <= (others=> '0');
		end if;
		
		Q <= std_logic_vector(t);
		
		-- Para emitir RCO mesmo com o LOAD ativo ou --
		-- clear e dir em zero --
		--caso em que conta positivo--
		if dir = '1' then
			if conv_integer(t) = 15 then
				rco <= '1';
			else
				rco <= '0';
			end if;
		--caso em que conta negativo--
		elsif dir = '0' then
			if conv_integer(t) = 0 then
				rco <= '1';
			else 
				rco <= '0';
			end if;
		end if;	
		
		
	end process;
end comportamental;
