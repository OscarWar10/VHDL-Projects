library ieee;
use ieee.std_logic_1164.all;

entity ParityGenerator is

    port(
        A                       : in std_logic_vector(3 downto 0);
        Y                       : out std_logic_vector(4 downto 0));

end ParityGenerator;

architecture rtl of ParityGenerator is

    signal p : std_logic;

begin

    -- Parity Generator.
    process(A) is
    begin
        p <= A(3) xor A(2) xor A(1) xor A(0);                   -- P = '0' even; P = '1' odd.
    end process;
    
    Y <= A & p;

end rtl;