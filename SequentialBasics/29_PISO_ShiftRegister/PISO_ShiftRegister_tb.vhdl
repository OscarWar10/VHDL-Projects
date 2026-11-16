library ieee;
use ieee.std_logic_1164.all;

entity PISO_ShiftRegister_tb is

end PISO_ShiftRegister_tb;

architecture sim of PISO_ShiftRegister_tb is

    signal CLK_i : std_logic := '0';
    signal LOAD_i : std_logic;
    signal D_i : std_logic_vector(3 downto 0);
    signal Q_i : std_logic;

begin

    -- DUT: Device Under Test.
    DUT : entity work.PISO_ShiftRegister
    
        port map(
            CLK                         => CLK_i,
            LOAD                        => LOAD_i,
            D                           => D_i,
            Q                           => Q_i);
            
    
    CLK_i <= not CLK_i after 5 ns;
    
    main : process
    begin
        D_i <= "1010";
        LOAD_i <= '0';                          -- Test case Shift.
        wait for 40 ns;
        
        LOAD_i <= '1';                          -- Test case Load Data in parallel.
        wait for 20 ns;
        
        LOAD_i <= '0';                          -- Test case Shift.
        wait for 40 ns;
        
        wait;                   -- Stop simulation.
    end process;
    
end sim;