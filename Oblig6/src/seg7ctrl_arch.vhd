library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.seg7_pkg.all;
use work.count21_pkg.all;

-- Same as seg7ctrl_arch but bin2ssd_arch function instead of bin2ssd
entity seg7ctrl_arch is
    port(
      mclk      : in std_logic; --100MHz, positive flank
      reset     : in std_logic; --Asynchronous reset, active high
      d0        : in std_logic_vector(3 downto 0);
      d1        : in std_logic_vector(3 downto 0);
      abcdefg   : out std_logic_vector(6 downto 0);
      c         : out std_logic
    );
end entity seg7ctrl_arch;


architecture rtl of seg7ctrl_arch is
    -- I've chosen an 21-bit counter as I aim for a 50 Hz toggle, 
    -- which should be impossible for the human eye to detect.
    -- f = log(100MHz / 50)
    signal count_val   : std_logic_vector(20 downto 0) := (others => '0'); -- Counter value    
    signal c_reg       : std_logic := '0';
begin
    process (mclk, reset)
    begin
        if reset = '1' then
            count_val  <= (others => '0');
            c_reg      <= '0';

        elsif rising_edge(mclk) then

            count_val <= count21(count_val);
            if count_val(20) = '1' then 
                c_reg <= not c_reg;
            end if;

        end if;
    end process;
    abcdefg <= bin2ssd_arch(d0) when c_reg = '0' else bin2ssd_arch(d1);
    c <= c_reg;
end rtl;