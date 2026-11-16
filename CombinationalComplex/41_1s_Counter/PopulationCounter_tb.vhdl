library ieee;
use ieee.std_logic_1164.all;

entity PopulationCounter_tb is

end PopulationCounter_tb;

architecture sim of PopulationCounter_tb is

    signal P_i : std_logic_vector(7 downto 0);
    signal C_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.PopulationCounter
    
        port map(
            P                           => P_i,
            C                           => C_i);
            
    
    main : process
    begin
        P_i <= "11110000";                                  -- C = "0100" = 4 expected.
        wait for 10 ns;
        
        P_i <= "00000000";                                  -- C = "0000" = 0 expected.
        wait for 10 ns;
        
        P_i <= "11111111";                                  -- C = "1000" = 8 expected.
        wait for 10 ns;
        
        P_i <= "11000111";                                  -- C = "0101" = 5 expected.
        wait for 10 ns;
    
        wait;                   -- Stop simulation.
    end process;


end sim;