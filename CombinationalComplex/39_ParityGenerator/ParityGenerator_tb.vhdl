library ieee;
use ieee.std_logic_1164.all;

entity ParityGenerator_tb is

end ParityGenerator_tb;

architecture sim of ParityGenerator_tb is

    signal A_i : std_logic_vector(3 downto 0);
    signal Y_i : std_logic_vector(4 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.ParityGenerator
    
        port map(
            A                   => A_i,
            Y                   => Y_i);                            -- Y(0) indicates parity.
            
            
    main : process
    begin
        A_i <= "0011";                      -- Y = "00110" expected.
        wait for 10 ns;
        
        A_i <= "1110";                      -- Y = "11101" expected.
        wait for 10 ns;
        
        A_i <= "1111";                      -- Y = "11110" expected.
        wait for 10 ns;
        
        A_i <= "1000";                      -- Y = "10001" expected.
        wait for 10 ns;
    
        wait;               -- Stop simulation.
    end process;

end sim;