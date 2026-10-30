library ieee;
use ieee.std_logic_1164.all;

entity DEMUX_1_4 is

    port(
        D           : in std_logic;
        SEL         : in std_logic_vector(1 downto 0);
        Y           : out std_logic_vector(3 downto 0));

end DEMUX_1_4;

architecture rtl of DEMUX_1_4 is

begin

    process(D, SEL) is
    begin
        -- Default values to avoid latches.
        Y(0) <= '0'; 
        Y(1) <= '0'; 
        Y(2) <= '0'; 
        Y(3) <= '0';

        -- Drive input D to selected output.
        case SEL is
            when "00" =>
                Y(0) <= D;
            when "01" =>
                Y(1) <= D;
            when "10" =>
                Y(2) <= D;
            when "11" =>
                Y(3) <= D;
            when others =>
                NULL;
        end case;
    end process;

end rtl;