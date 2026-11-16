library ieee;
use ieee.std_logic_1164.all;

entity ParityChecker_tb is

end ParityChecker_tb;

architecture sim of ParityChecker_tb is

    signal A_i : std_logic_vector(4 downto 0);
    signal ERROR_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.ParityChecker
    
        port map(
            A                       => A_i,
            ERROR                   => ERROR_i);
            
            
    main : process
    begin
        A_i <= "00110";                         -- ERROR = '0' expected.
        wait for 10 ns;
        
        A_i <= "11101";                         -- ERROR = '0' expected.
        wait for 10 ns;
        
        A_i <= "11110";                         -- ERROR = '0' expected.
        wait for 10 ns;
        
        A_i <= "10001";                         -- ERROR = '0' expected.
        wait for 10 ns;
        
        A_i <= "10101";                          -- ERROR = '1' expected.
        wait for 10 ns;
        
        A_i <= "10000";                         -- Error = '1' expected.
        wait for 10 ns;
        
        -- Two bits inverted. Error not detected. Sent A = "11110"; Received A = "11000"
        A_i <= "11000";
        wait for 10 ns;                         -- Error = '0' expected.
        wait;                   -- Stop simulation.
    end process;

end sim;