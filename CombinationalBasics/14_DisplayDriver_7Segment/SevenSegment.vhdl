library ieee;
use ieee.std_logic_1164.all;

entity SevenSegment is

    port(
        A               : in std_logic_vector(3 downto 0);
        Y               : out std_logic_vector(6 downto 0));

end SevenSegment;

architecture rtl of SevenSegment is

begin

    -- Seven Segment Display Driver g-f-e-d-c-b-a.
    process(A) is
    begin
        case A is
            when "0000" => Y <= "0111111";      -- 0.
            when "0001" => Y <= "0000110";      -- 1.
            when "0010" => Y <= "1011011";      -- 2.
            when "0011" => Y <= "1001111";      -- 3.
            when "0100" => Y <= "1100110";      -- 4.
            when "0101" => Y <= "1101101";      -- 5.
            when "0110" => Y <= "1111101";      -- 6.
            when "0111" => Y <= "0000111";      -- 7.
            when "1000" => Y <= "1111111";      -- 8.
            when "1001" => Y <= "1101111";      -- 9.
            when others => Y <= "0000000";      -- Segments OFF.
        end case;
    end process;

end rtl;