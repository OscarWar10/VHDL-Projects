library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop_tb is

end TFlipFlop_tb;

architecture sim of TFlipFlop_tb is

    signal CLK_i : std_logic := '0';
    signal T_i : std_logic;
    signal Q_i : std_logic;
    
begin

    -- DUT: Device Under Test.
    DUT : entity work.TFlipFlop
    
        port map(
            CLK                 => CLK_i,
            T                   => T_i,
            Q                   => Q_i);
            
            
    CLK_i <= not CLK_i after 5 ns;
    
    

    main : process
    begin
        T_i <= '0';                     -- Stop toggle.
        wait for 10 ns;
        
        T_i <= '1';                     -- Toggle Q value.
        wait for 10 ns;
        
        T_i <= '0';                     -- Stop toggle.
        wait for 10 ns;
        
        T_i <= '1';                     -- Toggle Q value.
        wait for 10 ns;
        
        wait;                   -- Stop simulation.
    end process;

end sim;