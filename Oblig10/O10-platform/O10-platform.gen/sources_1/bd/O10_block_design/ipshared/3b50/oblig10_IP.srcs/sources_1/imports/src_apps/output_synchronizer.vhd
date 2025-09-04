library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity output_synchronizer is
    port(
        mclk        : in std_ulogic;
        reset       : in std_ulogic;
        en          : in std_ulogic;
        dir         : in std_ulogic;
        en_synch    : out std_ulogic;
        dir_synch   : out std_ulogic);
end entity;


architecture behavioral of output_synchronizer is
begin
    process(mclk) is
    begin
        if rising_edge(mclk) then
            if reset = '1' then
                en_synch  <= '0';
                dir_synch <= '0';
            else
                en_synch <= en;
                dir_synch <= dir;
            end if;
        end if;
    end process;
end behavioral;
