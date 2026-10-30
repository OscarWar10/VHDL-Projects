library ieee;
use ieee.std_logic_1164.all;

entity DECODER_3_8_tb is

end DECODER_3_8_tb;

architecture sim of DECODER_3_8_tb is

    signal A_i : std_logic_vector(2 downto 0);
    signal Y_i : std_logic_vector(7 downto 0);

begin

    -- Device Under Test (DUT).
    DUT : entity work.DECODER_3_8

        port map(
            A           => A_i,
            Y           => Y_i);

        
    
    main : process
    begin
        A_i <= "000";                -- Test case A = "000" --> Y = "00000001" expected.
        wait for 10 ns;

        A_i <= "001";                -- Test case A = "001" --> Y = "00000010" expected.
        wait for 10 ns;

        A_i <= "010";                -- Test case A = "010" --> Y = "00000100" expected.
        wait for 10 ns;

        A_i <= "011";                -- Test case A = "011" --> Y = "00001000" expected.
        wait for 10 ns;

        A_i <= "100";                -- Test case A = "100" --> Y = "00010000" expected.
        wait for 10 ns;

        A_i <= "101";                -- Test case A = "101" --> Y = "00100000" expected.
        wait for 10 ns;

        A_i <= "110";                -- Test case A = "110" --> Y = "01000000" expected.
        wait for 10 ns;

        A_i <= "111";                -- Test case A = "111" --> Y = "10000000" expected.
        wait for 10 ns;

        wait;               -- Stop simulation.
    end process;


end sim;