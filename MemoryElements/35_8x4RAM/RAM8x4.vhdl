library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM8x4 is

    port(
        CLK                     : in std_logic;
        WE                      : in std_logic;                                 -- WE = '1' --> Write enabled; WE = '0' --> Write disabled.
        ADDR                    : in std_logic_vector(2 downto 0);              -- 2^3 = 8 positions.
        DATA_IN                 : in std_logic_vector(3 downto 0);              -- Data 4 bits.
        DATA_OUT                : out std_logic_vector(3 downto 0));            -- Data 4 bits.
    
end RAM8x4;

architecture rtl of RAM8x4 is

    type ram_type is array (0 to (2**ADDR'length - 1)) of std_logic_vector(DATA_OUT'range);
    signal ram : ram_type := (others => (others => '0'));                                       -- Signal storing RAM data.

begin

    -- RAM Memory.
    process(CLK) is
    begin
        if (CLK'event and CLK = '1') then
            if (WE = '0') then                                      -- Read Enabled.
                DATA_OUT <= ram(to_integer(unsigned(ADDR)));
            else                                                    -- Write Enabled.
                ram(to_integer(unsigned(ADDR))) <= DATA_IN;
            end if;
        end if;
    end process;

end rtl;