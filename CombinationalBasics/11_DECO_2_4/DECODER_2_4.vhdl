library ieee;
use ieee.std_logic_1164.all;

entity DECODER_2_4 is
    
    port(
        A           : in std_logic_vector(1 downto 0);
        Y           : out std_logic_vector(3 downto 0));

end DECODER_2_4;

architecture rtl of DECODER_2_4 is

begin

    -- Decoder 2:4.
    process(A) is
    begin
        case A is
            when "00" =>
                Y <= "0001";
            when "01" =>
                Y <= "0010";
            when "10" =>
                Y <= "0100";
            when "11" =>
                Y <= "1000";
            when others =>
                NULL;
        end case;
    end process;

end rtl;