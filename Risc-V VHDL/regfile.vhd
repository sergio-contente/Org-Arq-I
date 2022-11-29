library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity register_file is
    port(
        clk        : in  STD_LOGIC;
        we3        : in  STD_LOGIC;
        a1, a2, a3 : in  STD_LOGIC_VECTOR(4 downto 0);
        wd3        : in  STD_LOGIC_VECTOR(31 downto 0);
        rd1, rd2   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end entity;

architecture behav of register_file is
    type r_file is array(0 to 31) of std_logic_vector(31 downto 0);
    signal reg : r_file;

begin
    process(clk) begin
        if(clk'event and clk = '0') then
            if(we3 = '1' and a3 /= x"00" ) then
                reg(to_integer(unsigned(a3))) <= wd3;
            end if;
            rd1 <= reg(to_integer(unsigned(a1)));
            rd2 <= reg(to_integer(unsigned(a2)));
        end if;
    end process;
    reg(0) <= x"00";
end architecture;
        