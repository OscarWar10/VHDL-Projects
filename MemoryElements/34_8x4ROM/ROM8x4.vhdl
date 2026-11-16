library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM8x4 is

    port(
        CLK                 : in std_logic;
        ADDR                : in std_logic_vector(2 downto 0);          -- 2^3 = 8 positions.
        DATA                : out std_logic_vector(3 downto 0));        -- Data 4 bits.
    
end ROM8x4;

architecture rtl of ROM8x4 is

    type rom_type is array (0 to (2**ADDR'length - 1)) of std_logic_vector(DATA'range);
    
    constant memory : rom_type := 
        (
            0   => "0000",
            1   => "0001",
            2   => "0010",
            3   => "0011",
            4   => "0100",
            5   => "0101",
            6   => "0110",
            7   => "0111"
        );

begin

    -- ROM Memory.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            DATA <= memory(to_integer(unsigned(ADDR)));
        end if;
    end process;

end rtl;