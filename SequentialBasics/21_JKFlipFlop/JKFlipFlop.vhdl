library ieee;
use ieee.std_logic_1164.all;

entity JKFlipFlop is

    port(
        CLK                     : in std_logic;
        J                       : in std_logic;
        K                       : in std_logic;
        Q                       : out std_logic);

end JKFlipFlop;

architecture rtl of JKFlipFlop is

begin

    -- JK Flip Flop.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (J = '0' and K = '1') then                       -- Set Q = '0'.
                Q <= '0';
            elsif (J = '1' and K = '0') then                    -- Set Q = '1'.
                Q <= '1';
            elsif (J = '1' and K = '1') then                    -- Set Q = not Q.
                Q <= not Q;
            end if;
        end if;
    
    end process;

end rtl;