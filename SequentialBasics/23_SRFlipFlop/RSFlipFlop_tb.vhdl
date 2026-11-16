library ieee;
use ieee.std_logic_1164.all;

entity RSFlipFlop_tb is

end RSFlipFlop_tb;

architecture rtl of RSFlipFlop_tb is

    signal CLK_i : std_logic := '0';
    signal R_i : std_logic;
    signal S_i : std_logic;
    signal Q_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.RSFlipFlop
    
        port map(
            CLK                     => CLK_i,
            R                       => R_i,
            S                       => S_i,
            Q                       => Q_i);
            
    
    
    CLK_i <= not CLK_i after 5 ns;
            
            
    main : process
    begin
            R_i <= '0'; S_i <= '1';                     -- Test case RS = "01" --> Q_t+1 = '1' expected.
            wait for 10 ns;
            
            R_i <= '1'; S_i <= '0';                     -- Test case RS = "10" --> Q_t+1 = '0' expected.
            wait for 10 ns;
            
            R_i <= '0'; S_i <= '0';                     -- Test case RS = "00" --> Q_t+1 =  Q_t expected.
            wait for 10 ns;
            
            R_i <= '1'; S_i <= '1';                     -- Test case RS = "11" --> Invalid state.
            wait for 10 ns;
    
        wait;               -- Stop simulation.
    end process;

end rtl;