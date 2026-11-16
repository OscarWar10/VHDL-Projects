library ieee;
use ieee.std_logic_1164.all;

entity RSFlipFlop is

    port(
        CLK                     : in std_logic;
        R                       : in std_logic;
        S                       : in std_logic;
        Q                       : out std_logic);

end RSFlipFlop;

architecture rtl of RSFlipFlop is

begin

    -- RS Flip Flop.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (R = '0' and S = '1') then                       -- Set Q = '1'.
                Q <= '1';
            elsif (R = '1' and S = '0') then                    -- Reset Q = '0'.
                Q <= '0';
            end if;
            -- Invalid state R = '1', S = '1'.
        end if;
    
    end process;

end rtl;