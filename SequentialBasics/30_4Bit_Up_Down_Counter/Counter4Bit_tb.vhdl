library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter4Bit_tb is

end Counter4Bit_tb;

architecture sim of Counter4Bit_tb is

    signal CLK_i : std_logic := '0';
    signal RST_i : std_logic;
    signal C_i : std_logic;
    signal COUNT_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.Counter4Bit
    
        port map(
            CLK                     => CLK_i,
            RST                     => RST_i,
            C                       => C_i,
            COUNT                   => COUNT_i);
            
            
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        C_i <= '0';
    
        RST_i <= '1';                       -- Assert Reset.
        wait for 10 ns;
        
        RST_i <= '0';                       -- Deassert Reset --> Start Counting Up.
        wait for 170 ns;
        
        C_i <= '1';                         -- Start Counting Down.
        wait for 30 ns;
        
        RST_i <= '1';                       -- Assert Reset.
        
        wait;                   -- Stop simulation.
    end process;

end sim;