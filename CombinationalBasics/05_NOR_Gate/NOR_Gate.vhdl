library ieee;
use ieee.std_logic_1164.all;

entity NOR_Gate is
  
    port(
        A       : in std_logic;         -- Input A.
        B       : in std_logic;         -- Input B.
        Y       : out std_logic);       -- Output Y = A NOR B.

end NOR_Gate;

architecture rtl of NOR_Gate is

begin

    -- Evaluate NOR between A and B.
    Y <= A nor B;

end rtl;