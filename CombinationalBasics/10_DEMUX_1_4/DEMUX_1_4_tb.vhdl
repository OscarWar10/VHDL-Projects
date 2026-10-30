library ieee;
use ieee.std_logic_1164.all;

entity DEMUX_1_4_tb is

end DEMUX_1_4_tb;

architecture sim of DEMUX_1_4_tb is

    signal D_i : std_logic;
    signal SEL_i : std_logic_vector(1 downto 0);
    signal Y_i : std_logic_vector(3 downto 0);

begin

    DUT : entity work.DEMUX_1_4

        port map(
            D       => D_i,
            SEL     => SEL_i,
            Y       => Y_i);


    main : process
    begin
        D_i <= '1';
        
        SEL_i <= "00";                 -- Test case SEL = '00' --> Y = '1000' expected.
        wait for 10 ns;

        SEL_i <= "01";                 -- Test case SEL = '01' --> Y = '0100' expected.
        wait for 10 ns;

        SEL_i <= "10";                 -- Test case SEL = '10' --> Y = '0010' expected.
        wait for 10 ns;

        SEL_i <= "11";                 -- Test case SEL = '11' --> Y = '0001' expected.
        wait for 10 ns;

        wait;           -- Stop simulation.
    end process;

end sim;