library ieee;
use ieee.std_logic_1164.all;

entity ElevatorController is

    port(
        CLK                         : in std_logic;
        RST                         : in std_logic;
        BTN                         : in std_logic_vector(1 downto 0);              -- Button Floor 1; Button Floor 0.
        SEN                         : in std_logic_vector(1 downto 0);              -- Sensor Floor 1; Sensor Floor 0.
        M                           : out std_logic;                                -- Elevator´s Engine.
        P                           : out std_logic);                               -- Elevator´s Door.

end ElevatorController;

architecture rtl of ElevatorController is

    type fsm is (P0, MOVING, P1);
    signal act_state, next_state : fsm;

begin

    -- FSM Sequential Process. Store Actual State.
    process(CLK, RST) is
    begin
        if (RST = '1') then
            act_state <= P0;
        elsif (CLK'event and CLK = '1') then
            act_state <= next_state;
        end if;
    end process;
    
    --- FSM Combinational Process. Calculate Next State.
    process(act_state, BTN, SEN) is
    begin
        next_state <= act_state;
        case act_state is
            when P0 => if (BTN(1) = '1') then next_state <= MOVING; else next_state <= P0; end if;
            when MOVING =>
                next_state <= MOVING;
                if (SEN(1) = '1') then 
                    next_state <= P1;
                end if;
                if (SEN(0) = '1') then
                    next_state <= P0;
                end if;
            when P1 => if (BTN(0) = '1') then next_state <= MOVING; else next_state <= P1; end if;
            when others => next_state <= act_state;
        end case;
    end process;
    
    -- FSM Combinational Process. Calculate Output.
    process(act_state) is
    begin
        case act_state is
            when P0 =>                          -- Elevator Not Moving; Doors Opened.
                M <= '0'; P <= '0';
            when MOVING =>                      -- Elevator Moving; Doors Closed.
                M <= '1'; P <= '1';
            when P1 =>                          -- Elevator Not Moving; Doors Opened.
                M <= '0'; P <= '0';
            when others =>
                M <= '0'; P <= '0';
        end case;
    end process;

end rtl;