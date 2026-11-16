library ieee;
use ieee.std_logic_1164.all;

entity JKFlipFlop_tb is

end JKFlipFlop_tb;

architecture sim of JKFlipFlop_tb is

    signal CLK_i : std_logic := '0';
    signal J_i : std_logic;
    signal K_i : std_logic;
    signal Q_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.JKFlipFlop
    
        port map(
            CLK                     => CLK_i,
            J                       => J_i,
            K                       => K_i,
            Q                       => Q_i);
            
    
    CLK_i <= not CLK_i after 5 ns;
            
            
    main : process
    begin
        J_i <= '0'; K_i <= '1';                     -- Test case JK = "01" --> Q_t+1 = '0' expected.
        wait for 10 ns;
        
        J_i <= '1'; K_i <= '0';                     -- Test case JK = "10" --> Q_t+1 = '1' expected.
        wait for 10 ns;
        
        J_i <= '1'; K_i <= '1';                     -- Test case JK = "11" --> Q_t+1 = not Q_t expected.
        wait for 10 ns;
        
        J_i <= '0'; K_i <= '0';                     -- Test case JK = "00" --> Q_t+1 = 'Q_t' expected.
        wait for 10 ns;
        
        wait;                   -- Stop simulation.
    end process;
end sim;