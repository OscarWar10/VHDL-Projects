library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CrossingTrafficLight is

    port(
        CLK                                 : in std_logic;
        RST                                 : in std_logic;
        BTN                                 : in std_logic;
        VEH_GYR                             : out std_logic_vector(2 downto 0);                 -- Vehicle GREEN YELLOW RED.
        PED_GR                              : out std_logic_vector(1 downto 0));                -- Pedestrian GREEN RED.

end CrossingTrafficLight;

architecture rtl of CrossingTrafficLight is

    -- CLK Pulses For Each State Except NORMAL.
    constant WARNING_TIME : integer := 3;
    constant STOP_TIME : integer := 7;
    constant CROSSING_TIME : integer := 10;
    constant RESUME_TIME : integer := 5;
    
    type fsm is (NORMAL, WARNING, STOP, CROSSING, RESUME);
    signal act_state, next_state : fsm;
    
    signal count : unsigned(3 downto 0);                                -- 4 Bits For Worst Case Scenario 10 CLK Pulses.
    signal reset_aux : std_logic;                       -- Signal To Reset Counter.

begin

    -- FSM Sequential Process. Store Actual State. 
    process(CLK, RST) is
    begin
        if (RST = '1') then
            act_state <= RESUME;
        elsif (CLK'event and CLK = '1') then
            act_state <= next_state;
        end if;
    end process;
    
    -- FSM Combinational Process. Calculate Next State.
    process(act_state, BTN, count) is
    begin
        next_state <= act_state;
        reset_aux <= '0';
        
        case act_state is
            when NORMAL =>
                if (BTN = '1') then next_state <= WARNING; reset_aux <= '1'; else next_state <= NORMAL; end if;
            when WARNING =>
                if (count = WARNING_TIME - 1) then next_state <= STOP; reset_aux <= '1'; else next_state <= WARNING; end if;
            when STOP =>
                if (count = STOP_TIME - 1) then next_state <= CROSSING; reset_aux <= '1'; else next_state <= STOP; end if;
            when CROSSING =>
                if (count = CROSSING_TIME - 1) then next_state <= RESUME; reset_aux <= '1'; else next_state <= CROSSING; end if;
            when RESUME =>
                if (count = RESUME_TIME - 1) then next_state <= NORMAL; reset_aux <= '1'; else next_state <= RESUME; end if;
            when others =>
                next_state <= act_state; reset_aux <= '0';
        end case;
    end process;
    
    -- FSM Combinational Process. Calculate Output.
    process(act_state) is
    begin
        case act_state is
            when NORMAL =>
                VEH_GYR <= "100"; PED_GR <= "01";
            when WARNING =>
                VEH_GYR <= "010"; PED_GR <= "01";
            when STOP =>
                VEH_GYR <= "001"; PED_GR <= "01";
            when CROSSING =>
                VEH_GYR <= "001"; PED_GR <= "10";
            when RESUME =>
                VEH_GYR <= "001"; PED_GR <= "01";
            when others =>
                VEH_GYR <= "000"; PED_GR <= "00";                   -- All Colors Off.
        end case;
    end process;
    
    -- CLK Counter.
    process(CLK, RST) is
    begin
        if (RST = '1') then                                     -- Reset Count To 0.
            count <= (others => '0');
        elsif (CLK'event and CLK = '1') then
            if (reset_aux = '1') then                           -- Reset Count To 0.
                count <= (others => '0');
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    
end rtl;