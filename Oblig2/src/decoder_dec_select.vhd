library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture dec_select of decoder is

begin
    with SW select LD <=
    "1110" when "00",
    "1101" when "01",
    "1011" when "10",
    "0110" when "11",--endring 
    "0000" when others;
end dec_select;