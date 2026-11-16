library ieee;
use ieee.std_logic_1164.all;

entity BinToGray_GrayToBin_tb is

    generic(
        N_i           : integer := 4);

end BinToGray_GrayToBin_tb;

architecture sim of BinToGray_GrayToBin_tb is

    signal SEL_i : std_logic;
    signal A_i : std_logic_vector(N_i - 1 downto 0);
    signal Y_i : std_logic_vector(N_i - 1 downto 0); 
    
begin

    -- DUT: Device Under Test.
    DUT : entity work.BinToGray_GrayToBin
    
        generic map(
            N                   => N_i)
            
        port map(
            SEL                 => SEL_i,
            A                   => A_i,
            Y                   => Y_i);



    main : process 
    begin
        SEL_i <= '0';                       -- Test case SEL = '0' --> Binary to Gray.
        
        A_i <= "1010";                       -- Y = "1111" expected.
        wait for 2 ns;
        
        A_i <= "0100";                       -- Y = "0110" expected.
        wait for 2 ns;
        
        SEL_i <= '1';                       -- Test case SEL = '1' --> Gray to Binary.
        
        A_i <= "0110";                       -- Y = "0100" expected.
        wait for 2 ns;
                
        A_i <= "1111";                       -- Y = "1010" expected.
        wait for 2 ns;
    
        wait;               -- Stop simulation.
    end process;
end sim;