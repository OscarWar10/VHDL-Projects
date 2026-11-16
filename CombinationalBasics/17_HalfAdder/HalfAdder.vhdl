library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is

    port(
        A               : in std_logic;
        B               : in std_logic;
        S               : out std_logic;
        C               : out std_logic);

end HalfAdder;

architecture rtl of HalfAdder is

begin

    -- Half Adder.
    S <= A xor B;
    C <= A and B;

end rtl;