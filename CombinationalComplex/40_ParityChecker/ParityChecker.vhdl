library ieee;
use ieee.std_logic_1164.all;

entity ParityChecker is

    port(
        A                               : in std_logic_vector(4 downto 0);
        ERROR                           : out std_logic);                           -- Asserted '1'.

end ParityChecker;

architecture rtl of ParityChecker is

begin

    -- ParityChecker.
    process(A) is
        variable p : std_logic;
    begin
        p := A(4) xor A(3) xor A(2) xor A(1);
        if (p /= A(0)) then                                     -- Different parity.
            ERROR <= '1';
        else
            ERROR <= '0';
        end if;
    end process;

end rtl;