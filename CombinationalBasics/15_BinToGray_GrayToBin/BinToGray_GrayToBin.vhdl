library ieee;
use ieee.std_logic_1164.all;

entity BinToGray_GrayToBin is

    generic(
        N           : integer := 4);

    port (
        SEL         : in std_logic;                                 -- '0' = Binary to Gray; '1' = Gray to Binary.
        A           : in std_logic_vector(N - 1 downto 0);
        Y           : out std_logic_vector(N - 1 downto 0));

end BinToGray_GrayToBin;

architecture rtl of BinToGray_GrayToBin is

begin

    -- Module to execute conversion.
    process(A, SEL) is
        -- Variable to mantain intermediate binary value.
        variable binInter : std_logic_vector(N - 1 downto 0);
    begin
        if (SEL = '0') then                             -- Binary to Gray.
            Y(N - 1) <= A(N - 1);                       -- MSB Bin = MSB Gray.
            for i in N - 2 downto 0 loop
                Y(i) <= A(i + 1) xor A(i);
            end loop;
        else                                            -- Gray to Binary.
            for i in A'range loop
                if (i = N - 1) then                     -- MSB Gray = MSB Bin.
                    binInter(i) := A(i);
                else
                    binInter(i) := binInter(i + 1) xor A(i);
                end if;
            end loop;
            Y <= binInter;
        end if;
    end process;
end rtl;