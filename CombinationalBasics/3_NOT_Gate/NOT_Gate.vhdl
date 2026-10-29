library ieee;
use ieee.std_logic_1164.all;

entity NOT_Gate is
  
    port (
        A       : in std_logic;         -- Input A.
        Y       : out std_logic);       -- Output Y = NOT A.

end NOT_Gate;

architecture rtl of NOT_Gate is

begin

    -- Evaluate NOT of input A.
    Y <= not A;

end rtl;