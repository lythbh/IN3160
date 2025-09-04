library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.seg7_pkg.all;
use work.count21_pkg.all;

-- Wrapping it all up with components for seg7ctrl_arch and self_test_unit
entity self_test_system is
    port(
        mclk        : in std_logic;
        reset       : in std_logic;
        c_sys       : out std_logic;
        abcdefg_sys : out std_logic_vector(6 downto 0)
    );
end entity self_test_system;

architecture rtl of self_test_system is
    signal d0, d1  : std_logic_vector(3 downto 0);

    component self_test_unit is
        port(
            mclk   : in std_logic;
            reset  : in std_logic;
            d0, d1 : out std_logic_vector(3 downto 0)
        );
    end component;

    component seg7ctrl_arch is
        port(
            mclk    : in std_logic;
            reset   : in std_logic;
            d0      : in std_logic_vector(3 downto 0);
            d1      : in std_logic_vector(3 downto 0);
            abcdefg : out std_logic_vector(6 downto 0);
            c       : out std_logic
        );
    end component;

begin
    DUT_self_test_unit: self_test_unit
        port map(
            mclk   => mclk,
            reset  => reset,
            d0     => d0,
            d1     => d1
        );
        
    DUT_seg7ctrl_arch: seg7ctrl_arch
        port map(
            mclk     => mclk,  
            reset    => reset,  
            d0       => d0,
            d1       => d1,
            abcdefg  => abcdefg_sys,
            c        => c_sys
        );
end architecture rtl;