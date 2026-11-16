library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU4Bit is

    port(
        A                       : in std_logic_vector(3 downto 0);
        B                       : in std_logic_vector(3 downto 0);
        OP                      : in std_logic_vector(2 downto 0);
        ZC                      : out std_logic_vector(1 downto 0);                 -- Flags: ZERO CARRY asserted '1'.
        R                       : out std_logic_vector(3 downto 0));

end ALU4Bit;

architecture rtl of ALU4Bit is

    signal  result : unsigned(4 downto 0);                 -- 5 Bits.

begin

    -- ALU 4 Bit.
    process(A, B, OP) is
    begin
        case OP is
            when "000" =>                                                       -- Increment A.
                result <= ('0' & unsigned(A)) + 1;
            when "001" =>                                                       -- Decrement A.  
                result <= ('0' & unsigned(A)) - 1;
            when "010" =>                                                       -- Addition.
                result <= ('0' & unsigned(A)) + ('0' & unsigned(B));
            when "011" =>                                                       -- Subtraction.
                result <= ('0' & unsigned(A)) - ('0' & unsigned(B));
            when "100" =>                                                       -- AND.
                result <= '0' & unsigned(A and B);
            when "101" =>                                                       -- OR.
                result <= '0' & unsigned(A or B);
            when "110" =>                                                       -- XOR.
                result <= '0' & unsigned(A xor B);
            when "111" =>                                                       -- NOT A.
                result <= '0' & unsigned(not A);
            when others =>
                result <= (others => '0');                                      -- Invalid value.
        end case;
    end process;
    
    -- Zero Flag Detector.
    ZC(1) <= '1' when (result(3 downto 0)) = "0000" else '0';
        
    -- Carry Flag Detector.
    ZC(0) <= '1' when ((result(4) = '1') and (OP = "000" or OP = "010")) else '0';
    
    -- Assign Result.
    R <= std_logic_vector(result(3 downto 0));

end rtl;