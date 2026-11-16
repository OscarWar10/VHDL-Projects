library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PriorityMUX_tb is

end PriorityMUX_tb;

architecture sim of PriorityMUX_tb is

    signal A0_i, A1_i, A2_i, A3_i : std_logic_vector(3 downto 0);
    signal REQ_i : std_logic_vector(3 downto 0);
    signal SEL_i : std_logic_vector(1 downto 0);
    signal VALID_i : std_logic;
    signal Y_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.PriorityMUX
    
        port map(
            A0                                          => A0_i,
            A1                                          => A1_i,
            A2                                          => A2_i,
            A3                                          => A3_i,
            REQ                                         => REQ_i,
            SEL                                         => SEL_i,
            VALID                                       => VALID_i,
            Y                                           => Y_i);
            
    main : process
    begin
        A0_i <= "0001"; A1_i <= "0011"; A2_i <= "0111"; A3_i <= "1111";
        REQ_i <= "0001";                                                                -- Y = "0001"; SEL = "00"; VALID = '1' expected.
        wait for 10 ns;
        
        REQ_i <= "0101";                                                                -- Y = "0111"; SEL = "10"; VALID = '1' expected.
        wait for 10 ns;
        
        REQ_i <= "0011";                                                                -- Y = "0011"; SEL = "01"; VALID = '1' expected.
        wait for 10 ns;
        
        REQ_i <= "0000";                                                                -- Y = "0000"; SEL = "00"; VALID = '0' expected.
        wait for 10 ns;
        
        REQ_i <= "1111";                                                                -- Y = "1111"; SEL = "11"; VALID = '1' expected.
        wait for 10 ns;
        
        wait;                       -- Stop simulation.
    end process;

end sim;