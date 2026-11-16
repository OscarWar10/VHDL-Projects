library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM8x4_tb is

end RAM8x4_tb;

architecture sim of RAM8x4_tb is

    signal CLK_i : std_logic := '0';
    signal WE_i : std_logic;
    signal ADDR_i : std_logic_vector(2 downto 0);
    signal DATA_IN_i : std_logic_vector(3 downto 0);
    signal DATA_OUT_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.RAM8x4
    
        port map(
            CLK                         => CLK_i,
            WE                          => WE_i,
            ADDR                        => ADDR_i,
            DATA_IN                     => DATA_IN_i,
            DATA_OUT                    => DATA_OUT_i);
            
    CLK_i <= not CLK_i after 5 ns;
    
    main : process
    begin
        WE_i <= '0';                                                            -- Test case Read Enabled.
        for i in 0 to 7 loop
            ADDR_i <= std_logic_vector(to_unsigned(i, ADDR_i'length));                   -- Read all data.
            wait for 10 ns;
        end loop;
        
        WE_i <= '1';                                                            -- Test case Write Enabled.
        ADDR_i <= "001"; DATA_IN_i <= "0101";
        wait for 20 ns;
        ADDR_i <= "100"; DATA_IN_i <= "1010";
        wait for 20 ns;
        
        WE_i <= '0';
        for i in 0 to 7 loop
            ADDR_i <= std_logic_vector(to_unsigned(i, ADDR_i'length));                   -- Read again to test previous writes.
            wait for 10 ns;
        end loop;
    
        wait;                       -- Stop simulation.
    end process;

end sim;