library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder_tb is

end HalfAdder_tb;

architecture sim of HalfAdder_tb is

    signal A_i : std_logic;
    signal B_i : std_logic;
    signal S_i : std_logic;
    signal C_i : std_logic;

begin
    
    -- DUT: Device Under Test.
    DUT : entity work.HalfAdder
    
        port map(
            A               => A_i,
            B               => B_i,
            S               => S_i,
            C               => C_i);


    main : process
    begin
        A_i <= '0'; B_i <= '0';             -- Test case AB = "00" --> S = '0'; C = '0' expected.
        wait for 2 ns;
        
        A_i <= '0'; B_i <= '1';             -- Test case AB = "01" --> S = '1'; C = '0' expected.
        wait for 2 ns;
                
        A_i <= '1'; B_i <= '0';             -- Test case AB = "10" --> S = '1'; C = '0' expected.
        wait for 2 ns;
                        
        A_i <= '1'; B_i <= '1';             -- Test case AB = "11" --> S = '0'; C = '1' expected.
        wait for 2 ns;
    
        wait;                   -- Stop simulation.
    end process;

end sim;