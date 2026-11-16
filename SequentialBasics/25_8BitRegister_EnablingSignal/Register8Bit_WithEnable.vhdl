library ieee;
use ieee.std_logic_1164.all;

entity Register8Bit_WithEnable is

    port(
        CLK             : in std_logic;
        CE              : in std_logic;
        D               : in std_logic_vector(7 downto 0);
        Q               : out std_logic_vector(7 downto 0));

end Register8Bit_WithEnable;

architecture rtl of Register8Bit_WithEnable is

begin

    -- 8 Bit Register with Clock Enable signal.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (CE = '1') then
                Q <= D;
            end if;
        end if;
    end process;
    
end rtl;