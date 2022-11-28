library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
entity flopenr is
 generic(width: integer);
 port(clk, reset, en: in STD_LOGIC;
 d: in STD_LOGIC_VECTOR(width–1 downto 0);
 q: out STD_LOGIC_VECTOR(width–1 downto 0));
end;
architecture asynchronous of flopenr is
begin
 process(clk, reset, en) begin
 if reset = '1' then q <= (others => '0');
 elsif rising_edge(clk) and en = '1' then q <= d;
 end if;
 end process;
end;