library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ElevatorController_tb is

end ElevatorController_tb;

architecture sim of ElevatorController_tb is

    signal CLK_i : std_logic := '0';
    signal RST_i : std_logic;
    signal BTN_i : std_logic_vector(1 downto 0) := "00";
    signal SEN_i : std_logic_vector(1 downto 0) := "00";
    signal M_i : std_logic;
    signal P_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.ElevatorController
    
        port map(
            CLK                                 => CLK_i,
            RST                                 => RST_i,
            BTN                                 => BTN_i,
            SEN                                 => SEN_i,
            M                                   => M_i,
            P                                   => P_i);
            
    CLK_i <= not CLK_i after 5 ns;
    
    main : process
    begin
        RST_i <= '1';
        wait for 15 ns;
        RST_i <= '0';
        wait for 30 ns;
        
        for i in 2 downto 1 loop
            BTN_i <= std_logic_vector(to_unsigned(i, 2));                   -- Request Floor.
            wait for 30 ns;                                                 -- Simulate Time Travel Floor 0 --> Floor 1 or Floor 1 --> Floor 0.
            SEN_i <= std_logic_vector(to_unsigned(i, 2));                   -- Elevator Arrives Floor 1.
            wait for 50 ns;
            SEN_i <= "00";
        end loop;
        
        wait;                   -- Stop simulation.
    end process;

end sim;