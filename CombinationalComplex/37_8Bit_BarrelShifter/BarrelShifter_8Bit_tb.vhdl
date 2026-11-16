library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BarrelShifter_8Bit_tb is

end BarrelShifter_8Bit_tb;

architecture sim of BarrelShifter_8Bit_tb is

    signal DATA_IN_i : std_logic_vector(7 downto 0);
    signal SHIFT_i : std_logic_vector(2 downto 0);
    signal DIR_i : std_logic;
    signal DATA_OUT_i : std_logic_vector(7 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.BarrelShifter_8Bit
    
        port map(
            DATA_IN                         => DATA_IN_i,
            SHIFT                           => SHIFT_i,
            DIR                             => DIR_i,
            DATA_OUT                        => DATA_OUT_i);
            
            
            
    main : process
    begin
        -- Shift Left.
        DIR_i <= '0';
        
        DATA_IN_i <= "00010001"; SHIFT_i <= "000";                  -- Test Case 0 Shifts --> DATA_OUT = "0001 0001" expected.
        wait for 10 ns;
        
        DATA_IN_i <= "00010001"; SHIFT_i <= "010";                  -- Test Case 2 Shifts --> DATA_OUT = "0100 0100" expected.
        wait for 10 ns;
        
        DATA_IN_i <= "00010001"; SHIFT_i <= "100";                  -- Test Case 4 Shifts --> DATA_OUT = "0001 0000" expected.
        wait for 10 ns;
        
        DATA_IN_i <= "00010001"; SHIFT_i <= "111";                  -- Test Case 7 Shifts --> DATA_OUT = "1000 0000" expected.
        wait for 10 ns;
        
        -- Shift Right.
        DIR_i <= '1';
        
        DATA_IN_i <= "10011001"; SHIFT_i <= "000";                  -- Test Case 0 Shifts --> DATA_OUT = "1001 1001" expected.
        wait for 10 ns;
                
        DATA_IN_i <= "10011001"; SHIFT_i <= "010";                  -- Test Case 2 Shifts --> DATA_OUT = "0010 0110" expected.
        wait for 10 ns;
                
        DATA_IN_i <= "10011001"; SHIFT_i <= "100";                  -- Test Case 4 Shifts --> DATA_OUT = "0000 1001" expected.
        wait for 10 ns;
                
        DATA_IN_i <= "10011001"; SHIFT_i <= "111";                  -- Test Case 7 Shifts --> DATA_OUT = "0000 0001" expected.
        wait for 10 ns;
        
        wait;                       -- Stop simulation.
    end process;

end sim;