library ieee;
use ieee.std_logic_1164.all;

entity DEMUX_1_2_tb is

end DEMUX_1_2_tb;

architecture sim of DEMUX_1_2_tb is

    signal D_i, SEL_i : std_logic;
    signal Y_i : std_logic_vector(1 downto 0);

begin

    DUT : entity work.DEMUX_1_2

        port map(
            D       => D_i,
            SEL     => SEL_i,
            Y       => Y_i);


    main : process
    begin
        D_i <= '1';
        
        SEL_i <= '0';                 -- Test case SEL = '0' --> Y = '01' expected.
        wait for 10 ns;

        SEL_i <= '1';                 -- Test case SEL = '1' --> Y = '10' expected.
        wait for 10 ns;

        wait;           -- Stop simulation.
    end process;

end sim;