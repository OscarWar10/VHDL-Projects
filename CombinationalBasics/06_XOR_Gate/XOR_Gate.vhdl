library ieee;
use ieee.std_logic_1164.all;

entity XOR_Gate is
  
    port (
        A       : in std_logic;         -- Input A.
        B       : in std_logic;         -- Input B.
        Y       : out std_logic);       -- Output Y = A XOR B.

end XOR_Gate;

architecture rtl of XOR_Gate is

begin

    -- Evaluate XOR between A and B.
    Y <= A xor B;

end rtl;