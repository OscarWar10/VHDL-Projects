library ieee;
use ieee.std_logic_1164.all;

entity SIPO_ShiftRegister_tb is

end SIPO_ShiftRegister_tb;

architecture sim of SIPO_ShiftRegister_tb is

    signal CLK_i : std_logic := '0';
    signal D_i : std_logic;
    signal Q_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.SIPO_ShiftRegister
    
        port map(
            CLK                         => CLK_i,
            D                           => D_i,
            Q                           => Q_i);
            
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        D_i <= '1';                                 -- Insert 1s into register.
        wait for 40 ns;
        
        D_i <= '0';                                 -- Insert 0s into register.
        wait for 40 ns;
    
        wait;                   -- Stop simulation.
    end process;

end sim;