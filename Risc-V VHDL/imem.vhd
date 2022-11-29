library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use WORK.UTILS.MEM_T;

entity imem is
    port(
        a  : in  STD_LOGIC_VECTOR(31 downto 0);
        rd : out STD_LOGIC_VECTOR(31 downto 0)
    );
end;

architecture behave of imem is
    type mem_t is array (0 to 1023) of std_logic_vector(31 downto 0);
    signal mem : mem_t := (others=>(others=>'0'));

begin
    -- read memory
    rd <= mem(to_integer(unsigned(a)));
end;