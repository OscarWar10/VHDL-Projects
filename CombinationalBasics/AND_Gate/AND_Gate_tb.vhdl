library ieee;
use ieee.std_logic_1164.all;

entity AND_Gate_tb is

end AND_Gate_tb;

architecture sim of AND_Gate_tb is

    signal A_i, B_i, Y_i : std_logic;

begin

    -- Device Under Test (DUT).
    DUT : entity work.AND_Gate

        port map(
            A           => A_i,
            B           => B_i,
            Y           => Y_i);
    


    -- Process to test all posible results.      
    main : process
    begin
        A_i <= '0'; B_i <= '0';             -- Test case 0 AND 0 --> 0 expected.
        wait for 10 ns;

        A_i <= '0'; B_i <= '1';             -- Test case 0 AND 1 --> 0 expected.
        wait for 10 ns;

        A_i <= '1'; B_i <= '0';             -- Test case 1 AND 0 --> 0 expected.
        wait for 10 ns;

        A_i <= '1'; B_i <= '1';             -- Test case 1 AND 1 --> 1 expected.
        wait for 10 ns;

        wait;               -- Stop simulation.
    end process;

end sim;