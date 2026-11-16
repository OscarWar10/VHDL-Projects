library ieee;
use ieee.std_logic_1164.all;

entity RCA_4Bit is

    generic(
        InitialCarry    : std_logic := '0');                            -- Default value = '0'. Initial entry carry for bit 0 stage.

    port(
        A               : in std_logic_vector(3 downto 0);
        B               : in std_logic_vector(3 downto 0);
        S               : out std_logic_vector(3 downto 0);             -- Sum A + B.
        C               : out std_logic);                               -- Carry.
    
end RCA_4Bit;

architecture rtl of RCA_4Bit is

    -- Intermediate carry signals needed to connect FullAdders.
    signal Cout_inter0 : std_logic;
    signal Cout_inter1 : std_logic;
    signal Cout_inter2 : std_logic;

begin

    -- FullAdder0 : Bit 0 (LSB).
    FA0 : entity work.FullAdder
        port map(
            A                   => A(0),
            B                   => B(0),
            Cin                 => InitialCarry,
            S                   => S(0),
            Cout                => Cout_inter0);
            
    -- FullAdder1 : Bit 1.
    FA1 : entity work.FullAdder
        port map(
            A                   => A(1),
            B                   => B(1),
            Cin                 => Cout_inter0,
            S                   => S(1),
            Cout                => Cout_inter1);
            
    -- FullAdder2 : Bit 2.
    FA2 : entity work.FullAdder
        port map(
            A                   => A(2),
            B                   => B(2),
            Cin                 => Cout_inter1,
            S                   => S(2),
            Cout                => Cout_inter2);
            
    -- FullAdder3 : Bit 3 (MSB).
    FA3 : entity work.FullAdder
        port map(
            A                   => A(3),
            B                   => B(3),
            Cin                 => Cout_inter2,
            S                   => S(3),
            Cout                => C);

end rtl;