library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity hazard is
    port
    (
        clk          : in  STD_LOGIC;
        op           : in  STD_LOGIC_VECTOR(6 downto 0); -- beq
        IFID_rs1     : in  STD_LOGIC_VECTOR(4 downto 0); -- ld
        IFID_rs2     : in  STD_LOGIC_VECTOR(4 downto 0);
        IDEX_rd      : in  STD_LOGIC_VECTOR(4 downto 0);
        IDEX_memread : in  STD_LOGIC;                   
        pc           : out STD_LOGIC;                    -- nop
        IFID_r       : out STD_LOGIC;
        IDEX_mux     : out STD_LOGIC
    );
end;

architecture behav of hazarddetect is
begin
    
    process(op, IDEX_memread, IDEX_rd, IFID_rs1, IFID_rs2) begin

		if (IDEX_memread = '1'       and
            op           = "1100011" and
            IFID_rs1     = IDEX_rd)  then

			pc       <= '0';
            IFID_r   <= '0';
			IDEX_mux <= '0';
		
        elsif (IDEX_memread = '1'  and
               IFID_rs1 = IDEX_rd  or 
               IFID_rs2 = IDEX_rd) then

            pc       <= '0';
            IFID_r   <= '0';
			IDEX_mux <= '0';

		else
            pc       <= '1';
            IFID_r   <= '1';
			IDEX_mux <= '1';

		end if;
	end process;
end;
