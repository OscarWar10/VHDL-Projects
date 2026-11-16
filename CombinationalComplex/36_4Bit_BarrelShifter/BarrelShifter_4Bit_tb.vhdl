library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BarrelShifter_4Bit_tb is

end BarrelShifter_4Bit_tb;

architecture sim of BarrelShifter_4Bit_tb is

    signal DATA_IN_i : std_logic_vector(3 downto 0);
    signal SHIFT_i : std_logic_vector(1 downto 0);
    signal DIR_i : std_logic;
    signal DATA_OUT_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.BarrelShifter_4Bit
    
        port map(
            DATA_IN                         => DATA_IN_i,
            SHIFT                           => SHIFT_i,
            DIR                             => DIR_i,
            DATA_OUT                        => DATA_OUT_i);
            
            
            
    main : process
    begin
        -- Shift Left.
        DIR_i <= '0';
        
        DATA_IN_i <= "1001"; SHIFT_i <= "00";               -- Test Case 0 Shifts --> DATA_OUT = "1001" expected.
        wait for 10 ns;
        
        DATA_IN_i <= "1001"; SHIFT_i <= "01";               -- Test Case 1 Shift --> DATA_OUT = "0010" expected.
        wait for 10 ns;
        
        DATA_IN_i <= "1001"; SHIFT_i <= "10";               -- Test Case 2 Shifts --> DATA_OUT = "0100" expected.
        wait for 10 ns;
        
        DATA_IN_i <= "1001"; SHIFT_i <= "11";               -- Test Case 3 Shifts --> DATA_OUT = "1000" expected.
        wait for 10 ns;
        
        -- Shift Right.
        DIR_i <= '1';
        
        DATA_IN_i <= "1000"; SHIFT_i <= "00";               -- Test Case 0 Shifts --> DATA_OUT = "1000" expected.
        wait for 10 ns;
                
        DATA_IN_i <= "1000"; SHIFT_i <= "01";               -- Test Case 1 Shift --> DATA_OUT = "0100" expected.
        wait for 10 ns;
                
        DATA_IN_i <= "1000"; SHIFT_i <= "10";               -- Test Case 2 Shifts --> DATA_OUT = "0010" expected.
        wait for 10 ns;
                
        DATA_IN_i <= "1000"; SHIFT_i <= "11";               -- Test Case 3 Shifts --> DATA_OUT = "0001" expected.
        wait for 10 ns;
        
        wait;               -- Stop simulation.
    end process;

end sim;