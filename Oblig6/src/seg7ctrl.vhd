library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.seg7_pkg.all;

entity seg7ctrl is
    port(
      mclk      : in std_logic; --100MHz, positive flank
      reset     : in std_logic; --Asynchronous reset, active high
      d0        : in std_logic_vector(3 downto 0);
      d1        : in std_logic_vector(3 downto 0);
      abcdefg   : out std_logic_vector(6 downto 0);
      c         : out std_logic
    );
end entity seg7ctrl;

architecture rtl of seg7ctrl is

    signal counter    : u_unsigned(20 downto 0); -- Counter value
    signal next_count : u_unsigned(20 downto 0);
    signal c_reg      : std_logic; -- To keep track of c values
begin
    process (mclk, reset)
    begin
        if reset = '1' then
            counter    <= (others => '0');
            c_reg      <= '0';

        elsif rising_edge(mclk) then
            counter <= next_count;
            if counter = 500000 then
                c_reg <= not c_reg; -- Toggling c
            end if;
        end if;
    end process;
    
    process (all)
    begin
        if counter = 500000 then
            next_count <= (others => '0');
        else 
            next_count <= counter + 1;
        end if;
    end process;
    
    -- Updating output according to c
    abcdefg <= bin2ssd(d0) when c_reg = '0' else bin2ssd(d1);
    c <= c_reg;
end rtl;