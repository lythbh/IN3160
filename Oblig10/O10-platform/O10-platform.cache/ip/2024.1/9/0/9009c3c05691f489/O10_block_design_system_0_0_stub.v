// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Tue Apr 29 13:26:33 2025
// Host        : peregrin.ifi.uio.no running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ O10_block_design_system_0_0_stub.v
// Design      : O10_block_design_system_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "system,Vivado 2024.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(mclk, reset, SA, SB, duty_cycle, velocity, 
  dir_synch_out, en_synch_out, c_out, abcdefg_out)
/* synthesis syn_black_box black_box_pad_pin="reset,SA,SB,duty_cycle[7:0],velocity[7:0],dir_synch_out,en_synch_out,c_out,abcdefg_out[6:0]" */
/* synthesis syn_force_seq_prim="mclk" */;
  input mclk /* synthesis syn_isclock = 1 */;
  input reset;
  input SA;
  input SB;
  input [7:0]duty_cycle;
  output [7:0]velocity;
  output dir_synch_out;
  output en_synch_out;
  output c_out;
  output [6:0]abcdefg_out;
endmodule
