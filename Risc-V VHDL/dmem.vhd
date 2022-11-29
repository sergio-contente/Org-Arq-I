library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use WORK.UTILS.MEM_T;

entity dmem is
    port(
        clk, we : in  STD_LOGIC;
        a, wd   : in  STD_LOGIC_VECTOR(31 downto 0);
        rd      : out STD_LOGIC_VECTOR(31 downto 0)
    );
end;

architecture behave of dmem is
    type mem_t is array (0 to 1023) of std_logic_vector(31 downto 0);
    signal mem : mem_t := (others=>(others=>'0'));

begin
    -- read or write memory
    process(clock)
    begin
        if rising_edge(clk) then
            if (we = '1') then
                mem(to_integer(unsigned(a))) <= wd;
            end if;
        end if;
        rd <= mem(to_integer(a(7 downto 2)));
        wait on clk, a;
    end process;

    rd <= mem(to_integer(unsigned(a)));
end;