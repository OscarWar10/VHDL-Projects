library ieee;
use ieee.std_logic_1164.all;

entity Register4Bit is

    port(
        CLK             : in std_logic;
        D               : in std_logic_vector(3 downto 0);
        Q               : out std_logic_vector(3 downto 0));

end Register4Bit;

architecture rtl of Register4Bit is

begin

    -- 4 Bit Register.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            Q <= D;
        end if;
    end process;
    
end rtl;