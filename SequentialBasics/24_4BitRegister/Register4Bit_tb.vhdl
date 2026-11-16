library ieee;
use ieee.std_logic_1164.all;

entity Register4Bit_tb is

end Register4Bit_tb;

architecture rtl of Register4Bit_tb is

    signal CLK_i : std_logic := '0';
    signal D_i : std_logic_vector(3 downto 0);
    signal Q_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.Register4Bit
    
        port map(
            CLK                         => CLK_i,
            D                           => D_i,
            Q                           => Q_i);

    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        D_i <= "0000";                  -- Store value "0000" --> Q = "0000" expected.
        wait for 10 ns;
        
        D_i <= "0010";                  -- Store value "0010" --> Q = "0010" expected.
        wait for 10 ns;
        
        D_i <= "0100";                  -- Store value "0100" --> Q = "0100" expected.
        wait for 10 ns;
        
        D_i <= "1000";                  -- Store value "1000" --> Q = "1000" expected.
        wait for 10 ns;
    
        wait;                   -- Stop simulation.
    end process;


end rtl;