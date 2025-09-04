library ieee;
use ieee.std_logic_1164.all;

entity shiftn is
    generic(n : integer:= 1);
    port(
        reset, clock : in std_logic;
        indata       : in std_logic;
        outdata      : out std_logic_vector(n-1 downto 0)
    );
end entity shiftn;


architecture rtl of shiftn is

    component dff is
        port (
            rst_n, mclk  : in  std_logic;   -- Reset, Clock
            din          : in  std_logic;   -- Data in
            dout         : out std_logic    -- Data out
        );
    end component;
    
    signal shift_reg : std_logic_vector(n-1 downto 0);
    begin
    dff1 : dff port map(
        rst_n => reset,
        mclk => clock,
        din => indata,
        dout => shift_reg(0)
    );
    Gen: for i in 1 to n-1 generate
        dffi : dff port map(
            rst_n => reset,
            mclk => clock,
            din => shift_reg(i - 1),
            dout => shift_reg(i)
        );
    end generate Gen;
    
    outdata <= shift_reg;
    
end architecture rtl;