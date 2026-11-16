library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JohnsonCounter_tb is

end JohnsonCounter_tb;

architecture sim of JohnsonCounter_tb is

    signal CLK_i : std_logic := '0';
    signal RST_i : std_logic;
    signal COUNT_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.JohnsonCounter
    
        port map(
            CLK                 => CLK_i,
            RST                 => RST_i,
            COUNT               => COUNT_i);
            
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        RST_i <= '1';                       -- Reset count.
        wait for 10 ns;
            
        RST_i <= '0';                       -- Start counting.
        wait for 150 ns;
            
        RST_i <= '1';                       -- Reset count.
        wait for 10 ns;
        
        wait;                       -- Stop simulation.
    end process;

end sim;