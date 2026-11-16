library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TrafficLight_tb is

end TrafficLight_tb;

architecture sim of TrafficLight_tb is

    signal CLK_i : std_logic := '0';
    signal RST_i : std_logic;
    signal GYR_i : std_logic_vector(2 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.TrafficLight
    
        port map(
            CLK                         => CLK_i,
            RST                         => RST_i,
            GYR                         => GYR_i);
            
            
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        RST_i <= '1';
        wait for 15 ns;
        RST_i <= '0';
        wait for 200 ns;                        -- Wait And See Output Behaviour.
    
        wait;                       -- Stop simulation.
    end process;

end sim;