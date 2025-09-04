library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity input_synchronizer is
    port(
        mclk     : in std_ulogic;
        reset    : in std_ulogic;
        SA       : in std_ulogic;
        SB       : in std_ulogic;
        SA_synch : out std_ulogic;
        SB_synch : out std_ulogic);
end entity;


architecture behavioral of input_synchronizer is
    signal ffa : std_ulogic := '0'; -- SA flipflops
    signal ffb : std_ulogic := '0'; -- SB flipflops
begin
    process(mclk) is
    begin
        if rising_edge(mclk) then
            if reset = '1' then
                ffa <= '0';
                ffb <= '0';
                SB_synch <= '0';
                SA_synch <= '0';
            else
                ffa <= SA;
                ffb <= SB;

                SA_synch <= ffa;
                SB_synch <= ffb;
            end if;
        end if;
    end process;
end  behavioral;
