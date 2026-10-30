library ieee;
use ieee.std_logic_1164.all;

entity XNOR_Gate is
  
    port(
        A       : in std_logic;         -- Input A.
        B       : in std_logic;         -- Input B.
        Y       : out std_logic);       -- Output Y = A XNOR B.

end XNOR_Gate;

architecture rtl of XNOR_Gate is

begin

    -- Evaluate XNOR between A and B.
    Y <= A xnor B;

end rtl;