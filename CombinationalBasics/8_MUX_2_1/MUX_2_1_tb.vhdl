library ieee;
use ieee.std_logic_1164.all;

entity MUX_2_1_tb is

end MUX_2_1_tb;

architecture sim of MUX_2_1_tb is

    signal A_i : std_logic_vector(1 downto 0);
    signal SEL_i : std_logic;
    signal Y_i : std_logic;
begin

    DUT : entity work.MUX_2_1
        
        port map(
            A           => A_i,
            SEL         => SEL_i,
            Y           => Y_i);
            
    main : process
    begin
        -- Test cases SEL = '0'.
        A_i <= "00"; SEL_i <= '0';              -- Y = '0' expected.
        wait for 10 ns;
        
        A_i <= "01"; SEL_i <= '0';              -- Y = '1' expected.
        wait for 10 ns;
                     
        -- Test cases SEL = '1'.                
        A_i <= "10"; SEL_i <= '1';              -- Y = '1' expected.
        wait for 10 ns;
                
        A_i <= "11"; SEL_i <= '1';              -- Y = '1' expected.
        wait for 10 ns;
    
        wait;               -- Stop simulation.
    end process;

end sim;