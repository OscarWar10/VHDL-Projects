library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JohnsonCounter is
        
    port(
        CLK                 : in std_logic;
        RST                 : in std_logic;
        COUNT               : out std_logic_vector(3 downto 0));

end JohnsonCounter;

architecture rtl of JohnsonCounter is

    signal count_aux : std_logic_vector(3 downto 0);

begin

    -- Johnson Counter.
    process(CLK, RST) is
    begin
        if (RST = '1') then
            count_aux <= (others => '0');
        elsif (CLK'event and CLK = '1') then
            count_aux <= count_aux(2 downto 0) & not count_aux(3);
        end if;
    end process;
    
    COUNT <= count_aux;

end rtl;