library ieee;
use ieee.std_logic_1164.all;

entity Register8Bit_WithEnable_tb is

end Register8Bit_WithEnable_tb;

architecture sim of Register8Bit_WithEnable_tb is

    signal CLK_i : std_logic := '0';
    signal CE_i : std_logic;
    signal D_i : std_logic_vector(7 downto 0);
    signal Q_i : std_logic_vector(7 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.Register8Bit_WithEnable
    
        port map(
            CLK                         => CLK_i,
            CE                          => CE_i,
            D                           => D_i,
            Q                           => Q_i);
            
    
    CLK_i <= not CLK_i after 5 ns;
    
    
    
    main : process
    begin
        CE_i <= '1';                                -- Test CE = '1' load new data --> Q = "10101010" expected.
        D_i <= "10101010";
        wait for 10 ns;
        
        D_i <= "11001100";                          -- Test CE = '1' load new data --> Q = "11001100" expected.
        wait for 10 ns;
        
        CE_i <= '0';                                -- Test CE = '0' hold previous data --> Q = "11001100" expected.
        D_i <= "00000001";
        wait for 10 ns;
        
        CE_i <= '1';                                -- Test CE = '1' load new data --> Q = "11111111" expected.
        D_i <= "11111111";
        wait for 10 ns;
        
        CE_i <= '0';                                -- Test CE = '0' hold previous data --> Q = "11111111" expected.
        D_i <= "00000000";
        wait for 10 ns;
    
        wait;                   -- Stop simulation.
    end process;
    
end sim;