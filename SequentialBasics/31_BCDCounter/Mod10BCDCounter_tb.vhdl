library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

entity Mod10BCDCounter_tb is
        
end Mod10BCDCounter_tb;

architecture rtl of Mod10BCDCounter_tb is

    signal CLK_i : std_logic := '0';
    signal RST_i : std_logic;
    signal COUNT_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.Mod10BCDCounter
    
        port map(
            CLK                     => CLK_i,
            RST                     => RST_i,
            COUNT                   => COUNT_i);
            
    
    CLK_i <= not CLK_i after 5 ns;
    
    main : process
    begin
        RST_i <= '1';
        wait for 10 ns;                        -- Count for 100 ns.
        
        RST_i <= '0';                           -- Reset count.
        wait for 150 ns;
        
        RST_i <= '1';                           -- Count again.
        wait for 30 ns;
    
        wait;                   -- Stop simulation.
    end process;

end rtl;