library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister4Bit is

    port(
        CLK                     : in std_logic;
        DIR                     : in std_logic;                             -- DIR = '0' --> Shift Left; DIR = '1' --> Shift Right.
        D                       : in std_logic;
        Q                       : out std_logic_vector(3 downto 0));

end ShiftRegister4Bit;

architecture rtl of ShiftRegister4Bit is

begin

    -- Configurable 4 Bit Shift Register.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (DIR = '0') then                         -- Shift Left
                Q <= Q(2 downto 0) & D;
            else                                        -- Shift Right.
                Q <= D & Q(3 downto 1);
            end if;
        end if;
    end process;

end rtl;