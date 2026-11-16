library ieee;
use ieee.std_logic_1164.all;

entity PISO_ShiftRegister is

    port(
        CLK                     : in std_logic;
        LOAD                    : in std_logic;
        D                       : in std_logic_vector(3 downto 0);
        Q                       : out std_logic);

end PISO_ShiftRegister;

architecture rtl of PISO_ShiftRegister is

    signal aux : std_logic_vector(3 downto 0) := "1111";                -- Auxiliar signal to store data.

begin

    -- PISO Shift Register.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (LOAD = '1') then                            -- Load all 4 bits into register.
                aux <= D;
            else                                            -- Shift and output bit(0).
                aux <= '0' & aux(3 downto 1);
            end if;
        end if;
    end process;
    
    Q <= aux(0);
    
end rtl;