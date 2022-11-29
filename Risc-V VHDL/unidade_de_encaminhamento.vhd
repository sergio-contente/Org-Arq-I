library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity unidade_de_encaminhamento is
    port
    (
        rs1_e   : in  STD_LOGIC_VECTOR(4 downto 0);
        rd_m    : in  STD_LOGIC_VECTOR(4 downto 0);
        rs2_e   : in  STD_LOGIC_VECTOR(4 downto 0);
        rd_w    : in  STD_LOGIC_VECTOR(4 downto 0);
        regw_em : in  STD_LOGIC;
        regw_mw : in  STD_LOGIC;
        forw1   : out STD_LOGIC_VECTOR(1 downto 0);
        forw2   : out STD_LOGIC_VECTOR(1 downto 0)
    );
end;

architecture behave of unidade_de_encaminhamento is
begin
    forw1 <= "10" when (regw_em = '1'    and
                        rd_m = rs1_e     and
                        rd_m /= "00000") else
             "01" when regw_mw = '1'      and rd_w /= "00000" and
                       not (regw_em = '1' and rd_m /= "00000" and (rd_m = rs1_e)) and
                       rd_w = rs1_e       else
             "00";
                     
    forw2 <= "10" when (rd_m = '1'       and
                        rd_m = rs2_e     and
                        rd_m /= "00000") else
             "01" when regw_mw = '1'      and rd_w /= "00000" and
                       not (regw_em = '1' and rd_m /= "00000" and (rd_m = rs2_e)) and
                       rd_w = rs2_e       else
             "00";
end;
