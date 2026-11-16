library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Comparator4Bit is

    port(
        A           : in std_logic_vector(3 downto 0);
        B           : in std_logic_vector(3 downto 0);
        aGTb        : out std_logic;                            -- '1' if A > B.
        aLTb        : out std_logic;                            -- '1' if A < B.
        aEQb        : out std_logic);                           -- '1' if A = B.

end Comparator4Bit;

architecture rtl of Comparator4Bit is

begin

    -- Comparator.
    process(A, B) is
    begin
        aGTb <= '0'; aLTb <= '0'; aEQb <= '0';              -- Default values to avoid latches.
        if (unsigned(A) > unsigned(B)) then
            aGTb <= '1';
        elsif (unsigned(A) < unsigned(B)) then
            aLTb <= '1';
        else
            aEQb <= '1';
        end if;
    end process;

end rtl;