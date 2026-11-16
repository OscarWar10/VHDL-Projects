library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TrafficLight is

    port(
        CLK                             : in std_logic;
        RST                             : in std_logic;                                 -- Asserted '1'.
        GYR                             : out std_logic_vector(2 downto 0));            -- GREEN YELLOW RED.

end TrafficLight;

architecture rtl of TrafficLight is

    -- CLK Pulses For Each State
    constant GREEN_TIME : integer := 10;
    constant YELLOW_TIME : integer := 3;
    constant RED_TIME : integer := 8;

    type fsm is (GREEN, YELLOW, RED);
    signal act_state, next_state : fsm;
    
    signal count : unsigned(3 downto 0);                            -- 4 Bits For Worst Scenario 10 CLK Pulses.
    signal reset_aux : std_logic;                                   -- Signal To Reset Counter.

begin

    -- FSM Sequential Process. Store Actual State.
    process(CLK, RST) is
    begin
        if (RST = '1') then
            act_state <= GREEN;
        elsif(CLK'event and CLK = '1') then
            act_state <= next_state;
        end if;
    end process;
    
    -- FSM Combinational Process. Calculate Next State.
    process(act_state, count) is
    begin
        next_state <= act_state;
        reset_aux <= '0';
        case act_state is
            when GREEN =>
                if (count = GREEN_TIME - 1) then next_state <= YELLOW; reset_aux <= '1'; else next_state <= GREEN; end if;
            when YELLOW =>
                if (count = YELLOW_TIME - 1) then next_state <= RED; reset_aux <= '1'; else next_state <= YELLOW; end if;
            when RED =>
                if (count = RED_TIME - 1) then next_state <= GREEN; reset_aux <= '1'; else next_state <= RED; end if;
            when others =>
                next_state <= act_state; reset_aux <= '0';
        end case;
    end process;
    
    -- FSM Combinational Process. Calculate Output.
    process(act_state) is
    begin
        case act_state is
            when GREEN =>
                GYR <= "100";
            when YELLOW =>
                GYR <= "010";
            when RED =>
                GYR <= "001";
            when others =>
                GYR <= "000";                           -- All Colors Off.
        end case;
    end process;
    
    -- CLK Counter.
    process(CLK, RST) is
    begin
        if (RST = '1') then
            count <= (others => '0');                            -- Reset To 0.
        elsif (CLK'event and CLK = '1') then
            if (reset_aux = '1') then
                count <= (others => '0');                        -- Reset To 0.
            else
                count <= count + 1;
            end if;
        end if;
    end process;

end rtl;