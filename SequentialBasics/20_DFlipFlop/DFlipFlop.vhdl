library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is

    port(
        CLK                     : in std_logic;
        D                       : in std_logic;
        Q                       : out std_logic);

end DFlipFlop;

architecture rtl of DFlipFlop is

begin

    -- D Flip Flop.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            Q <= D;
        end if;
    end process;

end rtl;