library ieee;
use ieee.std_logic_1164.all;

entity PriENCODER_8_3_tb is

end PriENCODER_8_3_tb;

architecture sim of PriENCODER_8_3_tb is

    signal A_i : std_logic_vector(7 downto 0);
    signal Y_i : std_logic_vector(2 downto 0);
begin

    -- Device Under Test (DUT).
    DUT : entity work.PriENCODER_8_3
    
        port map(
            A           => A_i,
            Y           => Y_i);
            
    -- Main process to test 
    main : process
    begin
        A_i <= "00100000";              -- Y = 5 expected.
        wait for 10 ns;
        
        A_i <= "01010010";              -- Y = 6 expected.
        wait for 10 ns;
        
        A_i <= "00000110";              -- Y = 2 expected.
        wait for 10 ns;        
        
        A_i <= "00000001";              -- Y = 0 expected.
        wait for 10 ns;
                
        A_i <= "11111111";              -- Y = 7 expected.
        wait for 10 ns;        
        wait;                   -- Stop simulation.
    end process;

end sim;