library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PriENCODER_8_3 is

    port(
        A               : in std_logic_vector(7 downto 0);
        Y               : out std_logic_vector(2 downto 0));

end PriENCODER_8_3;

architecture rtl of PriENCODER_8_3 is

begin

    -- Priority Encoder 8:3.
    process(A) is
        variable found : BOOLEAN;           -- Variable to indicate first '1' found.
    begin
        Y <= "000";                         -- Default value.
        found := False;
        
        for i in A'range loop
            if ((A(i) = '1') and (not found)) then
                Y <= std_logic_vector(to_unsigned(i,3));            -- Assign index to output Y.
                found := True;                                      -- Highest priority '1' found.
            end if;
        end loop;
    end process;

end rtl;