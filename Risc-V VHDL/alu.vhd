library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity alu is
    port(
        a, b       : in  STD_LOGIC_VECTOR(31 downto 0);
        ALUControl : in  STD_LOGIC_VECTOR(2 downto 0);
        ALUResult  : out STD_LOGIC_VECTOR(31 downto 0);
        Zero       : out STD_LOGIC
    );
end entity;

architecture behav of alu is
    signal r : std_logic_vector(31 downto 0);

begin
    process(ALUControl) begin
        case ALUControl is
            when "000"  => r <= std_logic_vector((signed(a) + signed(b))); -- lw, sw
            when "001"  => r <= std_logic_vector((signed(a) - signed(b))); -- beq
            when "101"  => r <= std_logic_vector((signed(a) - signed(b))); -- slt (A<B)
            when "011"  => r <= a or b;
            when "010"  => r <= a and b;
            when others => r <= (others => 'X');
        end case;
    end process;

    with r select Zero <= '1'
        when (others => '0'),
        '0' when others;
        
    ALUResult <= result;
end architecture;