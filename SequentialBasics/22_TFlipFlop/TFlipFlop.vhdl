library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is

    port(
        CLK                     : in std_logic;
        T                       : in std_logic;
        Q                       : out std_logic);

end TFlipFlop;

architecture rtl of TFlipFlop is

    signal Q_aux : std_logic := '0';                -- Initial state Q = '0'.

begin

    -- T Flip Flop.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (T = '1') then
                Q_aux <= not Q_aux;
            end if;
        end if;
    end process;
    
    Q <= Q_aux;
    
end rtl;