library ieee;
use ieee.std_logic_1164.all;

entity RCA_4Bit_tb is
    
end RCA_4Bit_tb;

architecture sim of RCA_4Bit_tb is

    signal A_i : std_logic_vector(3 downto 0);
    signal B_i : std_logic_vector(3 downto 0);
    signal S_i : std_logic_vector(3 downto 0);
    signal C_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.RCA_4Bit
    
        port map(
            A                   => A_i,
            B                   => B_i,
            S                   => S_i,
            C                   => C_i);
            
            
    main : process
    begin
        A_i <= "0101"; B_i <= "0010";                       -- Test case A = "0101", B = "0010" --> S = "0111", C = '0' expected (5 + 2 = 7).
        wait for 10 ns;
        
        A_i <= "0111"; B_i <= "0001";                       -- Test case A = "0111", B = "0001" --> S = "1000", C = '0' expected (7 + 1 = 8).
        wait for 10 ns;
        
        A_i <= "1111"; B_i <= "1111";                       -- Test case A = "1111", B = "1111" --> S = "1110", C = '1' expected (15 + 15 = 30).
        wait for 10 ns;
    
        wait;               -- Stop simulation.
    end process;

end sim;