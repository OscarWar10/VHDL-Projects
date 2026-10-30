library ieee;
use ieee.std_logic_1164.all;

entity MUX_2_1 is

    port(
        A           : in std_logic_vector(1 downto 0);
        SEL         : in std_logic;
        Y           : out std_logic);
        
end MUX_2_1;

architecture rtl of MUX_2_1 is

begin

    -- Combinational Multiplexor.
    Y <= A(0) when (SEL = '0') else A(1);

end rtl;