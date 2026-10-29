library ieee;
use ieee.std_logic_1164.all;

entity OR_Gate is
  
    port (
        A       : in std_logic;         -- Input A.
        B       : in std_logic;         -- Input B.
        Y       : out std_logic);       -- Output Y = A OR B.

end OR_Gate;

architecture rtl of OR_Gate is

begin

    -- Evaluate OR between A and B.
    Y <= A or B;

end rtl;