-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Tue Apr 29 13:26:33 2025
-- Host        : peregrin.ifi.uio.no running 64-bit unknown
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ O10_block_design_system_0_0_stub.vhdl
-- Design      : O10_block_design_system_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    SA : in STD_LOGIC;
    SB : in STD_LOGIC;
    duty_cycle : in STD_LOGIC_VECTOR ( 7 downto 0 );
    velocity : out STD_LOGIC_VECTOR ( 7 downto 0 );
    dir_synch_out : out STD_LOGIC;
    en_synch_out : out STD_LOGIC;
    c_out : out STD_LOGIC;
    abcdefg_out : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "mclk,reset,SA,SB,duty_cycle[7:0],velocity[7:0],dir_synch_out,en_synch_out,c_out,abcdefg_out[6:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "system,Vivado 2024.1";
begin
end;
