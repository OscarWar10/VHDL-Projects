library ieee;
use ieee.std_logic_1164.all;

entity ALU4Bit_tb is

end ALU4Bit_tb;

architecture sim of ALU4Bit_tb is

    signal A_i : std_logic_vector(3 downto 0);
    signal B_i : std_logic_vector(3 downto 0);
    signal OP_i : std_logic_vector(2 downto 0);
    signal ZC_i : std_logic_vector(1 downto 0);
    signal R_i : std_logic_vector(3 downto 0);

begin

    -- DUT: Device Under Test.
    DUT : entity work.ALU4Bit
    
        port map(
            A                               => A_i,
            B                               => B_i,
            OP                              => OP_i,
            ZC                              => ZC_i,
            R                               => R_i);
            
    main : process
    begin
        OP_i <= "000";                                          -- Test case Incrememnt: A + 1 --> R = "0000" and ZC = "11" expected..
        A_i <= "1111"; B_i <= "0000";
        wait for 10 ns;
        
        OP_i <= "001";                                          -- Test case Decrement: A - 1 --> R = "0100" and ZC = "00" expected.
        A_i <= "0101";
        wait for 10 ns;
        
        OP_i <= "010";                                          -- Test case Addition: A + B --> "0000" and ZC = "11" expected.
        A_i <= "1111"; B_i <= "0001";
        wait for 10 ns;
        
        OP_i <= "011";                                          -- Test case Subtraction: A - B --> "1001" and ZC = "00" expected.
        A_i <= "1010"; B_i <= "0001";
        wait for 10 ns;
        
        A_i <= "1010"; B_i <= "0101";
        
        OP_i <= "100";                                          -- Test case AND: A and B --> "0000" and ZC = "10" expected.
        wait for 10 ns;
        
        OP_i <= "101";                                          -- Test case OR: A or B --> "1111" and ZC = "00" expected.
        wait for 10 ns;
        
        OP_i <= "110";                                          -- Test case XOR: A xor B --> "1111" and ZC = "00" expected.
        wait for 10 ns;
        
        OP_i <= "111";                                          -- Test case NOT: not A --> "0101" and ZC = "00" expected.
        wait for 10 ns;
        
    
        wait;                   -- Stop simulation.
    end process;


end sim;