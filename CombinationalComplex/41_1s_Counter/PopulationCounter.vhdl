library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PopulationCounter is

    port(
        P                       : in std_logic_vector(7 downto 0);
        C                       : out std_logic_vector(3 downto 0));                -- 4 Bits For Worst Scenario --> 8 '1's in vector

end PopulationCounter;

architecture rtl of PopulationCounter is

begin

    -- Population Counter.
    process(P) is
        variable count : integer;
    begin
        count := 0;
        for i in P'range loop
            if (P(i) = '1') then
                count := count + 1;
            end if;
        end loop;
        C <= std_logic_vector(to_unsigned(count, 4));
    end process;

end rtl;