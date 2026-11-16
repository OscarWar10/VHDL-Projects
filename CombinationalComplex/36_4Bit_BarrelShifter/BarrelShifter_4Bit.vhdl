library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BarrelShifter_4Bit is

    port(
        DATA_IN                         : in std_logic_vector(3 downto 0);
        SHIFT                           : in std_logic_vector(1 downto 0);              -- Number Of Shift Positions.
        DIR                             : in std_logic;                                 -- DIR = '0' --> Shift Left; DIR = '1' --> Shift Right.
        DATA_OUT                        : out std_logic_vector(3 downto 0));

end BarrelShifter_4Bit;

architecture rtl of BarrelShifter_4Bit is

begin

    -- Barrel Shifter 4 Bits.
    process(DATA_IN, SHIFT, DIR) is
        variable shifts : integer;                                                  -- Convert Number of Shifts to Integer.
        variable data_out_aux : std_logic_vector(3 downto 0);
    begin
        shifts := to_integer(unsigned(SHIFT));
        data_out_aux := DATA_IN;
        
        for i in 1 to shifts loop
            if (DIR = '0') then                                             -- Shift Left.
                data_out_aux := data_out_aux(2 downto 0) & '0';
            else                                                            -- Shift Right.
                data_out_aux := '0' & data_out_aux(3 downto 1);
            end if;
        end loop;
        DATA_OUT <= data_out_aux;
    end process;

end rtl;