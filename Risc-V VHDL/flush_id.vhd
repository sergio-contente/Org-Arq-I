library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flush_id is
	port(
		clk, clear    : in  STD_LOGIC;
		IFID          : in  STD_LOGIC;
		flushD        : in  STD_LOGIC;
		instruction_i : in  STD_LOGIC_VECTOR(31 downto 0);
		address_i     : in  STD_LOGIC_VECTOR(31 downto 0);
		instruction_o : in  STD_LOGIC_VECTOR(31 downto 0);
		address_o     : out STD_LOGIC_VECTOR(31 downto 0)	
	);
end flush_id;

architecture arch of flush_id is
begin
	process (clk, clear) 
	begin
		if (clear = '1') then
			instruction_o <= (others => '0');
			address_o     <= (others => '0');
		elsif rising_edge(clk) then
			if (flushD = '0') then
				if(IFID = '1') then
					instruction_o <= instruction_i;
					address_o     <= address_i;
				end if;
			else
				instruction_o <= (others => '0');
				address_o     <= (others => '0');
			end if;
		end if;
	end process;
end arch;