library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RingCounter is
        
    port(
        CLK                 : in std_logic;
        RST                 : in std_logic;
        COUNT               : out std_logic_vector(3 downto 0));

end RingCounter;

architecture rtl of RingCounter is

    signal count_aux : std_logic_vector(3 downto 0);

begin

    -- Ring Counter.
    process(CLK, RST) is
    begin
        if (RST = '1') then
            count_aux <= "0001";
        elsif (CLK'event and CLK = '1') then
            count_aux <= count_aux(2 downto 0) & count_aux(3);  
        end if;
    end process;

    COUNT <= count_aux;

end rtl;