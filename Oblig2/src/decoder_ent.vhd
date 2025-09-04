library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder is
    port(
        SW : in std_ulogic_vector(1 downto 0);
        LD : out std_ulogic_vector(3 downto 0)
    );
end decoder;