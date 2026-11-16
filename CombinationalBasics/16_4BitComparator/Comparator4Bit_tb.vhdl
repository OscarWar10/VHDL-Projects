library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Comparator4Bit_tb is

end Comparator4Bit_tb;

architecture sim of Comparator4Bit_tb is

    signal A_i : std_logic_vector(3 downto 0);
    signal B_i : std_logic_vector(3 downto 0);
    signal aGTb_i : std_logic;
    signal aLTb_i : std_logic;
    signal aEQb_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.Comparator4Bit
    
        port map(
            A               => A_i,
            B               => B_i,
            aGTb            => aGTb_i,
            aLTb            => aLTb_i,
            aEQb            => aEQb_i);
            
    main : process
    begin
        A_i <= "0101"; B_i <= "0011";               -- Test case A > B --> 5 > 3.
        wait for 2 ns;
        
        A_i <= "1010"; B_i <= "1111";               -- Test case A < B --> 10 < 15.
        wait for 2 ns;
                
        A_i <= "1011"; B_i <= "1011";               -- Test case A = B --> 11 = 11.
        wait for 2 ns;
    
        wait;           -- Stop simulation.
    end process;
    
    
end sim;