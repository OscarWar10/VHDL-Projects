library ieee;
use ieee.std_logic_1164.all;

entity FullAdder_tb is

end FullAdder_tb;

architecture sim of FullAdder_tb is

    signal A_i : std_logic;
    signal B_i : std_logic;
    signal Cin_i : std_logic;
    signal S_i : std_logic;
    signal Cout_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.FullAdder
    
        port map(
            A                   => A_i,
            B                   => B_i,
            Cin                 => Cin_i,
            S                   => S_i,
            Cout                => Cout_i);
            
            
            
    main : process
    begin
        A_i <= '0'; B_i <= '0'; Cin_i <= '0';           -- Test case ABCin = "000" --> SCout = "00" expected.
        wait for 2 ns;
        
        A_i <= '0'; B_i <= '0'; Cin_i <= '1';           -- Test case ABCin = "001" --> SCout = "10" expected.        
        wait for 2 ns;
        
        A_i <= '0'; B_i <= '1'; Cin_i <= '0';           -- Test case ABCin = "010" --> SCout = "10" expected.
        wait for 2 ns;
        
        A_i <= '0'; B_i <= '1'; Cin_i <= '1';           -- Test case ABCin = "011" --> SCout = "01" expected.
        wait for 2 ns;
        
        A_i <= '1'; B_i <= '0'; Cin_i <= '0';           -- Test case ABCin = "100" --> SCout = "10" expected.
        wait for 2 ns;
        
        A_i <= '1'; B_i <= '0'; Cin_i <= '1';           -- Test case ABCin = "101" --> SCout = "01" expected.
        wait for 2 ns;
        
        A_i <= '1'; B_i <= '1'; Cin_i <= '0';           -- Test case ABCin = "110" --> SCout = "01" expected.
        wait for 2 ns;
        
        A_i <= '1'; B_i <= '1'; Cin_i <= '1';           -- Test case ABCin = "111" --> SCout = "11" expected.
        wait for 2 ns;
        
        wait;                   -- Stop simulation.
    end process;
    
end sim;