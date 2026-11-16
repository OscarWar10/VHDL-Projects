library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter4Bit is

    port(
        CLK                 : in std_logic;
        RST                 : in std_logic;                             -- Active RST = '1'.
        C                   : in std_logic;                             -- C = '0' --> Count Up; C = '1' --> Count Down.
        COUNT               : out std_logic_vector(3 downto 0));

end Counter4Bit;

architecture rtl of Counter4Bit is

    signal count_aux : unsigned(3 downto 0);

begin

    -- 4 Bit Counter.
    process(CLK, RST) is
    begin
        if (RST = '1') then                         -- Reset Count.
            count_aux <= (others => '0');
        elsif (CLK'event and CLK = '1') then
            if (C = '0') then                               -- Count Up.
                count_aux <= count_aux + 1;
            else                                            -- Count Down.
                count_aux <= count_aux - 1;
            end if;
        end if;
    end process;
    
    COUNT <= std_logic_vector(count_aux);

end rtl;