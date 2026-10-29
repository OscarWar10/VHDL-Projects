library ieee;
use ieee.std_logic_1164.all;

entity NOT_Gate_tb is

end NOT_Gate_tb;

architecture sim of NOT_Gate_tb is

    signal A_i, Y_i : std_logic;

begin

    -- Device Under Test (DUT).
    DUT : entity work.NOT_Gate

        port map(
            A           => A_i,
            Y           => Y_i);
    


    -- Process to test all posible results.      
    main : process
    begin
        A_i <= '0';                         -- Test case NOT 0 --> 1 expected.
        wait for 10 ns;

        A_i <= '1';                         -- Test case NOT 1 --> 0 expected.
        wait for 10 ns;

        wait;                               -- Stop simulation.
    end process;

end sim;