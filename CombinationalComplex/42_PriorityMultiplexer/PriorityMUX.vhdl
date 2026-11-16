library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PriorityMUX is

    port(
        A0                              : in std_logic_vector(3 downto 0);                      -- Least Priority.
        A1                              : in std_logic_vector(3 downto 0);
        A2                              : in std_logic_vector(3 downto 0);
        A3                              : in std_logic_vector(3 downto 0);                      -- Biggest Priority.
        REQ                             : in std_logic_vector(3 downto 0);
        SEL                             : out std_logic_vector(1 downto 0);
        VALID                           : out std_logic;                                        -- Asserted '1'.
        Y                               : out std_logic_vector(3 downto 0));

end PriorityMUX;

architecture rtl of PriorityMUX is

begin

    -- Priority MUX.
    process(A0, A1, A2, A3, REQ) is
        variable found : Boolean;
    begin
        found := False;
        
        -- Default Values To Avoid Latches.
        SEL <= "00";
        VALID <= '0';
        Y <= "0000";
        
        for i in REQ'range loop
            if ((REQ(i) = '1') and (found = False)) then
                SEL <= std_logic_vector(to_unsigned(i, 2));
                
                case i is
                    when 0 => Y <= A0;
                    when 1 => Y <= A1;
                    when 2 => Y <= A2;
                    when 3 => Y <= A3;
                    when others => Y <= (others => '0');
                end case;
                
                VALID <= '1';
                found := True;
            end if;
        end loop;
    end process;

end rtl;