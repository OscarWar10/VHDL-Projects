library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop_tb is

end DFlipFlop_tb;

architecture sim of DFlipFlop_tb is

    signal CLK_i : std_logic := '0';
    signal D_i : std_logic;
    signal Q_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.DFlipFlop
    
        port map(
            CLK                         => CLK_i,
            D                           => D_i,
            Q                           => Q_i);


    CLK_i <= not CLK_i after 5 ns;
    
    
    
    main : process
        variable D_i_aux : std_logic := '0';
    begin
        for i in 1 to 10 loop
            D_i <= D_i_aux;
            D_i_aux := not D_i_aux;
            wait for 2 ns;
        end loop;
        
        wait;                   -- Stop simulation.
    end process;

end sim;