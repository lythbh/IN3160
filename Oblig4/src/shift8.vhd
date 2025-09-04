library ieee;
use ieee.std_logic_1164.all;

entity shift8 is
    port(
        reset, clock : in std_logic;
        indata       : in std_logic;
        outdata      : out std_logic_vector(7 downto 0)
    );
end entity shift8;


architecture rtl of shift8 is

    component dff is
        port (
            rst_n, mclk  : in  std_logic;   -- Reset, Clock
            din          : in  std_logic;   -- Data in
            dout         : out std_logic    -- Data out
        );
    end component;
    
    signal shift_reg : std_logic_vector(7 downto 0);
    begin
    dff1 : dff port map(
        rst_n => reset,
        mclk => clock,
        din => indata,
        dout => shift_reg(0)
    );
    Gen: for i in 1 to 7 generate
        dffi : dff port map(
            rst_n => reset,
            mclk => clock,
            din => shift_reg(i - 1),
            dout => shift_reg(i)
        );
    end generate Gen;
    
    outdata <= shift_reg;
    
end architecture rtl;