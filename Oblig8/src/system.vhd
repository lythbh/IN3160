library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.seg7_pkg.all;

entity system is
    port(
        mclk         : in std_ulogic;
        reset        : in std_ulogic;

        SA, SB       : in std_ulogic;

        dir_synch_out: out std_ulogic;
        en_synch_out : out std_ulogic;

        c_out        : out std_ulogic;
        abcdefg_out  : out std_ulogic_vector(6 downto 0)
    );
end entity;

architecture structural of system is
    signal duty_cycle_sig     : std_ulogic_vector(7 downto 0);
    signal velocity_sig       : signed(7 downto 0);
    signal en_sig, dir_sig    : std_ulogic;
    signal SA_synch_sig, SB_synch_sig : std_ulogic;
    signal pos_inc_sig, pos_dec_sig   : std_ulogic;

    component self_test_module is
        port(
            mclk, reset  : in std_ulogic;
            duty_cycle   : out std_ulogic_vector(7 downto 0)
        );
    end component;

    component pulse_width_modulator is
        port(
            mclk, reset : in std_ulogic;
            duty_cycle  : in std_ulogic_vector(7 downto 0);
            dir, en     : out std_ulogic
        );
    end component;
    
    component output_synchronizer is
        port(
            mclk        : in std_ulogic;
            reset       : in std_ulogic;
            dir, en     : in std_ulogic;
            en_synch    : out std_ulogic;
            dir_synch   : out std_ulogic
        );
    end component;

    component input_synchronizer is
        port(
            mclk     : in std_ulogic;
            reset    : in std_ulogic;
            SA       : in std_ulogic;
            SB       : in std_ulogic;
            SA_synch : out std_ulogic;
            SB_synch : out std_ulogic
        );
    end component;

    component quadrature_decoder is
        port(
            mclk, reset : in std_ulogic;
            SA, SB      : in std_ulogic;
            pos_inc     : out std_ulogic;
            pos_dec     : out std_ulogic
        );
    end component;

    component velocity_reader is
        port(
            mclk      : in std_ulogic; 
            reset     : in std_ulogic; 
            pos_inc   : in std_ulogic;
            pos_dec   : in std_ulogic;
            velocity  : out signed(7 downto 0)
        );
    end component;

    component seg7ctrl is
        port(
            mclk      : in std_ulogic;
            reset     : in std_ulogic;
            d0        : in std_ulogic_vector(3 downto 0);
            d1        : in std_ulogic_vector(3 downto 0);
            abcdefg   : out std_ulogic_vector(6 downto 0);
            c         : out std_ulogic
        );
    end component;

begin
    DUT_self_test_module: self_test_module
        port map(
            mclk       => mclk,
            reset      => reset,
            duty_cycle => duty_cycle_sig
        );
    
    DUT_pulse_width_modulator: pulse_width_modulator
        port map(
            mclk       => mclk,
            reset      => reset,
            duty_cycle => duty_cycle_sig,
            dir        => dir_sig,
            en         => en_sig
        );

    DUT_output_sync: output_synchronizer
        port map (
            mclk      => mclk,
            reset     => reset,
            dir       => dir_sig,
            en        => en_sig,
            en_synch  => en_synch_out,
            dir_synch => dir_synch_out
        );

    DUT_input_synchronizer: input_synchronizer
        port map(
            mclk     => mclk,
            reset     => reset,
            SA       => SA,
            SB       => SB,
            SA_synch => SA_synch_sig,
            SB_synch => SB_synch_sig
        );

    DUT_quadrature_decoder: quadrature_decoder
        port map(
            mclk     => mclk,
            reset    => reset,
            SA       => SA_synch_sig,
            SB       => SB_synch_sig,
            pos_inc  => pos_inc_sig,
            pos_dec  => pos_dec_sig
        );

    DUT_velocity_reader: velocity_reader
        port map(
            mclk      => mclk,
            reset     => reset,
            pos_inc   => pos_inc_sig,
            pos_dec   => pos_dec_sig,
            velocity  => velocity_sig
        );

    DUT_seg7ctrl: seg7ctrl
        port map(
            mclk     => mclk,
            reset    => reset,
            d0       => std_ulogic_vector(velocity_sig(3 downto 0)),
            d1       => std_ulogic_vector(abs(velocity_sig(7 downto 4))),
            abcdefg  => abcdefg_out,
            c        => c_out
        );
end structural;