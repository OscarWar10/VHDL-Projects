library ieee;
use ieee.std_logic_1164.all;

entity NAND_Gate is
  
    port (
        A       : in std_logic;         -- Input A.
        B       : in std_logic;         -- Input B.
        Y       : out std_logic);       -- Output Y = A NAND B.

end NAND_Gate;

architecture rtl of NAND_Gate is

begin

    -- Evaluate NAND between A and B.
    Y <= A nand B;

end rtl;