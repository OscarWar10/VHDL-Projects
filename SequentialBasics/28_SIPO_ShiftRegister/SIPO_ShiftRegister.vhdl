library ieee;
use ieee.std_logic_1164.all;

entity SIPO_ShiftRegister is

    port(
        CLK                     : in std_logic;
        D                       : in std_logic;
        Q                       : out std_logic_vector(3 downto 0));

end SIPO_ShiftRegister;

architecture rtl of SIPO_ShiftRegister is

    signal aux : std_logic_vector(3 downto 0) := "0000";                -- Auxiliar signal to store data.

begin

    -- SIPO Shift Register.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            aux <= D & aux(3 downto 1);
        end if;
    end process;
    
    Q <= aux;
    
end rtl;