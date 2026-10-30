library ieee;
use ieee.std_logic_1164.all;

entity AND_Gate is
    
    port (
        A       : in std_logic;         -- Input A.
        B       : in std_logic;         -- Input B.
        Y       : out std_logic);       -- Output Y = A AND B.

end AND_Gate;

architecture rtl of AND_Gate is

begin

    -- Evaluate AND between A and B.
    Y <= A and B;

end rtl;