library ieee;
use ieee.std_logic_1164.all;

entity CrossingTrafficLight_tb is

end CrossingTrafficLight_tb;

architecture sim of CrossingTrafficLight_tb is

    signal CLK_i : std_logic := '0';
    signal RST_i : std_logic;
    signal BTN_i : std_logic := '0';
    signal VEH_GYR_i : std_logic_vector(2 downto 0);
    signal PED_GR_i : std_logic_vector(1 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.CrossingTrafficLight
    
        port map(
            CLK                         => CLK_i,
            RST                         => RST_i,
            BTN                         => BTN_i,
            VEH_GYR                     => VEH_GYR_i,
            PED_GR                      => PED_GR_i);
            
            
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        RST_i <= '1';
        wait for 15 ns;
        RST_i <= '0';                           -- Wait And See Output Behaviour.
        wait for 90 ns;
        
        BTN_i <= '1';                           -- Pedestrian Requests Crossing.
        wait for 10 ns;
        BTN_i <= '0';
        
        wait for 390 ns;                        -- See All Sequence.
        
        BTN_i <= '1';                           -- Pedestrian Requests Crossing.
        wait for 10 ns;
        BTN_i <= '0';
    
        wait for 150 ns;                        -- See All Sequence.
    
        wait;                   -- Stop simulation.
    end process;

end sim;