library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM8x4_tb is
    
end ROM8x4_tb;

architecture sim of ROM8x4_tb is

    signal CLK_i : std_logic := '0';
    signal ADDR_i : std_logic_vector(2 downto 0);
    signal DATA_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.ROM8x4
    
        port map(
            CLK                 => CLK_i,
            ADDR                => ADDR_i,
            DATA                => DATA_i);
            
    
    CLK_i <= not CLK_i after 5 ns;
    
    
    main : process
    begin
        for i in 0 to 7 loop
            ADDR_i <= std_logic_vector(to_unsigned(i, ADDR_i'length));                   -- Loop ROM directions and verify output data.
            wait for 20 ns;
        end loop;
        wait;               -- Stop simulation.
    end process;

end sim;