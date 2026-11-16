library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SevenSegment_tb is

end SevenSegment_tb;

architecture sim of SevenSegment_tb is

    signal A_i : std_logic_vector(3 downto 0);
    signal Y_i : std_logic_vector(6 downto 0);
    
begin
    
    -- Device Under Test (DUT).
    DUT : entity work.SevenSegment
        
        port map(
            A           => A_i,
            Y           => Y_i);
            
    -- Process to test all possible cases.
    main : process is
    begin
        for i in 0 to 10 loop                       -- Loop to see what segments turn ON.  
            A_i <= std_logic_vector(to_unsigned(i, 4));
            wait for 2 ns;
        end loop;
        wait;                       -- Stop simulation.
    end process;

end sim;