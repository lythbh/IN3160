library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture dec_case of decoder is

begin
    process(SW)
    begin
        case SW is
            when "00" =>
                LD <= "1110";
            when "01" =>
                LD <= "1101";
            when "10" =>
                LD <= "1011";
            when "11" =>
                LD <= "0111";
            when others =>
                LD <= "0000";
        end case;
    end process;
end dec_case;