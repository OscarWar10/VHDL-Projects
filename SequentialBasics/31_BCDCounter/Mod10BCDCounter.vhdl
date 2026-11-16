library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Mod10BCDCounter is
        
    port(
        CLK                 : in std_logic;
        RST                 : in std_logic;
        COUNT               : out std_logic_vector(3 downto 0));

end Mod10BCDCounter;

architecture rtl of Mod10BCDCounter is

    signal count_aux : unsigned(3 downto 0);

begin

    -- Mod N Counter.
    process(CLK, RST) is
    begin
        if (RST = '1') then
            count_aux <= (others => '0');
        elsif (CLK'event and CLK = '1') then
            count_aux <= count_aux + 1;
            if (count_aux = 9) then
                count_aux <= (others => '0');
            end if;
        end if;
    end process;
    
    COUNT <= std_logic_vector(count_aux);

end rtl;