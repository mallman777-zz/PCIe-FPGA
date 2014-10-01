--Simple Counter

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity COUNT8 is
    port (
        DIN :   in  std_logic_vector(7 downto 0);
        CLK :   in  std_logic;
        LOAD :   in  std_logic;
        DOUT :   out  std_logic_vector(7 downto 0);
    );
end COUNT8;

architecture behavior of COUNT8 is

begin
    --notice the process statement and the variable COUNT
    clk_proc:process(CLK)
    variable COUNT:unsigned(7 downtto 0) := "00000000";
    begin
        if (CLK'EVENT AND CLK = '1') then 
            if LOAD = '1' then 
                COUNT := DIN;
            else 
                COUNT := COUNT + 1;
            end if;
        end if;
        DOUT <= COUNT after 50 ns;
    end process clk_proc;
end behavior;
