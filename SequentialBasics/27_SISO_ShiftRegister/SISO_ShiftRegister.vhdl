library ieee;
use ieee.std_logic_1164.all;

entity SISO_ShiftRegister is

    port(
        CLK                     : in std_logic;
        D                       : in std_logic;
        Q                       : out std_logic);

end SISO_ShiftRegister;

architecture rtl of SISO_ShiftRegister is

    signal aux : std_logic_vector(3 downto 0) := "0000";                -- Auxiliar signal to store data.

begin

    -- SISO Shift Register.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            aux <= D & aux(3 downto 1);
            Q <= aux(0);
        end if;
    end process;

end rtl;