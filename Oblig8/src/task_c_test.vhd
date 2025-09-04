library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity task_c_test is
    port (
        mclk  : in std_ulogic;
        reset : in std_ulogic;
        dir   : out std_ulogic;
        en    : out std_ulogic
    );
end entity;

architecture structural of task_c_test is
    signal duty_cycle : std_ulogic_vector(7 downto 0);
    signal en_synch  : std_ulogic;
    signal dir_synch : std_ulogic;

    component self_test_module is
        port(
            mclk, reset : in std_ulogic;
            duty_cycle   : out std_ulogic_vector(7 downto 0));
    end component;

    component pulse_width_modulator is
        port(
            mclk, reset : in std_ulogic;
            duty_cycle   : in std_ulogic_vector(7 downto 0);
            dir, en     : out std_ulogic);
    end component;
    
    component output_synchronizer is
        port(
            mclk, reset : in std_logic;
            dir, en     : in std_ulogic;
            en_synch    : out std_ulogic;
            dir_synch   : out std_ulogic);
    end component;

begin
    test_self_test_module: self_test_module
        port map(
            mclk      => mclk,
            reset     => reset,
            duty_cycle => duty_cycle
        );
    
    test_pulse_width_modulator: pulse_width_modulator
        port map(
            mclk      => mclk,
            reset     => reset,
            duty_cycle => duty_cycle,
            dir       => dir,
            en        => en
        );

    test_output_sync: output_synchronizer
        port map (
            mclk      => mclk,
            reset     => reset,
            dir       => dir,
            en        => en,
            en_synch  => en_synch,
            dir_synch => dir_synch
        );
end structural;
