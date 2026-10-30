library ieee;
use ieee.std_logic_1164.all;

entity DEMUX_1_2 is

    port(
        D           : in std_logic;
        SEL         : in std_logic;
        Y           : out std_logic_vector(1 downto 0));

end DEMUX_1_2;

architecture rtl of DEMUX_1_2 is

begin

    process(D, SEL) is
    begin
        -- Default values to avoid latches.
        Y(0) <= '0';
        Y(1) <= '0';

        -- Drive input D to selected output.
        case SEL is
            when '0' =>
                Y(0) <= D;
            when '1' =>
                Y(1) <= D;
            when others =>
                NULL;
        end case;
    end process;

end rtl;