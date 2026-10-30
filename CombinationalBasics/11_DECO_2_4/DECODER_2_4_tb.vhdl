library ieee;
use ieee.std_logic_1164.all;

entity DECODER_2_4_tb is

end DECODER_2_4_tb;

architecture sim of DECODER_2_4_tb is

    signal A_i : std_logic_vector(1 downto 0);
    signal Y_i : std_logic_vector(3 downto 0);

begin

    -- Device Under Test (DUT).
    DUT : entity work.DECODER_2_4

        port map(
            A           => A_i,
            Y           => Y_i);

        
    
    main : process
    begin
        A_i <= "00";                -- Test case A = "00" --> Y = "0001" expected.
        wait for 10 ns;

        A_i <= "01";                -- Test case A = "01" --> Y = "0010" expected.
        wait for 10 ns;

        A_i <= "10";                -- Test case A = "10" --> Y = "0100" expected.
        wait for 10 ns;

        A_i <= "11";                -- Test case A = "11" --> Y = "1000" expected.
        wait for 10 ns;

        wait;               -- Stop simulation.
    end process;


end sim;