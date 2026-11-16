library ieee;
use ieee.std_logic_1164.all;

entity ShiftRegister4Bit_tb is

end ShiftRegister4Bit_tb;

architecture sim of ShiftRegister4Bit_tb is

    signal CLK_i : std_logic := '0';
    signal DIR_i : std_logic;
    signal D_i : std_logic;
    signal Q_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.ShiftRegister4Bit
    
        port map(
            CLK                         => CLK_i,
            DIR                         => DIR_i,
            D                           => D_i,
            Q                           => Q_i);
            
            
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        DIR_i <= '0';                               -- Test case Shift Left.
        D_i <= '1';
        wait for 40 ns;
        
        DIR_i <= '1';                               -- Test case Shift Right.
        D_i <= '0';
        wait for 40 ns;
    
        wait;                       -- Stop simulation.
    end process;

end sim;