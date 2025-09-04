// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Tue Apr 29 13:26:33 2025
// Host        : peregrin.ifi.uio.no running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ O10_block_design_system_0_0_sim_netlist.v
// Design      : O10_block_design_system_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "O10_block_design_system_0_0,system,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "system,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (mclk,
    reset,
    SA,
    SB,
    duty_cycle,
    velocity,
    dir_synch_out,
    en_synch_out,
    c_out,
    abcdefg_out);
  input mclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input reset;
  input SA;
  input SB;
  input [7:0]duty_cycle;
  output [7:0]velocity;
  output dir_synch_out;
  output en_synch_out;
  output c_out;
  output [6:0]abcdefg_out;

  wire SA;
  wire SB;
  wire [6:0]abcdefg_out;
  wire c_out;
  wire dir_synch_out;
  wire [7:0]duty_cycle;
  wire en_synch_out;
  wire mclk;
  wire reset;
  wire [7:0]velocity;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system U0
       (.SA(SA),
        .SB(SB),
        .abcdefg_out(abcdefg_out),
        .c_reg_reg(c_out),
        .dir_synch_out(dir_synch_out),
        .duty_cycle(duty_cycle),
        .en_synch_out(en_synch_out),
        .mclk(mclk),
        .\moving_sum_reg[11] (velocity[1]),
        .\moving_sum_reg[11]_0 (velocity[5]),
        .\moving_sum_reg[5] (velocity[2]),
        .reset(reset),
        .velocity({velocity[7:6],velocity[4:3],velocity[0]}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_input_synchronizer
   (SB_synch_sig,
    SA_synch_sig,
    reset,
    SB,
    mclk,
    SA);
  output SB_synch_sig;
  output SA_synch_sig;
  input reset;
  input SB;
  input mclk;
  input SA;

  wire SA;
  wire SA_synch_sig;
  wire SB;
  wire SB_synch_sig;
  wire ffa;
  wire ffb;
  wire mclk;
  wire reset;

  FDRE SA_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(ffa),
        .Q(SA_synch_sig),
        .R(reset));
  FDRE SB_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(ffb),
        .Q(SB_synch_sig),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    ffa_reg
       (.C(mclk),
        .CE(1'b1),
        .D(SA),
        .Q(ffa),
        .R(reset));
  FDRE #(
    .INIT(1'b0)) 
    ffb_reg
       (.C(mclk),
        .CE(1'b1),
        .D(SB),
        .Q(ffb),
        .R(reset));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_output_synchronizer
   (en_synch_out,
    dir_synch_out,
    duty_cycle_4_sp_1,
    duty_cycle_2_sp_1,
    duty_cycle_0_sp_1,
    reset,
    en_sig,
    mclk,
    Q,
    duty_cycle);
  output en_synch_out;
  output dir_synch_out;
  output duty_cycle_4_sp_1;
  output duty_cycle_2_sp_1;
  output duty_cycle_0_sp_1;
  input reset;
  input en_sig;
  input mclk;
  input [0:0]Q;
  input [5:0]duty_cycle;

  wire [0:0]Q;
  wire dir_synch_out;
  wire [5:0]duty_cycle;
  wire duty_cycle_0_sn_1;
  wire duty_cycle_2_sn_1;
  wire duty_cycle_4_sn_1;
  wire en_sig;
  wire en_synch_out;
  wire mclk;
  wire reset;

  assign duty_cycle_0_sp_1 = duty_cycle_0_sn_1;
  assign duty_cycle_2_sp_1 = duty_cycle_2_sn_1;
  assign duty_cycle_4_sp_1 = duty_cycle_4_sn_1;
  FDRE dir_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(Q),
        .Q(dir_synch_out),
        .R(reset));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    en0_carry_i_10
       (.I0(duty_cycle[2]),
        .I1(duty_cycle[0]),
        .I2(duty_cycle[1]),
        .I3(duty_cycle[3]),
        .O(duty_cycle_2_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    en0_carry_i_11
       (.I0(duty_cycle[0]),
        .I1(duty_cycle[1]),
        .O(duty_cycle_0_sn_1));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    en0_carry_i_9
       (.I0(duty_cycle[4]),
        .I1(duty_cycle[2]),
        .I2(duty_cycle[0]),
        .I3(duty_cycle[1]),
        .I4(duty_cycle[3]),
        .I5(duty_cycle[5]),
        .O(duty_cycle_4_sn_1));
  FDRE en_synch_reg
       (.C(mclk),
        .CE(1'b1),
        .D(en_sig),
        .Q(en_synch_out),
        .R(reset));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pulse_width_modulator
   (en_sig,
    Q,
    mclk,
    reset,
    duty_cycle,
    en0_carry_0,
    en0_carry_1,
    en0_carry_2);
  output en_sig;
  output [0:0]Q;
  input mclk;
  input reset;
  input [7:0]duty_cycle;
  input en0_carry_0;
  input en0_carry_1;
  input en0_carry_2;

  wire [0:0]Q;
  wire \counter[0]_i_2_n_0 ;
  wire [13:7]counter_reg;
  wire \counter_reg[0]_i_1_n_0 ;
  wire \counter_reg[0]_i_1_n_1 ;
  wire \counter_reg[0]_i_1_n_2 ;
  wire \counter_reg[0]_i_1_n_3 ;
  wire \counter_reg[0]_i_1_n_4 ;
  wire \counter_reg[0]_i_1_n_5 ;
  wire \counter_reg[0]_i_1_n_6 ;
  wire \counter_reg[0]_i_1_n_7 ;
  wire \counter_reg[12]_i_1_n_3 ;
  wire \counter_reg[12]_i_1_n_6 ;
  wire \counter_reg[12]_i_1_n_7 ;
  wire \counter_reg[4]_i_1_n_0 ;
  wire \counter_reg[4]_i_1_n_1 ;
  wire \counter_reg[4]_i_1_n_2 ;
  wire \counter_reg[4]_i_1_n_3 ;
  wire \counter_reg[4]_i_1_n_4 ;
  wire \counter_reg[4]_i_1_n_5 ;
  wire \counter_reg[4]_i_1_n_6 ;
  wire \counter_reg[4]_i_1_n_7 ;
  wire \counter_reg[8]_i_1_n_0 ;
  wire \counter_reg[8]_i_1_n_1 ;
  wire \counter_reg[8]_i_1_n_2 ;
  wire \counter_reg[8]_i_1_n_3 ;
  wire \counter_reg[8]_i_1_n_4 ;
  wire \counter_reg[8]_i_1_n_5 ;
  wire \counter_reg[8]_i_1_n_6 ;
  wire \counter_reg[8]_i_1_n_7 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire [0:0]current_state;
  wire [7:0]duty_cycle;
  wire en0_carry_0;
  wire en0_carry_1;
  wire en0_carry_2;
  wire en0_carry_i_1_n_0;
  wire en0_carry_i_2_n_0;
  wire en0_carry_i_3_n_0;
  wire en0_carry_i_4_n_0;
  wire en0_carry_i_5_n_0;
  wire en0_carry_i_6_n_0;
  wire en0_carry_i_7_n_0;
  wire en0_carry_i_8_n_0;
  wire en0_carry_n_0;
  wire en0_carry_n_1;
  wire en0_carry_n_2;
  wire en0_carry_n_3;
  wire en_sig;
  wire mclk;
  wire [1:0]next_state;
  wire reset;
  wire [3:1]\NLW_counter_reg[12]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_counter_reg[12]_i_1_O_UNCONNECTED ;
  wire [3:0]NLW_en0_carry_O_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \FSM_sequential_current_state[0]_i_1__0 
       (.I0(Q),
        .I1(duty_cycle[7]),
        .O(next_state[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \FSM_sequential_current_state[1]_i_1 
       (.I0(Q),
        .I1(current_state),
        .I2(duty_cycle[7]),
        .O(next_state[1]));
  (* FSM_ENCODED_STATES = "forward_idle:10,forward:11,reverse_idle:00,reverse:01" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_state_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_state[0]),
        .Q(current_state));
  (* FSM_ENCODED_STATES = "forward_idle:10,forward:11,reverse_idle:00,reverse:01" *) 
  FDCE #(
    .INIT(1'b1)) 
    \FSM_sequential_current_state_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_state[1]),
        .Q(Q));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_2 
       (.I0(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_2_n_0 ));
  FDCE \counter_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[0]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[0] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\counter_reg[0]_i_1_n_0 ,\counter_reg[0]_i_1_n_1 ,\counter_reg[0]_i_1_n_2 ,\counter_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\counter_reg[0]_i_1_n_4 ,\counter_reg[0]_i_1_n_5 ,\counter_reg[0]_i_1_n_6 ,\counter_reg[0]_i_1_n_7 }),
        .S({\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] ,\counter[0]_i_2_n_0 }));
  FDCE \counter_reg[10] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[8]_i_1_n_5 ),
        .Q(counter_reg[10]));
  FDCE \counter_reg[11] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[8]_i_1_n_4 ),
        .Q(counter_reg[11]));
  FDCE \counter_reg[12] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[12]_i_1_n_7 ),
        .Q(counter_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[12]_i_1 
       (.CI(\counter_reg[8]_i_1_n_0 ),
        .CO({\NLW_counter_reg[12]_i_1_CO_UNCONNECTED [3:1],\counter_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[12]_i_1_O_UNCONNECTED [3:2],\counter_reg[12]_i_1_n_6 ,\counter_reg[12]_i_1_n_7 }),
        .S({1'b0,1'b0,counter_reg[13:12]}));
  FDCE \counter_reg[13] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[12]_i_1_n_6 ),
        .Q(counter_reg[13]));
  FDCE \counter_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[0]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[1] ));
  FDCE \counter_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[0]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[2] ));
  FDCE \counter_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[0]_i_1_n_4 ),
        .Q(\counter_reg_n_0_[3] ));
  FDCE \counter_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[4]_i_1_n_7 ),
        .Q(\counter_reg_n_0_[4] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[4]_i_1 
       (.CI(\counter_reg[0]_i_1_n_0 ),
        .CO({\counter_reg[4]_i_1_n_0 ,\counter_reg[4]_i_1_n_1 ,\counter_reg[4]_i_1_n_2 ,\counter_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[4]_i_1_n_4 ,\counter_reg[4]_i_1_n_5 ,\counter_reg[4]_i_1_n_6 ,\counter_reg[4]_i_1_n_7 }),
        .S({counter_reg[7],\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] ,\counter_reg_n_0_[4] }));
  FDCE \counter_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[4]_i_1_n_6 ),
        .Q(\counter_reg_n_0_[5] ));
  FDCE \counter_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[4]_i_1_n_5 ),
        .Q(\counter_reg_n_0_[6] ));
  FDCE \counter_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[4]_i_1_n_4 ),
        .Q(counter_reg[7]));
  FDCE \counter_reg[8] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[8]_i_1_n_7 ),
        .Q(counter_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \counter_reg[8]_i_1 
       (.CI(\counter_reg[4]_i_1_n_0 ),
        .CO({\counter_reg[8]_i_1_n_0 ,\counter_reg[8]_i_1_n_1 ,\counter_reg[8]_i_1_n_2 ,\counter_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\counter_reg[8]_i_1_n_4 ,\counter_reg[8]_i_1_n_5 ,\counter_reg[8]_i_1_n_6 ,\counter_reg[8]_i_1_n_7 }),
        .S(counter_reg[11:8]));
  FDCE \counter_reg[9] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\counter_reg[8]_i_1_n_6 ),
        .Q(counter_reg[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 en0_carry
       (.CI(1'b0),
        .CO({en0_carry_n_0,en0_carry_n_1,en0_carry_n_2,en0_carry_n_3}),
        .CYINIT(1'b0),
        .DI({en0_carry_i_1_n_0,en0_carry_i_2_n_0,en0_carry_i_3_n_0,en0_carry_i_4_n_0}),
        .O(NLW_en0_carry_O_UNCONNECTED[3:0]),
        .S({en0_carry_i_5_n_0,en0_carry_i_6_n_0,en0_carry_i_7_n_0,en0_carry_i_8_n_0}));
  LUT4 #(
    .INIT(16'h7414)) 
    en0_carry_i_1
       (.I0(counter_reg[13]),
        .I1(duty_cycle[6]),
        .I2(duty_cycle[7]),
        .I3(en0_carry_2),
        .O(en0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h1055450051DDC744)) 
    en0_carry_i_2
       (.I0(counter_reg[12]),
        .I1(duty_cycle[4]),
        .I2(en0_carry_1),
        .I3(duty_cycle[7]),
        .I4(duty_cycle[5]),
        .I5(counter_reg[11]),
        .O(en0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h1055450051DDC744)) 
    en0_carry_i_3
       (.I0(counter_reg[10]),
        .I1(duty_cycle[2]),
        .I2(en0_carry_0),
        .I3(duty_cycle[7]),
        .I4(duty_cycle[3]),
        .I5(counter_reg[9]),
        .O(en0_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h14447D44)) 
    en0_carry_i_4
       (.I0(counter_reg[8]),
        .I1(duty_cycle[1]),
        .I2(duty_cycle[7]),
        .I3(duty_cycle[0]),
        .I4(counter_reg[7]),
        .O(en0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h8969)) 
    en0_carry_i_5
       (.I0(counter_reg[13]),
        .I1(duty_cycle[6]),
        .I2(duty_cycle[7]),
        .I3(en0_carry_2),
        .O(en0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h6006909009600909)) 
    en0_carry_i_6
       (.I0(duty_cycle[5]),
        .I1(counter_reg[12]),
        .I2(duty_cycle[4]),
        .I3(en0_carry_1),
        .I4(duty_cycle[7]),
        .I5(counter_reg[11]),
        .O(en0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h6090069009096009)) 
    en0_carry_i_7
       (.I0(duty_cycle[3]),
        .I1(counter_reg[10]),
        .I2(duty_cycle[2]),
        .I3(duty_cycle[7]),
        .I4(en0_carry_0),
        .I5(counter_reg[9]),
        .O(en0_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h690000C3)) 
    en0_carry_i_8
       (.I0(duty_cycle[7]),
        .I1(duty_cycle[1]),
        .I2(counter_reg[8]),
        .I3(duty_cycle[0]),
        .I4(counter_reg[7]),
        .O(en0_carry_i_8_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    en_synch_i_1
       (.I0(en0_carry_n_0),
        .I1(current_state),
        .O(en_sig));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_quadrature_decoder
   (DI,
    \FSM_sequential_current_state_reg[2]_0 ,
    S,
    SA_synch_sig,
    SB_synch_sig,
    \pos_count_reg[3] ,
    mclk,
    reset);
  output [1:0]DI;
  output \FSM_sequential_current_state_reg[2]_0 ;
  output [0:0]S;
  input SA_synch_sig;
  input SB_synch_sig;
  input \pos_count_reg[3] ;
  input mclk;
  input reset;

  wire [1:0]DI;
  wire \FSM_sequential_current_state[0]_i_1_n_0 ;
  wire \FSM_sequential_current_state[1]_i_1__0_n_0 ;
  wire \FSM_sequential_current_state[2]_i_1_n_0 ;
  wire \FSM_sequential_current_state_reg[2]_0 ;
  wire [0:0]S;
  wire SA_synch_sig;
  wire SB_synch_sig;
  wire [2:0]current_state;
  wire mclk;
  wire \pos_count_reg[3] ;
  wire reset;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h8919899F)) 
    \FSM_sequential_current_state[0]_i_1 
       (.I0(SB_synch_sig),
        .I1(SA_synch_sig),
        .I2(current_state[0]),
        .I3(current_state[1]),
        .I4(current_state[2]),
        .O(\FSM_sequential_current_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hAAAA2A80)) 
    \FSM_sequential_current_state[1]_i_1__0 
       (.I0(SA_synch_sig),
        .I1(current_state[2]),
        .I2(SB_synch_sig),
        .I3(current_state[0]),
        .I4(current_state[1]),
        .O(\FSM_sequential_current_state[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h0000FFB4)) 
    \FSM_sequential_current_state[2]_i_1 
       (.I0(SB_synch_sig),
        .I1(current_state[1]),
        .I2(current_state[0]),
        .I3(current_state[2]),
        .I4(SA_synch_sig),
        .O(\FSM_sequential_current_state[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s_init:001,s_1:100,s_0:101,s_2:011,s_reset:000,s_3:010" *) 
  FDCE #(
    .INIT(1'b1)) 
    \FSM_sequential_current_state_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\FSM_sequential_current_state[0]_i_1_n_0 ),
        .Q(current_state[0]));
  (* FSM_ENCODED_STATES = "s_init:001,s_1:100,s_0:101,s_2:011,s_reset:000,s_3:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_state_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\FSM_sequential_current_state[1]_i_1__0_n_0 ),
        .Q(current_state[1]));
  (* FSM_ENCODED_STATES = "s_init:001,s_1:100,s_0:101,s_2:011,s_reset:000,s_3:010" *) 
  FDCE #(
    .INIT(1'b1)) 
    \FSM_sequential_current_state_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\FSM_sequential_current_state[2]_i_1_n_0 ),
        .Q(current_state[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h0A40A004)) 
    i__carry_i_11
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .I2(SA_synch_sig),
        .I3(SB_synch_sig),
        .I4(current_state[0]),
        .O(\FSM_sequential_current_state_reg[2]_0 ));
  LUT6 #(
    .INIT(64'hBAEABAEAAEABAAAA)) 
    i__carry_i_3
       (.I0(\pos_count_reg[3] ),
        .I1(current_state[0]),
        .I2(SB_synch_sig),
        .I3(SA_synch_sig),
        .I4(current_state[1]),
        .I5(current_state[2]),
        .O(DI[1]));
  LUT6 #(
    .INIT(64'h0A40A004F5BF5FFB)) 
    i__carry_i_4
       (.I0(current_state[2]),
        .I1(current_state[1]),
        .I2(SA_synch_sig),
        .I3(SB_synch_sig),
        .I4(current_state[0]),
        .I5(\pos_count_reg[3] ),
        .O(DI[0]));
  LUT6 #(
    .INIT(64'h966996699669AAAA)) 
    i__carry_i_8
       (.I0(\pos_count_reg[3] ),
        .I1(current_state[0]),
        .I2(SA_synch_sig),
        .I3(SB_synch_sig),
        .I4(current_state[1]),
        .I5(current_state[2]),
        .O(S));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_seg7ctrl
   (c_reg_reg_0,
    mclk,
    reset);
  output c_reg_reg_0;
  input mclk;
  input reset;

  wire c_reg;
  wire c_reg_i_1_n_0;
  wire c_reg_i_3_n_0;
  wire c_reg_i_4_n_0;
  wire c_reg_i_5_n_0;
  wire c_reg_i_6_n_0;
  wire c_reg_reg_0;
  wire [20:0]counter;
  wire [20:1]data0;
  wire mclk;
  wire [20:0]next_count;
  wire plusOp_carry__0_n_0;
  wire plusOp_carry__0_n_1;
  wire plusOp_carry__0_n_2;
  wire plusOp_carry__0_n_3;
  wire plusOp_carry__1_n_0;
  wire plusOp_carry__1_n_1;
  wire plusOp_carry__1_n_2;
  wire plusOp_carry__1_n_3;
  wire plusOp_carry__2_n_0;
  wire plusOp_carry__2_n_1;
  wire plusOp_carry__2_n_2;
  wire plusOp_carry__2_n_3;
  wire plusOp_carry__3_n_1;
  wire plusOp_carry__3_n_2;
  wire plusOp_carry__3_n_3;
  wire plusOp_carry_n_0;
  wire plusOp_carry_n_1;
  wire plusOp_carry_n_2;
  wire plusOp_carry_n_3;
  wire reset;
  wire [3:3]NLW_plusOp_carry__3_CO_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    c_reg_i_1
       (.I0(c_reg),
        .I1(c_reg_reg_0),
        .O(c_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000080)) 
    c_reg_i_2
       (.I0(c_reg_i_3_n_0),
        .I1(counter[9]),
        .I2(counter[14]),
        .I3(counter[13]),
        .I4(c_reg_i_4_n_0),
        .I5(c_reg_i_5_n_0),
        .O(c_reg));
  LUT6 #(
    .INIT(64'h0100000000000000)) 
    c_reg_i_3
       (.I0(counter[17]),
        .I1(counter[0]),
        .I2(counter[3]),
        .I3(counter[4]),
        .I4(counter[6]),
        .I5(counter[15]),
        .O(c_reg_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    c_reg_i_4
       (.I0(counter[12]),
        .I1(counter[1]),
        .I2(counter[11]),
        .I3(counter[20]),
        .O(c_reg_i_4_n_0));
  LUT5 #(
    .INIT(32'hFFFFFEFF)) 
    c_reg_i_5
       (.I0(counter[7]),
        .I1(counter[19]),
        .I2(counter[16]),
        .I3(counter[8]),
        .I4(c_reg_i_6_n_0),
        .O(c_reg_i_5_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    c_reg_i_6
       (.I0(counter[18]),
        .I1(counter[2]),
        .I2(counter[10]),
        .I3(counter[5]),
        .O(c_reg_i_6_n_0));
  FDCE c_reg_reg
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(c_reg_i_1_n_0),
        .Q(c_reg_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .I1(c_reg),
        .O(next_count[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[10]_i_1 
       (.I0(data0[10]),
        .I1(c_reg),
        .O(next_count[10]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[11]_i_1 
       (.I0(data0[11]),
        .I1(c_reg),
        .O(next_count[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[12]_i_1 
       (.I0(data0[12]),
        .I1(c_reg),
        .O(next_count[12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[13]_i_1 
       (.I0(data0[13]),
        .I1(c_reg),
        .O(next_count[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[14]_i_1 
       (.I0(data0[14]),
        .I1(c_reg),
        .O(next_count[14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[15]_i_1 
       (.I0(data0[15]),
        .I1(c_reg),
        .O(next_count[15]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[16]_i_1 
       (.I0(data0[16]),
        .I1(c_reg),
        .O(next_count[16]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[17]_i_1 
       (.I0(data0[17]),
        .I1(c_reg),
        .O(next_count[17]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[18]_i_1 
       (.I0(data0[18]),
        .I1(c_reg),
        .O(next_count[18]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[19]_i_1 
       (.I0(data0[19]),
        .I1(c_reg),
        .O(next_count[19]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[1]_i_1 
       (.I0(data0[1]),
        .I1(c_reg),
        .O(next_count[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[20]_i_1 
       (.I0(data0[20]),
        .I1(c_reg),
        .O(next_count[20]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[2]_i_1 
       (.I0(data0[2]),
        .I1(c_reg),
        .O(next_count[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[3]_i_1 
       (.I0(data0[3]),
        .I1(c_reg),
        .O(next_count[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[4]_i_1 
       (.I0(data0[4]),
        .I1(c_reg),
        .O(next_count[4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[5]_i_1 
       (.I0(data0[5]),
        .I1(c_reg),
        .O(next_count[5]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[6]_i_1 
       (.I0(data0[6]),
        .I1(c_reg),
        .O(next_count[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[7]_i_1 
       (.I0(data0[7]),
        .I1(c_reg),
        .O(next_count[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[8]_i_1 
       (.I0(data0[8]),
        .I1(c_reg),
        .O(next_count[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \counter[9]_i_1 
       (.I0(data0[9]),
        .I1(c_reg),
        .O(next_count[9]));
  FDCE \counter_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[0]),
        .Q(counter[0]));
  FDCE \counter_reg[10] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[10]),
        .Q(counter[10]));
  FDCE \counter_reg[11] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[11]),
        .Q(counter[11]));
  FDCE \counter_reg[12] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[12]),
        .Q(counter[12]));
  FDCE \counter_reg[13] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[13]),
        .Q(counter[13]));
  FDCE \counter_reg[14] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[14]),
        .Q(counter[14]));
  FDCE \counter_reg[15] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[15]),
        .Q(counter[15]));
  FDCE \counter_reg[16] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[16]),
        .Q(counter[16]));
  FDCE \counter_reg[17] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[17]),
        .Q(counter[17]));
  FDCE \counter_reg[18] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[18]),
        .Q(counter[18]));
  FDCE \counter_reg[19] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[19]),
        .Q(counter[19]));
  FDCE \counter_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[1]),
        .Q(counter[1]));
  FDCE \counter_reg[20] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[20]),
        .Q(counter[20]));
  FDCE \counter_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[2]),
        .Q(counter[2]));
  FDCE \counter_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[3]),
        .Q(counter[3]));
  FDCE \counter_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[4]),
        .Q(counter[4]));
  FDCE \counter_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[5]),
        .Q(counter[5]));
  FDCE \counter_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[6]),
        .Q(counter[6]));
  FDCE \counter_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[7]),
        .Q(counter[7]));
  FDCE \counter_reg[8] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[8]),
        .Q(counter[8]));
  FDCE \counter_reg[9] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(next_count[9]),
        .Q(counter[9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry
       (.CI(1'b0),
        .CO({plusOp_carry_n_0,plusOp_carry_n_1,plusOp_carry_n_2,plusOp_carry_n_3}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__0
       (.CI(plusOp_carry_n_0),
        .CO({plusOp_carry__0_n_0,plusOp_carry__0_n_1,plusOp_carry__0_n_2,plusOp_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__1
       (.CI(plusOp_carry__0_n_0),
        .CO({plusOp_carry__1_n_0,plusOp_carry__1_n_1,plusOp_carry__1_n_2,plusOp_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__2
       (.CI(plusOp_carry__1_n_0),
        .CO({plusOp_carry__2_n_0,plusOp_carry__2_n_1,plusOp_carry__2_n_2,plusOp_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(counter[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 plusOp_carry__3
       (.CI(plusOp_carry__2_n_0),
        .CO({NLW_plusOp_carry__3_CO_UNCONNECTED[3],plusOp_carry__3_n_1,plusOp_carry__3_n_2,plusOp_carry__3_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(counter[20:17]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_system
   (c_reg_reg,
    \moving_sum_reg[11] ,
    \moving_sum_reg[5] ,
    \moving_sum_reg[11]_0 ,
    velocity,
    en_synch_out,
    dir_synch_out,
    abcdefg_out,
    mclk,
    reset,
    SB,
    SA,
    duty_cycle);
  output c_reg_reg;
  output \moving_sum_reg[11] ;
  output \moving_sum_reg[5] ;
  output \moving_sum_reg[11]_0 ;
  output [4:0]velocity;
  output en_synch_out;
  output dir_synch_out;
  output [6:0]abcdefg_out;
  input mclk;
  input reset;
  input SB;
  input SA;
  input [7:0]duty_cycle;

  wire DUT_output_sync_n_2;
  wire DUT_output_sync_n_3;
  wire DUT_output_sync_n_4;
  wire DUT_quadrature_decoder_n_0;
  wire DUT_quadrature_decoder_n_1;
  wire DUT_quadrature_decoder_n_2;
  wire DUT_quadrature_decoder_n_3;
  wire DUT_velocity_reader_n_2;
  wire SA;
  wire SA_synch_sig;
  wire SB;
  wire SB_synch_sig;
  wire [6:0]abcdefg_out;
  wire c_reg_reg;
  wire dir_sig;
  wire dir_synch_out;
  wire [7:0]duty_cycle;
  wire en_sig;
  wire en_synch_out;
  wire mclk;
  wire \moving_sum_reg[11] ;
  wire \moving_sum_reg[11]_0 ;
  wire \moving_sum_reg[5] ;
  wire reset;
  wire [4:0]velocity;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_input_synchronizer DUT_input_synchronizer
       (.SA(SA),
        .SA_synch_sig(SA_synch_sig),
        .SB(SB),
        .SB_synch_sig(SB_synch_sig),
        .mclk(mclk),
        .reset(reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_output_synchronizer DUT_output_sync
       (.Q(dir_sig),
        .dir_synch_out(dir_synch_out),
        .duty_cycle(duty_cycle[5:0]),
        .duty_cycle_0_sp_1(DUT_output_sync_n_4),
        .duty_cycle_2_sp_1(DUT_output_sync_n_3),
        .duty_cycle_4_sp_1(DUT_output_sync_n_2),
        .en_sig(en_sig),
        .en_synch_out(en_synch_out),
        .mclk(mclk),
        .reset(reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pulse_width_modulator DUT_pulse_width_modulator
       (.Q(dir_sig),
        .duty_cycle(duty_cycle),
        .en0_carry_0(DUT_output_sync_n_4),
        .en0_carry_1(DUT_output_sync_n_3),
        .en0_carry_2(DUT_output_sync_n_2),
        .en_sig(en_sig),
        .mclk(mclk),
        .reset(reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_quadrature_decoder DUT_quadrature_decoder
       (.DI({DUT_quadrature_decoder_n_0,DUT_quadrature_decoder_n_1}),
        .\FSM_sequential_current_state_reg[2]_0 (DUT_quadrature_decoder_n_2),
        .S(DUT_quadrature_decoder_n_3),
        .SA_synch_sig(SA_synch_sig),
        .SB_synch_sig(SB_synch_sig),
        .mclk(mclk),
        .\pos_count_reg[3] (DUT_velocity_reader_n_2),
        .reset(reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_seg7ctrl DUT_seg7ctrl
       (.c_reg_reg_0(c_reg_reg),
        .mclk(mclk),
        .reset(reset));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_velocity_reader DUT_velocity_reader
       (.DI({DUT_quadrature_decoder_n_0,DUT_quadrature_decoder_n_1}),
        .S(DUT_quadrature_decoder_n_3),
        .abcdefg_out(abcdefg_out),
        .abcdefg_out_2_sp_1(c_reg_reg),
        .mclk(mclk),
        .\moving_sum_reg[11]_0 (\moving_sum_reg[11] ),
        .\moving_sum_reg[11]_1 (\moving_sum_reg[11]_0 ),
        .\moving_sum_reg[5]_0 (\moving_sum_reg[5] ),
        .\pos_count_reg[0]_0 (DUT_velocity_reader_n_2),
        .\pos_count_reg[3]_0 (DUT_quadrature_decoder_n_2),
        .reset(reset),
        .velocity(velocity));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_velocity_reader
   (\moving_sum_reg[11]_0 ,
    \moving_sum_reg[5]_0 ,
    \pos_count_reg[0]_0 ,
    \moving_sum_reg[11]_1 ,
    velocity,
    abcdefg_out,
    mclk,
    reset,
    DI,
    S,
    abcdefg_out_2_sp_1,
    \pos_count_reg[3]_0 );
  output \moving_sum_reg[11]_0 ;
  output \moving_sum_reg[5]_0 ;
  output \pos_count_reg[0]_0 ;
  output \moving_sum_reg[11]_1 ;
  output [4:0]velocity;
  output [6:0]abcdefg_out;
  input mclk;
  input reset;
  input [1:0]DI;
  input [0:0]S;
  input abcdefg_out_2_sp_1;
  input \pos_count_reg[3]_0 ;

  wire [11:3]ARG3;
  wire [1:0]DI;
  wire [0:0]S;
  wire \_inferred__0/i__carry__0_n_1 ;
  wire \_inferred__0/i__carry__0_n_2 ;
  wire \_inferred__0/i__carry__0_n_3 ;
  wire \_inferred__0/i__carry__0_n_4 ;
  wire \_inferred__0/i__carry__0_n_5 ;
  wire \_inferred__0/i__carry__0_n_6 ;
  wire \_inferred__0/i__carry__0_n_7 ;
  wire \_inferred__0/i__carry_n_0 ;
  wire \_inferred__0/i__carry_n_1 ;
  wire \_inferred__0/i__carry_n_2 ;
  wire \_inferred__0/i__carry_n_3 ;
  wire \_inferred__0/i__carry_n_4 ;
  wire \_inferred__0/i__carry_n_5 ;
  wire \_inferred__0/i__carry_n_6 ;
  wire \_inferred__0/i__carry_n_7 ;
  wire [6:0]abcdefg_out;
  wire \abcdefg_out[0]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[1]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[2]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[3]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[4]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[5]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[5]_INST_0_i_2_n_0 ;
  wire \abcdefg_out[6]_INST_0_i_1_n_0 ;
  wire \abcdefg_out[6]_INST_0_i_2_n_0 ;
  wire abcdefg_out_2_sn_1;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_13_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_9_n_0;
  wire mclk;
  wire [11:0]moving_sum;
  wire \moving_sum[11]_i_2_n_0 ;
  wire \moving_sum[11]_i_3_n_0 ;
  wire \moving_sum[11]_i_4_n_0 ;
  wire \moving_sum[11]_i_5_n_0 ;
  wire moving_sum_next_carry__0_i_1_n_0;
  wire moving_sum_next_carry__0_i_2_n_0;
  wire moving_sum_next_carry__0_i_3_n_0;
  wire moving_sum_next_carry__0_i_4_n_0;
  wire moving_sum_next_carry__0_i_5_n_0;
  wire moving_sum_next_carry__0_i_6_n_0;
  wire moving_sum_next_carry__0_i_7_n_0;
  wire moving_sum_next_carry__0_i_8_n_0;
  wire moving_sum_next_carry__0_n_0;
  wire moving_sum_next_carry__0_n_1;
  wire moving_sum_next_carry__0_n_2;
  wire moving_sum_next_carry__0_n_3;
  wire moving_sum_next_carry__0_n_4;
  wire moving_sum_next_carry__0_n_5;
  wire moving_sum_next_carry__0_n_6;
  wire moving_sum_next_carry__0_n_7;
  wire moving_sum_next_carry__1_i_1_n_0;
  wire moving_sum_next_carry__1_i_2_n_0;
  wire moving_sum_next_carry__1_i_3_n_0;
  wire moving_sum_next_carry__1_i_4_n_0;
  wire moving_sum_next_carry__1_i_5_n_0;
  wire moving_sum_next_carry__1_n_1;
  wire moving_sum_next_carry__1_n_2;
  wire moving_sum_next_carry__1_n_3;
  wire moving_sum_next_carry__1_n_4;
  wire moving_sum_next_carry__1_n_5;
  wire moving_sum_next_carry__1_n_6;
  wire moving_sum_next_carry__1_n_7;
  wire moving_sum_next_carry_i_1_n_0;
  wire moving_sum_next_carry_i_2_n_0;
  wire moving_sum_next_carry_i_3_n_0;
  wire moving_sum_next_carry_i_4_n_0;
  wire moving_sum_next_carry_i_5_n_0;
  wire moving_sum_next_carry_i_6_n_0;
  wire moving_sum_next_carry_i_7_n_0;
  wire moving_sum_next_carry_i_8_n_0;
  wire moving_sum_next_carry_n_0;
  wire moving_sum_next_carry_n_1;
  wire moving_sum_next_carry_n_2;
  wire moving_sum_next_carry_n_3;
  wire moving_sum_next_carry_n_4;
  wire moving_sum_next_carry_n_5;
  wire moving_sum_next_carry_n_6;
  wire moving_sum_next_carry_n_7;
  wire \moving_sum_reg[11]_0 ;
  wire \moving_sum_reg[11]_1 ;
  wire \moving_sum_reg[5]_0 ;
  wire [7:0]pos_count;
  wire \pos_count_reg[0]_0 ;
  wire \pos_count_reg[3]_0 ;
  wire \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ;
  wire \pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire \pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ;
  wire [7:0]\pos_shift_reg[9] ;
  wire pos_shift_reg_c_0_n_0;
  wire pos_shift_reg_c_1_n_0;
  wire pos_shift_reg_c_2_n_0;
  wire pos_shift_reg_c_3_n_0;
  wire pos_shift_reg_c_4_n_0;
  wire pos_shift_reg_c_5_n_0;
  wire pos_shift_reg_c_6_n_0;
  wire pos_shift_reg_c_7_n_0;
  wire pos_shift_reg_c_n_0;
  wire pos_shift_reg_gate__0_n_0;
  wire pos_shift_reg_gate__1_n_0;
  wire pos_shift_reg_gate__2_n_0;
  wire pos_shift_reg_gate__3_n_0;
  wire pos_shift_reg_gate__4_n_0;
  wire pos_shift_reg_gate__5_n_0;
  wire pos_shift_reg_gate__6_n_0;
  wire pos_shift_reg_gate_n_0;
  wire \rcount[0]_i_2_n_0 ;
  wire \rcount[0]_i_3_n_0 ;
  wire \rcount[0]_i_4_n_0 ;
  wire \rcount[0]_i_5_n_0 ;
  wire \rcount[0]_i_6_n_0 ;
  wire \rcount[0]_i_7_n_0 ;
  wire \rcount[0]_i_8_n_0 ;
  wire \rcount[0]_i_9_n_0 ;
  wire \rcount[12]_i_2_n_0 ;
  wire \rcount[12]_i_3_n_0 ;
  wire \rcount[12]_i_4_n_0 ;
  wire \rcount[12]_i_5_n_0 ;
  wire \rcount[16]_i_2_n_0 ;
  wire \rcount[16]_i_3_n_0 ;
  wire \rcount[16]_i_4_n_0 ;
  wire \rcount[16]_i_5_n_0 ;
  wire \rcount[4]_i_2_n_0 ;
  wire \rcount[4]_i_3_n_0 ;
  wire \rcount[4]_i_4_n_0 ;
  wire \rcount[4]_i_5_n_0 ;
  wire \rcount[8]_i_2_n_0 ;
  wire \rcount[8]_i_3_n_0 ;
  wire \rcount[8]_i_4_n_0 ;
  wire \rcount[8]_i_5_n_0 ;
  wire [19:0]rcount_reg;
  wire \rcount_reg[0]_i_1_n_0 ;
  wire \rcount_reg[0]_i_1_n_1 ;
  wire \rcount_reg[0]_i_1_n_2 ;
  wire \rcount_reg[0]_i_1_n_3 ;
  wire \rcount_reg[0]_i_1_n_4 ;
  wire \rcount_reg[0]_i_1_n_5 ;
  wire \rcount_reg[0]_i_1_n_6 ;
  wire \rcount_reg[0]_i_1_n_7 ;
  wire \rcount_reg[12]_i_1_n_0 ;
  wire \rcount_reg[12]_i_1_n_1 ;
  wire \rcount_reg[12]_i_1_n_2 ;
  wire \rcount_reg[12]_i_1_n_3 ;
  wire \rcount_reg[12]_i_1_n_4 ;
  wire \rcount_reg[12]_i_1_n_5 ;
  wire \rcount_reg[12]_i_1_n_6 ;
  wire \rcount_reg[12]_i_1_n_7 ;
  wire \rcount_reg[16]_i_1_n_1 ;
  wire \rcount_reg[16]_i_1_n_2 ;
  wire \rcount_reg[16]_i_1_n_3 ;
  wire \rcount_reg[16]_i_1_n_4 ;
  wire \rcount_reg[16]_i_1_n_5 ;
  wire \rcount_reg[16]_i_1_n_6 ;
  wire \rcount_reg[16]_i_1_n_7 ;
  wire \rcount_reg[4]_i_1_n_0 ;
  wire \rcount_reg[4]_i_1_n_1 ;
  wire \rcount_reg[4]_i_1_n_2 ;
  wire \rcount_reg[4]_i_1_n_3 ;
  wire \rcount_reg[4]_i_1_n_4 ;
  wire \rcount_reg[4]_i_1_n_5 ;
  wire \rcount_reg[4]_i_1_n_6 ;
  wire \rcount_reg[4]_i_1_n_7 ;
  wire \rcount_reg[8]_i_1_n_0 ;
  wire \rcount_reg[8]_i_1_n_1 ;
  wire \rcount_reg[8]_i_1_n_2 ;
  wire \rcount_reg[8]_i_1_n_3 ;
  wire \rcount_reg[8]_i_1_n_4 ;
  wire \rcount_reg[8]_i_1_n_5 ;
  wire \rcount_reg[8]_i_1_n_6 ;
  wire \rcount_reg[8]_i_1_n_7 ;
  wire reset;
  wire ten_ms_pulse;
  wire [4:0]velocity;
  wire velocity1;
  wire velocity1_carry_i_10_n_0;
  wire velocity1_carry_i_10_n_1;
  wire velocity1_carry_i_10_n_2;
  wire velocity1_carry_i_10_n_3;
  wire velocity1_carry_i_11_n_0;
  wire velocity1_carry_i_12_n_0;
  wire velocity1_carry_i_13_n_0;
  wire velocity1_carry_i_14_n_0;
  wire velocity1_carry_i_15_n_0;
  wire velocity1_carry_i_16_n_0;
  wire velocity1_carry_i_17_n_0;
  wire velocity1_carry_i_18_n_0;
  wire velocity1_carry_i_19_n_0;
  wire velocity1_carry_i_1_n_0;
  wire velocity1_carry_i_20_n_0;
  wire velocity1_carry_i_21_n_0;
  wire velocity1_carry_i_2_n_0;
  wire velocity1_carry_i_4_n_0;
  wire velocity1_carry_i_5_n_0;
  wire velocity1_carry_i_6_n_0;
  wire velocity1_carry_i_7_n_0;
  wire velocity1_carry_i_8_n_2;
  wire velocity1_carry_i_8_n_3;
  wire velocity1_carry_i_9_n_0;
  wire velocity1_carry_i_9_n_1;
  wire velocity1_carry_i_9_n_2;
  wire velocity1_carry_i_9_n_3;
  wire velocity1_carry_n_1;
  wire velocity1_carry_n_2;
  wire velocity1_carry_n_3;
  wire [5:5]velocity2;
  wire [11:4]velocity3;
  wire \velocity[1]_INST_0_i_1_n_0 ;
  wire \velocity[1]_INST_0_i_1_n_1 ;
  wire \velocity[1]_INST_0_i_1_n_2 ;
  wire \velocity[1]_INST_0_i_1_n_3 ;
  wire \velocity[1]_INST_0_i_2_n_0 ;
  wire \velocity[1]_INST_0_i_3_n_0 ;
  wire \velocity[1]_INST_0_i_4_n_0 ;
  wire \velocity[1]_INST_0_i_5_n_0 ;
  wire \velocity[1]_INST_0_i_6_n_0 ;
  wire \velocity[3]_INST_0_i_1_n_0 ;
  wire \velocity[3]_INST_0_i_2_n_0 ;
  wire \velocity[5]_INST_0_i_1_n_0 ;
  wire \velocity[5]_INST_0_i_1_n_1 ;
  wire \velocity[5]_INST_0_i_1_n_2 ;
  wire \velocity[5]_INST_0_i_1_n_3 ;
  wire \velocity[5]_INST_0_i_2_n_0 ;
  wire \velocity[5]_INST_0_i_3_n_0 ;
  wire \velocity[5]_INST_0_i_4_n_0 ;
  wire \velocity[5]_INST_0_i_5_n_0 ;
  wire \velocity[5]_INST_0_i_6_n_0 ;
  wire \velocity[5]_INST_0_i_7_n_0 ;
  wire \velocity[6]_INST_0_i_1_n_0 ;
  wire \velocity[7]_INST_0_i_1_n_0 ;
  wire \velocity[7]_INST_0_i_2_n_0 ;
  wire \velocity[7]_INST_0_i_3_n_0 ;
  wire \velocity[7]_INST_0_i_4_n_2 ;
  wire \velocity[7]_INST_0_i_4_n_3 ;
  wire \velocity[7]_INST_0_i_5_n_0 ;
  wire \velocity[7]_INST_0_i_6_n_0 ;
  wire \velocity[7]_INST_0_i_7_n_0 ;
  wire \velocity[7]_INST_0_i_8_n_0 ;
  wire \velocity[7]_INST_0_i_9_n_0 ;
  wire [3:3]\NLW__inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire [3:3]NLW_moving_sum_next_carry__1_CO_UNCONNECTED;
  wire [3:3]\NLW_rcount_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]NLW_velocity1_carry_O_UNCONNECTED;
  wire [2:0]NLW_velocity1_carry_i_10_O_UNCONNECTED;
  wire [3:2]NLW_velocity1_carry_i_8_CO_UNCONNECTED;
  wire [3:3]NLW_velocity1_carry_i_8_O_UNCONNECTED;
  wire [1:0]\NLW_velocity[1]_INST_0_i_1_O_UNCONNECTED ;
  wire [3:2]\NLW_velocity[7]_INST_0_i_4_CO_UNCONNECTED ;
  wire [3:3]\NLW_velocity[7]_INST_0_i_4_O_UNCONNECTED ;

  assign abcdefg_out_2_sn_1 = abcdefg_out_2_sp_1;
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({\_inferred__0/i__carry_n_0 ,\_inferred__0/i__carry_n_1 ,\_inferred__0/i__carry_n_2 ,\_inferred__0/i__carry_n_3 }),
        .CYINIT(1'b0),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,DI}),
        .O({\_inferred__0/i__carry_n_4 ,\_inferred__0/i__carry_n_5 ,\_inferred__0/i__carry_n_6 ,\_inferred__0/i__carry_n_7 }),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,S}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \_inferred__0/i__carry__0 
       (.CI(\_inferred__0/i__carry_n_0 ),
        .CO({\NLW__inferred__0/i__carry__0_CO_UNCONNECTED [3],\_inferred__0/i__carry__0_n_1 ,\_inferred__0/i__carry__0_n_2 ,\_inferred__0/i__carry__0_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0}),
        .O({\_inferred__0/i__carry__0_n_4 ,\_inferred__0/i__carry__0_n_5 ,\_inferred__0/i__carry__0_n_6 ,\_inferred__0/i__carry__0_n_7 }),
        .S({i__carry__0_i_4_n_0,i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0}));
  LUT6 #(
    .INIT(64'h00000000F5F75FFF)) 
    \abcdefg_out[0]_INST_0 
       (.I0(abcdefg_out_2_sn_1),
        .I1(\velocity[7]_INST_0_i_1_n_0 ),
        .I2(\moving_sum_reg[11]_1 ),
        .I3(velocity[2]),
        .I4(\velocity[6]_INST_0_i_1_n_0 ),
        .I5(\abcdefg_out[0]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00410021)) 
    \abcdefg_out[0]_INST_0_i_1 
       (.I0(\moving_sum_reg[11]_0 ),
        .I1(velocity[1]),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(abcdefg_out_2_sn_1),
        .I4(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .O(\abcdefg_out[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1115155551115155)) 
    \abcdefg_out[1]_INST_0 
       (.I0(\abcdefg_out[1]_INST_0_i_1_n_0 ),
        .I1(abcdefg_out_2_sn_1),
        .I2(\velocity[6]_INST_0_i_1_n_0 ),
        .I3(\moving_sum_reg[11]_1 ),
        .I4(velocity[2]),
        .I5(\velocity[7]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[1]));
  LUT6 #(
    .INIT(64'h0500000055050014)) 
    \abcdefg_out[1]_INST_0_i_1 
       (.I0(abcdefg_out_2_sn_1),
        .I1(velocity1),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_0 ),
        .I4(\abcdefg_out[5]_INST_0_i_2_n_0 ),
        .I5(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .O(\abcdefg_out[1]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h32FF3200)) 
    \abcdefg_out[2]_INST_0 
       (.I0(\moving_sum_reg[11]_1 ),
        .I1(velocity[2]),
        .I2(\velocity[6]_INST_0_i_1_n_0 ),
        .I3(abcdefg_out_2_sn_1),
        .I4(\abcdefg_out[2]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h8ACE8AFE)) 
    \abcdefg_out[2]_INST_0_i_1 
       (.I0(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .I1(\moving_sum_reg[11]_0 ),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\abcdefg_out[5]_INST_0_i_2_n_0 ),
        .I4(velocity1),
        .O(\abcdefg_out[2]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h00009EFF)) 
    \abcdefg_out[3]_INST_0 
       (.I0(\velocity[6]_INST_0_i_1_n_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(velocity[2]),
        .I3(abcdefg_out_2_sn_1),
        .I4(\abcdefg_out[3]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[3]));
  LUT6 #(
    .INIT(64'h0550100504501004)) 
    \abcdefg_out[3]_INST_0_i_1 
       (.I0(abcdefg_out_2_sn_1),
        .I1(\abcdefg_out[5]_INST_0_i_2_n_0 ),
        .I2(\moving_sum_reg[11]_0 ),
        .I3(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .I4(\moving_sum_reg[5]_0 ),
        .I5(velocity1),
        .O(\abcdefg_out[3]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF7FFFDF)) 
    \abcdefg_out[4]_INST_0 
       (.I0(abcdefg_out_2_sn_1),
        .I1(\velocity[6]_INST_0_i_1_n_0 ),
        .I2(\moving_sum_reg[11]_1 ),
        .I3(velocity[2]),
        .I4(\velocity[7]_INST_0_i_1_n_0 ),
        .I5(\abcdefg_out[4]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[4]));
  LUT6 #(
    .INIT(64'h0000000026040400)) 
    \abcdefg_out[4]_INST_0_i_1 
       (.I0(\abcdefg_out[5]_INST_0_i_2_n_0 ),
        .I1(\moving_sum_reg[5]_0 ),
        .I2(velocity1),
        .I3(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .I4(\moving_sum_reg[11]_0 ),
        .I5(abcdefg_out_2_sn_1),
        .O(\abcdefg_out[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEB77FFFFEB770000)) 
    \abcdefg_out[5]_INST_0 
       (.I0(\velocity[6]_INST_0_i_1_n_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(velocity[2]),
        .I3(\velocity[7]_INST_0_i_1_n_0 ),
        .I4(abcdefg_out_2_sn_1),
        .I5(\abcdefg_out[5]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h7D7D4D47)) 
    \abcdefg_out[5]_INST_0_i_1 
       (.I0(\moving_sum_reg[5]_0 ),
        .I1(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .I2(\moving_sum_reg[11]_0 ),
        .I3(velocity1),
        .I4(\abcdefg_out[5]_INST_0_i_2_n_0 ),
        .O(\abcdefg_out[5]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h8A20DF75)) 
    \abcdefg_out[5]_INST_0_i_2 
       (.I0(moving_sum[11]),
        .I1(ARG3[5]),
        .I2(\velocity[3]_INST_0_i_1_n_0 ),
        .I3(ARG3[6]),
        .I4(moving_sum[6]),
        .O(\abcdefg_out[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hDEBEFFFFDEBE0000)) 
    \abcdefg_out[6]_INST_0 
       (.I0(\velocity[6]_INST_0_i_1_n_0 ),
        .I1(\moving_sum_reg[11]_1 ),
        .I2(velocity[2]),
        .I3(\velocity[7]_INST_0_i_1_n_0 ),
        .I4(abcdefg_out_2_sn_1),
        .I5(\abcdefg_out[6]_INST_0_i_1_n_0 ),
        .O(abcdefg_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFB9E)) 
    \abcdefg_out[6]_INST_0_i_1 
       (.I0(\abcdefg_out[6]_INST_0_i_2_n_0 ),
        .I1(velocity[1]),
        .I2(\moving_sum_reg[5]_0 ),
        .I3(\moving_sum_reg[11]_0 ),
        .O(\abcdefg_out[6]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0151)) 
    \abcdefg_out[6]_INST_0_i_2 
       (.I0(velocity1),
        .I1(moving_sum[3]),
        .I2(moving_sum[11]),
        .I3(ARG3[3]),
        .O(\abcdefg_out[6]_INST_0_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    i__carry__0_i_1
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[5]),
        .O(i__carry__0_i_1_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    i__carry__0_i_2
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[4]),
        .O(i__carry__0_i_2_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    i__carry__0_i_3
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[3]),
        .O(i__carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'hFEEF)) 
    i__carry__0_i_4
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[7]),
        .I3(pos_count[6]),
        .O(i__carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'hFEEF)) 
    i__carry__0_i_5
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[5]),
        .I3(pos_count[6]),
        .O(i__carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'hFEEF)) 
    i__carry__0_i_6
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[4]),
        .I3(pos_count[5]),
        .O(i__carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'hFEEF)) 
    i__carry__0_i_7
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[3]),
        .I3(pos_count[4]),
        .O(i__carry__0_i_7_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    i__carry_i_1
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[2]),
        .O(i__carry_i_1_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    i__carry_i_10
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[0]),
        .O(\pos_count_reg[0]_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    i__carry_i_12
       (.I0(pos_count[7]),
        .I1(pos_count[6]),
        .I2(pos_count[4]),
        .I3(pos_count[3]),
        .O(i__carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h0040)) 
    i__carry_i_13
       (.I0(pos_count[5]),
        .I1(pos_count[3]),
        .I2(pos_count[4]),
        .I3(i__carry_i_14_n_0),
        .O(i__carry_i_13_n_0));
  LUT4 #(
    .INIT(16'hFF7F)) 
    i__carry_i_14
       (.I0(pos_count[7]),
        .I1(pos_count[6]),
        .I2(pos_count[2]),
        .I3(pos_count[1]),
        .O(i__carry_i_14_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    i__carry_i_2
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[1]),
        .O(i__carry_i_2_n_0));
  LUT4 #(
    .INIT(16'hFEEF)) 
    i__carry_i_5
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[2]),
        .I3(pos_count[3]),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'hFEEF)) 
    i__carry_i_6
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(pos_count[1]),
        .I3(pos_count[2]),
        .O(i__carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h1F1E0E0F)) 
    i__carry_i_7
       (.I0(ten_ms_pulse),
        .I1(i__carry_i_9_n_0),
        .I2(\pos_count_reg[3]_0 ),
        .I3(pos_count[0]),
        .I4(pos_count[1]),
        .O(i__carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h0040FFFF00400000)) 
    i__carry_i_9
       (.I0(pos_count[2]),
        .I1(pos_count[1]),
        .I2(pos_count[5]),
        .I3(i__carry_i_12_n_0),
        .I4(pos_count[0]),
        .I5(i__carry_i_13_n_0),
        .O(i__carry_i_9_n_0));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \moving_sum[11]_i_1 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[6]),
        .I2(rcount_reg[7]),
        .I3(rcount_reg[8]),
        .I4(\moving_sum[11]_i_3_n_0 ),
        .I5(\moving_sum[11]_i_4_n_0 ),
        .O(ten_ms_pulse));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \moving_sum[11]_i_2 
       (.I0(rcount_reg[15]),
        .I1(rcount_reg[10]),
        .I2(rcount_reg[11]),
        .I3(rcount_reg[12]),
        .I4(rcount_reg[13]),
        .O(\moving_sum[11]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \moving_sum[11]_i_3 
       (.I0(rcount_reg[19]),
        .I1(rcount_reg[5]),
        .I2(rcount_reg[9]),
        .I3(rcount_reg[4]),
        .O(\moving_sum[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \moving_sum[11]_i_4 
       (.I0(rcount_reg[17]),
        .I1(rcount_reg[18]),
        .I2(rcount_reg[1]),
        .I3(rcount_reg[16]),
        .I4(\moving_sum[11]_i_5_n_0 ),
        .O(\moving_sum[11]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \moving_sum[11]_i_5 
       (.I0(rcount_reg[14]),
        .I1(rcount_reg[2]),
        .I2(rcount_reg[3]),
        .I3(rcount_reg[0]),
        .O(\moving_sum[11]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 moving_sum_next_carry
       (.CI(1'b0),
        .CO({moving_sum_next_carry_n_0,moving_sum_next_carry_n_1,moving_sum_next_carry_n_2,moving_sum_next_carry_n_3}),
        .CYINIT(1'b0),
        .DI({moving_sum_next_carry_i_1_n_0,moving_sum_next_carry_i_2_n_0,moving_sum_next_carry_i_3_n_0,moving_sum_next_carry_i_4_n_0}),
        .O({moving_sum_next_carry_n_4,moving_sum_next_carry_n_5,moving_sum_next_carry_n_6,moving_sum_next_carry_n_7}),
        .S({moving_sum_next_carry_i_5_n_0,moving_sum_next_carry_i_6_n_0,moving_sum_next_carry_i_7_n_0,moving_sum_next_carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 moving_sum_next_carry__0
       (.CI(moving_sum_next_carry_n_0),
        .CO({moving_sum_next_carry__0_n_0,moving_sum_next_carry__0_n_1,moving_sum_next_carry__0_n_2,moving_sum_next_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({moving_sum_next_carry__0_i_1_n_0,moving_sum_next_carry__0_i_2_n_0,moving_sum_next_carry__0_i_3_n_0,moving_sum_next_carry__0_i_4_n_0}),
        .O({moving_sum_next_carry__0_n_4,moving_sum_next_carry__0_n_5,moving_sum_next_carry__0_n_6,moving_sum_next_carry__0_n_7}),
        .S({moving_sum_next_carry__0_i_5_n_0,moving_sum_next_carry__0_i_6_n_0,moving_sum_next_carry__0_i_7_n_0,moving_sum_next_carry__0_i_8_n_0}));
  (* HLUTNM = "lutpair5" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    moving_sum_next_carry__0_i_1
       (.I0(pos_count[6]),
        .I1(\pos_shift_reg[9] [6]),
        .I2(moving_sum[6]),
        .O(moving_sum_next_carry__0_i_1_n_0));
  (* HLUTNM = "lutpair4" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    moving_sum_next_carry__0_i_2
       (.I0(pos_count[5]),
        .I1(\pos_shift_reg[9] [5]),
        .I2(moving_sum[5]),
        .O(moving_sum_next_carry__0_i_2_n_0));
  (* HLUTNM = "lutpair3" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    moving_sum_next_carry__0_i_3
       (.I0(pos_count[4]),
        .I1(\pos_shift_reg[9] [4]),
        .I2(moving_sum[4]),
        .O(moving_sum_next_carry__0_i_3_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    moving_sum_next_carry__0_i_4
       (.I0(pos_count[3]),
        .I1(\pos_shift_reg[9] [3]),
        .I2(moving_sum[3]),
        .O(moving_sum_next_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_5
       (.I0(moving_sum_next_carry__0_i_1_n_0),
        .I1(moving_sum[7]),
        .I2(pos_count[7]),
        .I3(\pos_shift_reg[9] [7]),
        .O(moving_sum_next_carry__0_i_5_n_0));
  (* HLUTNM = "lutpair5" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_6
       (.I0(pos_count[6]),
        .I1(\pos_shift_reg[9] [6]),
        .I2(moving_sum[6]),
        .I3(moving_sum_next_carry__0_i_2_n_0),
        .O(moving_sum_next_carry__0_i_6_n_0));
  (* HLUTNM = "lutpair4" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_7
       (.I0(pos_count[5]),
        .I1(\pos_shift_reg[9] [5]),
        .I2(moving_sum[5]),
        .I3(moving_sum_next_carry__0_i_3_n_0),
        .O(moving_sum_next_carry__0_i_7_n_0));
  (* HLUTNM = "lutpair3" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry__0_i_8
       (.I0(pos_count[4]),
        .I1(\pos_shift_reg[9] [4]),
        .I2(moving_sum[4]),
        .I3(moving_sum_next_carry__0_i_4_n_0),
        .O(moving_sum_next_carry__0_i_8_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 moving_sum_next_carry__1
       (.CI(moving_sum_next_carry__0_n_0),
        .CO({NLW_moving_sum_next_carry__1_CO_UNCONNECTED[3],moving_sum_next_carry__1_n_1,moving_sum_next_carry__1_n_2,moving_sum_next_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,moving_sum[9:8],moving_sum_next_carry__1_i_1_n_0}),
        .O({moving_sum_next_carry__1_n_4,moving_sum_next_carry__1_n_5,moving_sum_next_carry__1_n_6,moving_sum_next_carry__1_n_7}),
        .S({moving_sum_next_carry__1_i_2_n_0,moving_sum_next_carry__1_i_3_n_0,moving_sum_next_carry__1_i_4_n_0,moving_sum_next_carry__1_i_5_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    moving_sum_next_carry__1_i_1
       (.I0(moving_sum[8]),
        .O(moving_sum_next_carry__1_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_2
       (.I0(moving_sum[10]),
        .I1(moving_sum[11]),
        .O(moving_sum_next_carry__1_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_3
       (.I0(moving_sum[9]),
        .I1(moving_sum[10]),
        .O(moving_sum_next_carry__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry__1_i_4
       (.I0(moving_sum[8]),
        .I1(moving_sum[9]),
        .O(moving_sum_next_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'hB24D)) 
    moving_sum_next_carry__1_i_5
       (.I0(\pos_shift_reg[9] [7]),
        .I1(pos_count[7]),
        .I2(moving_sum[7]),
        .I3(moving_sum[8]),
        .O(moving_sum_next_carry__1_i_5_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    moving_sum_next_carry_i_1
       (.I0(pos_count[2]),
        .I1(\pos_shift_reg[9] [2]),
        .I2(moving_sum[2]),
        .O(moving_sum_next_carry_i_1_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    moving_sum_next_carry_i_2
       (.I0(pos_count[1]),
        .I1(\pos_shift_reg[9] [1]),
        .I2(moving_sum[1]),
        .O(moving_sum_next_carry_i_2_n_0));
  (* HLUTNM = "lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    moving_sum_next_carry_i_3
       (.I0(moving_sum[0]),
        .I1(pos_count[0]),
        .O(moving_sum_next_carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    moving_sum_next_carry_i_4
       (.I0(moving_sum[0]),
        .I1(pos_count[0]),
        .O(moving_sum_next_carry_i_4_n_0));
  (* HLUTNM = "lutpair2" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry_i_5
       (.I0(pos_count[3]),
        .I1(\pos_shift_reg[9] [3]),
        .I2(moving_sum[3]),
        .I3(moving_sum_next_carry_i_1_n_0),
        .O(moving_sum_next_carry_i_5_n_0));
  (* HLUTNM = "lutpair1" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry_i_6
       (.I0(pos_count[2]),
        .I1(\pos_shift_reg[9] [2]),
        .I2(moving_sum[2]),
        .I3(moving_sum_next_carry_i_2_n_0),
        .O(moving_sum_next_carry_i_6_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    moving_sum_next_carry_i_7
       (.I0(pos_count[1]),
        .I1(\pos_shift_reg[9] [1]),
        .I2(moving_sum[1]),
        .I3(moving_sum_next_carry_i_3_n_0),
        .O(moving_sum_next_carry_i_7_n_0));
  (* HLUTNM = "lutpair6" *) 
  LUT3 #(
    .INIT(8'h96)) 
    moving_sum_next_carry_i_8
       (.I0(moving_sum[0]),
        .I1(pos_count[0]),
        .I2(\pos_shift_reg[9] [0]),
        .O(moving_sum_next_carry_i_8_n_0));
  FDCE \moving_sum_reg[0] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry_n_7),
        .Q(moving_sum[0]));
  FDCE \moving_sum_reg[10] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_5),
        .Q(moving_sum[10]));
  FDCE \moving_sum_reg[11] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_4),
        .Q(moving_sum[11]));
  FDCE \moving_sum_reg[1] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry_n_6),
        .Q(moving_sum[1]));
  FDCE \moving_sum_reg[2] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry_n_5),
        .Q(moving_sum[2]));
  FDCE \moving_sum_reg[3] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry_n_4),
        .Q(moving_sum[3]));
  FDCE \moving_sum_reg[4] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_7),
        .Q(moving_sum[4]));
  FDCE \moving_sum_reg[5] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_6),
        .Q(moving_sum[5]));
  FDCE \moving_sum_reg[6] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_5),
        .Q(moving_sum[6]));
  FDCE \moving_sum_reg[7] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__0_n_4),
        .Q(moving_sum[7]));
  FDCE \moving_sum_reg[8] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_7),
        .Q(moving_sum[8]));
  FDCE \moving_sum_reg[9] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(moving_sum_next_carry__1_n_6),
        .Q(moving_sum[9]));
  FDCE \pos_count_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_7 ),
        .Q(pos_count[0]));
  FDCE \pos_count_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_6 ),
        .Q(pos_count[1]));
  FDCE \pos_count_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_5 ),
        .Q(pos_count[2]));
  FDCE \pos_count_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry_n_4 ),
        .Q(pos_count[3]));
  FDCE \pos_count_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_7 ),
        .Q(pos_count[4]));
  FDCE \pos_count_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_6 ),
        .Q(pos_count[5]));
  FDCE \pos_count_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_5 ),
        .Q(pos_count[6]));
  FDCE \pos_count_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\_inferred__0/i__carry__0_n_4 ),
        .Q(pos_count[7]));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[0]),
        .Q(\pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[1]),
        .Q(\pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[2]),
        .Q(\pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[3]),
        .Q(\pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[4]),
        .Q(\pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[5]),
        .Q(\pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[6]),
        .Q(\pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  (* srl_bus_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7] " *) 
  (* srl_name = "\\U0/DUT_velocity_reader/pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 " *) 
  SRL16E \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(ten_ms_pulse),
        .CLK(mclk),
        .D(pos_count[7]),
        .Q(\pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ));
  FDRE \pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDRE \pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .D(\pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0 ),
        .Q(\pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .R(1'b0));
  FDCE \pos_shift_reg[9][0] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__6_n_0),
        .Q(\pos_shift_reg[9] [0]));
  FDCE \pos_shift_reg[9][1] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__5_n_0),
        .Q(\pos_shift_reg[9] [1]));
  FDCE \pos_shift_reg[9][2] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__4_n_0),
        .Q(\pos_shift_reg[9] [2]));
  FDCE \pos_shift_reg[9][3] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__3_n_0),
        .Q(\pos_shift_reg[9] [3]));
  FDCE \pos_shift_reg[9][4] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__2_n_0),
        .Q(\pos_shift_reg[9] [4]));
  FDCE \pos_shift_reg[9][5] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__1_n_0),
        .Q(\pos_shift_reg[9] [5]));
  FDCE \pos_shift_reg[9][6] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate__0_n_0),
        .Q(\pos_shift_reg[9] [6]));
  FDCE \pos_shift_reg[9][7] 
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_gate_n_0),
        .Q(\pos_shift_reg[9] [7]));
  FDCE pos_shift_reg_c
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(1'b1),
        .Q(pos_shift_reg_c_n_0));
  FDCE pos_shift_reg_c_0
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_n_0),
        .Q(pos_shift_reg_c_0_n_0));
  FDCE pos_shift_reg_c_1
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_0_n_0),
        .Q(pos_shift_reg_c_1_n_0));
  FDCE pos_shift_reg_c_2
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_1_n_0),
        .Q(pos_shift_reg_c_2_n_0));
  FDCE pos_shift_reg_c_3
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_2_n_0),
        .Q(pos_shift_reg_c_3_n_0));
  FDCE pos_shift_reg_c_4
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_3_n_0),
        .Q(pos_shift_reg_c_4_n_0));
  FDCE pos_shift_reg_c_5
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_4_n_0),
        .Q(pos_shift_reg_c_5_n_0));
  FDCE pos_shift_reg_c_6
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_5_n_0),
        .Q(pos_shift_reg_c_6_n_0));
  FDCE pos_shift_reg_c_7
       (.C(mclk),
        .CE(ten_ms_pulse),
        .CLR(reset),
        .D(pos_shift_reg_c_6_n_0),
        .Q(pos_shift_reg_c_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate
       (.I0(\pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__0
       (.I0(\pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__1
       (.I0(\pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__2
       (.I0(\pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__3
       (.I0(\pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__4
       (.I0(\pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__5
       (.I0(\pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    pos_shift_reg_gate__6
       (.I0(\pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0 ),
        .I1(pos_shift_reg_c_7_n_0),
        .O(pos_shift_reg_gate__6_n_0));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[0]_i_2 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[0]),
        .O(\rcount[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[0]_i_3 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[3]),
        .O(\rcount[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[0]_i_4 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[2]),
        .O(\rcount[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[0]_i_5 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[1]),
        .O(\rcount[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFF1511)) 
    \rcount[0]_i_6 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[0]),
        .O(\rcount[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \rcount[0]_i_7 
       (.I0(rcount_reg[8]),
        .I1(rcount_reg[7]),
        .I2(rcount_reg[6]),
        .O(\rcount[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \rcount[0]_i_8 
       (.I0(rcount_reg[4]),
        .I1(rcount_reg[2]),
        .I2(rcount_reg[1]),
        .I3(rcount_reg[5]),
        .I4(rcount_reg[0]),
        .I5(rcount_reg[3]),
        .O(\rcount[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h1FFFFFFFFFFFFFFF)) 
    \rcount[0]_i_9 
       (.I0(rcount_reg[15]),
        .I1(rcount_reg[14]),
        .I2(rcount_reg[16]),
        .I3(rcount_reg[19]),
        .I4(rcount_reg[17]),
        .I5(rcount_reg[18]),
        .O(\rcount[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[12]_i_2 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[15]),
        .O(\rcount[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[12]_i_3 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[14]),
        .O(\rcount[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[12]_i_4 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[13]),
        .O(\rcount[12]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[12]_i_5 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[12]),
        .O(\rcount[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[16]_i_2 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[19]),
        .O(\rcount[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[16]_i_3 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[18]),
        .O(\rcount[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[16]_i_4 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[17]),
        .O(\rcount[16]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[16]_i_5 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[16]),
        .O(\rcount[16]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[4]_i_2 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[7]),
        .O(\rcount[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[4]_i_3 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[6]),
        .O(\rcount[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[4]_i_4 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[5]),
        .O(\rcount[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[4]_i_5 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[4]),
        .O(\rcount[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[8]_i_2 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[11]),
        .O(\rcount[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[8]_i_3 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[10]),
        .O(\rcount[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hCCCC0400)) 
    \rcount[8]_i_4 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .O(\rcount[8]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF151100000000)) 
    \rcount[8]_i_5 
       (.I0(\moving_sum[11]_i_2_n_0 ),
        .I1(rcount_reg[9]),
        .I2(\rcount[0]_i_7_n_0 ),
        .I3(\rcount[0]_i_8_n_0 ),
        .I4(\rcount[0]_i_9_n_0 ),
        .I5(rcount_reg[8]),
        .O(\rcount[8]_i_5_n_0 ));
  FDCE \rcount_reg[0] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_7 ),
        .Q(rcount_reg[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\rcount_reg[0]_i_1_n_0 ,\rcount_reg[0]_i_1_n_1 ,\rcount_reg[0]_i_1_n_2 ,\rcount_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\rcount[0]_i_2_n_0 }),
        .O({\rcount_reg[0]_i_1_n_4 ,\rcount_reg[0]_i_1_n_5 ,\rcount_reg[0]_i_1_n_6 ,\rcount_reg[0]_i_1_n_7 }),
        .S({\rcount[0]_i_3_n_0 ,\rcount[0]_i_4_n_0 ,\rcount[0]_i_5_n_0 ,\rcount[0]_i_6_n_0 }));
  FDCE \rcount_reg[10] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_5 ),
        .Q(rcount_reg[10]));
  FDCE \rcount_reg[11] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_4 ),
        .Q(rcount_reg[11]));
  FDCE \rcount_reg[12] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_7 ),
        .Q(rcount_reg[12]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[12]_i_1 
       (.CI(\rcount_reg[8]_i_1_n_0 ),
        .CO({\rcount_reg[12]_i_1_n_0 ,\rcount_reg[12]_i_1_n_1 ,\rcount_reg[12]_i_1_n_2 ,\rcount_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[12]_i_1_n_4 ,\rcount_reg[12]_i_1_n_5 ,\rcount_reg[12]_i_1_n_6 ,\rcount_reg[12]_i_1_n_7 }),
        .S({\rcount[12]_i_2_n_0 ,\rcount[12]_i_3_n_0 ,\rcount[12]_i_4_n_0 ,\rcount[12]_i_5_n_0 }));
  FDCE \rcount_reg[13] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_6 ),
        .Q(rcount_reg[13]));
  FDCE \rcount_reg[14] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_5 ),
        .Q(rcount_reg[14]));
  FDCE \rcount_reg[15] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[12]_i_1_n_4 ),
        .Q(rcount_reg[15]));
  FDCE \rcount_reg[16] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_7 ),
        .Q(rcount_reg[16]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[16]_i_1 
       (.CI(\rcount_reg[12]_i_1_n_0 ),
        .CO({\NLW_rcount_reg[16]_i_1_CO_UNCONNECTED [3],\rcount_reg[16]_i_1_n_1 ,\rcount_reg[16]_i_1_n_2 ,\rcount_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[16]_i_1_n_4 ,\rcount_reg[16]_i_1_n_5 ,\rcount_reg[16]_i_1_n_6 ,\rcount_reg[16]_i_1_n_7 }),
        .S({\rcount[16]_i_2_n_0 ,\rcount[16]_i_3_n_0 ,\rcount[16]_i_4_n_0 ,\rcount[16]_i_5_n_0 }));
  FDCE \rcount_reg[17] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_6 ),
        .Q(rcount_reg[17]));
  FDCE \rcount_reg[18] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_5 ),
        .Q(rcount_reg[18]));
  FDCE \rcount_reg[19] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[16]_i_1_n_4 ),
        .Q(rcount_reg[19]));
  FDCE \rcount_reg[1] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_6 ),
        .Q(rcount_reg[1]));
  FDCE \rcount_reg[2] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_5 ),
        .Q(rcount_reg[2]));
  FDCE \rcount_reg[3] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[0]_i_1_n_4 ),
        .Q(rcount_reg[3]));
  FDCE \rcount_reg[4] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_7 ),
        .Q(rcount_reg[4]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[4]_i_1 
       (.CI(\rcount_reg[0]_i_1_n_0 ),
        .CO({\rcount_reg[4]_i_1_n_0 ,\rcount_reg[4]_i_1_n_1 ,\rcount_reg[4]_i_1_n_2 ,\rcount_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[4]_i_1_n_4 ,\rcount_reg[4]_i_1_n_5 ,\rcount_reg[4]_i_1_n_6 ,\rcount_reg[4]_i_1_n_7 }),
        .S({\rcount[4]_i_2_n_0 ,\rcount[4]_i_3_n_0 ,\rcount[4]_i_4_n_0 ,\rcount[4]_i_5_n_0 }));
  FDCE \rcount_reg[5] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_6 ),
        .Q(rcount_reg[5]));
  FDCE \rcount_reg[6] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_5 ),
        .Q(rcount_reg[6]));
  FDCE \rcount_reg[7] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[4]_i_1_n_4 ),
        .Q(rcount_reg[7]));
  FDCE \rcount_reg[8] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_7 ),
        .Q(rcount_reg[8]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rcount_reg[8]_i_1 
       (.CI(\rcount_reg[4]_i_1_n_0 ),
        .CO({\rcount_reg[8]_i_1_n_0 ,\rcount_reg[8]_i_1_n_1 ,\rcount_reg[8]_i_1_n_2 ,\rcount_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\rcount_reg[8]_i_1_n_4 ,\rcount_reg[8]_i_1_n_5 ,\rcount_reg[8]_i_1_n_6 ,\rcount_reg[8]_i_1_n_7 }),
        .S({\rcount[8]_i_2_n_0 ,\rcount[8]_i_3_n_0 ,\rcount[8]_i_4_n_0 ,\rcount[8]_i_5_n_0 }));
  FDCE \rcount_reg[9] 
       (.C(mclk),
        .CE(1'b1),
        .CLR(reset),
        .D(\rcount_reg[8]_i_1_n_6 ),
        .Q(rcount_reg[9]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 velocity1_carry
       (.CI(1'b0),
        .CO({velocity1,velocity1_carry_n_1,velocity1_carry_n_2,velocity1_carry_n_3}),
        .CYINIT(1'b0),
        .DI({velocity1_carry_i_1_n_0,1'b0,velocity1_carry_i_2_n_0,velocity2}),
        .O(NLW_velocity1_carry_O_UNCONNECTED[3:0]),
        .S({velocity1_carry_i_4_n_0,velocity1_carry_i_5_n_0,velocity1_carry_i_6_n_0,velocity1_carry_i_7_n_0}));
  LUT4 #(
    .INIT(16'h0CAC)) 
    velocity1_carry_i_1
       (.I0(velocity3[10]),
        .I1(moving_sum[10]),
        .I2(moving_sum[11]),
        .I3(velocity3[11]),
        .O(velocity1_carry_i_1_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_10
       (.CI(1'b0),
        .CO({velocity1_carry_i_10_n_0,velocity1_carry_i_10_n_1,velocity1_carry_i_10_n_2,velocity1_carry_i_10_n_3}),
        .CYINIT(\velocity[1]_INST_0_i_2_n_0 ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({velocity3[4],NLW_velocity1_carry_i_10_O_UNCONNECTED[2:0]}),
        .S({velocity1_carry_i_18_n_0,velocity1_carry_i_19_n_0,velocity1_carry_i_20_n_0,velocity1_carry_i_21_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_11
       (.I0(moving_sum[11]),
        .O(velocity1_carry_i_11_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_12
       (.I0(moving_sum[10]),
        .O(velocity1_carry_i_12_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_13
       (.I0(moving_sum[9]),
        .O(velocity1_carry_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_14
       (.I0(moving_sum[8]),
        .O(velocity1_carry_i_14_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_15
       (.I0(moving_sum[7]),
        .O(velocity1_carry_i_15_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_16
       (.I0(moving_sum[6]),
        .O(velocity1_carry_i_16_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_17
       (.I0(moving_sum[5]),
        .O(velocity1_carry_i_17_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_18
       (.I0(moving_sum[4]),
        .O(velocity1_carry_i_18_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_19
       (.I0(moving_sum[3]),
        .O(velocity1_carry_i_19_n_0));
  LUT5 #(
    .INIT(32'hFFBBFCB8)) 
    velocity1_carry_i_2
       (.I0(velocity3[6]),
        .I1(moving_sum[11]),
        .I2(moving_sum[6]),
        .I3(velocity3[7]),
        .I4(moving_sum[7]),
        .O(velocity1_carry_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_20
       (.I0(moving_sum[2]),
        .O(velocity1_carry_i_20_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    velocity1_carry_i_21
       (.I0(moving_sum[1]),
        .O(velocity1_carry_i_21_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    velocity1_carry_i_3
       (.I0(velocity3[5]),
        .I1(moving_sum[11]),
        .I2(moving_sum[5]),
        .O(velocity2));
  LUT4 #(
    .INIT(16'h0353)) 
    velocity1_carry_i_4
       (.I0(velocity3[10]),
        .I1(moving_sum[10]),
        .I2(moving_sum[11]),
        .I3(velocity3[11]),
        .O(velocity1_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    velocity1_carry_i_5
       (.I0(moving_sum[9]),
        .I1(velocity3[9]),
        .I2(moving_sum[8]),
        .I3(moving_sum[11]),
        .I4(velocity3[8]),
        .O(velocity1_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h00053305)) 
    velocity1_carry_i_6
       (.I0(moving_sum[7]),
        .I1(velocity3[7]),
        .I2(moving_sum[6]),
        .I3(moving_sum[11]),
        .I4(velocity3[6]),
        .O(velocity1_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h000ACC0A)) 
    velocity1_carry_i_7
       (.I0(moving_sum[4]),
        .I1(velocity3[4]),
        .I2(moving_sum[5]),
        .I3(moving_sum[11]),
        .I4(velocity3[5]),
        .O(velocity1_carry_i_7_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_8
       (.CI(velocity1_carry_i_9_n_0),
        .CO({NLW_velocity1_carry_i_8_CO_UNCONNECTED[3:2],velocity1_carry_i_8_n_2,velocity1_carry_i_8_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_velocity1_carry_i_8_O_UNCONNECTED[3],velocity3[11:9]}),
        .S({1'b0,velocity1_carry_i_11_n_0,velocity1_carry_i_12_n_0,velocity1_carry_i_13_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 velocity1_carry_i_9
       (.CI(velocity1_carry_i_10_n_0),
        .CO({velocity1_carry_i_9_n_0,velocity1_carry_i_9_n_1,velocity1_carry_i_9_n_2,velocity1_carry_i_9_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(velocity3[8:5]),
        .S({velocity1_carry_i_14_n_0,velocity1_carry_i_15_n_0,velocity1_carry_i_16_n_0,velocity1_carry_i_17_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hFFB8)) 
    \velocity[0]_INST_0 
       (.I0(ARG3[3]),
        .I1(moving_sum[11]),
        .I2(moving_sum[3]),
        .I3(velocity1),
        .O(velocity[0]));
  LUT5 #(
    .INIT(32'h00004EE4)) 
    \velocity[1]_INST_0 
       (.I0(moving_sum[11]),
        .I1(moving_sum[4]),
        .I2(ARG3[3]),
        .I3(ARG3[4]),
        .I4(velocity1),
        .O(\moving_sum_reg[11]_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \velocity[1]_INST_0_i_1 
       (.CI(1'b0),
        .CO({\velocity[1]_INST_0_i_1_n_0 ,\velocity[1]_INST_0_i_1_n_1 ,\velocity[1]_INST_0_i_1_n_2 ,\velocity[1]_INST_0_i_1_n_3 }),
        .CYINIT(\velocity[1]_INST_0_i_2_n_0 ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({ARG3[4:3],\NLW_velocity[1]_INST_0_i_1_O_UNCONNECTED [1:0]}),
        .S({\velocity[1]_INST_0_i_3_n_0 ,\velocity[1]_INST_0_i_4_n_0 ,\velocity[1]_INST_0_i_5_n_0 ,\velocity[1]_INST_0_i_6_n_0 }));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[1]_INST_0_i_2 
       (.I0(moving_sum[0]),
        .O(\velocity[1]_INST_0_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[1]_INST_0_i_3 
       (.I0(moving_sum[4]),
        .O(\velocity[1]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[1]_INST_0_i_4 
       (.I0(moving_sum[3]),
        .O(\velocity[1]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[1]_INST_0_i_5 
       (.I0(moving_sum[2]),
        .O(\velocity[1]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[1]_INST_0_i_6 
       (.I0(moving_sum[1]),
        .O(\velocity[1]_INST_0_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h54040454)) 
    \velocity[2]_INST_0 
       (.I0(velocity1),
        .I1(moving_sum[5]),
        .I2(moving_sum[11]),
        .I3(ARG3[5]),
        .I4(\velocity[3]_INST_0_i_1_n_0 ),
        .O(\moving_sum_reg[5]_0 ));
  LUT6 #(
    .INIT(64'h1032103232101032)) 
    \velocity[3]_INST_0 
       (.I0(moving_sum[11]),
        .I1(velocity1),
        .I2(moving_sum[6]),
        .I3(ARG3[6]),
        .I4(\velocity[3]_INST_0_i_1_n_0 ),
        .I5(\velocity[3]_INST_0_i_2_n_0 ),
        .O(velocity[1]));
  LUT5 #(
    .INIT(32'h00053305)) 
    \velocity[3]_INST_0_i_1 
       (.I0(moving_sum[4]),
        .I1(ARG3[4]),
        .I2(moving_sum[3]),
        .I3(moving_sum[11]),
        .I4(ARG3[3]),
        .O(\velocity[3]_INST_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \velocity[3]_INST_0_i_2 
       (.I0(ARG3[5]),
        .I1(moving_sum[11]),
        .I2(moving_sum[5]),
        .O(\velocity[3]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h0000CA3A)) 
    \velocity[4]_INST_0 
       (.I0(moving_sum[7]),
        .I1(ARG3[7]),
        .I2(moving_sum[11]),
        .I3(\velocity[5]_INST_0_i_2_n_0 ),
        .I4(velocity1),
        .O(velocity[2]));
  LUT6 #(
    .INIT(64'h3210103210321032)) 
    \velocity[5]_INST_0 
       (.I0(moving_sum[11]),
        .I1(velocity1),
        .I2(moving_sum[8]),
        .I3(ARG3[8]),
        .I4(\velocity[5]_INST_0_i_2_n_0 ),
        .I5(\velocity[5]_INST_0_i_3_n_0 ),
        .O(\moving_sum_reg[11]_1 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \velocity[5]_INST_0_i_1 
       (.CI(\velocity[1]_INST_0_i_1_n_0 ),
        .CO({\velocity[5]_INST_0_i_1_n_0 ,\velocity[5]_INST_0_i_1_n_1 ,\velocity[5]_INST_0_i_1_n_2 ,\velocity[5]_INST_0_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(ARG3[8:5]),
        .S({\velocity[5]_INST_0_i_4_n_0 ,\velocity[5]_INST_0_i_5_n_0 ,\velocity[5]_INST_0_i_6_n_0 ,\velocity[5]_INST_0_i_7_n_0 }));
  LUT6 #(
    .INIT(64'h0000050022002700)) 
    \velocity[5]_INST_0_i_2 
       (.I0(moving_sum[11]),
        .I1(ARG3[5]),
        .I2(moving_sum[5]),
        .I3(\velocity[3]_INST_0_i_1_n_0 ),
        .I4(moving_sum[6]),
        .I5(ARG3[6]),
        .O(\velocity[5]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h35)) 
    \velocity[5]_INST_0_i_3 
       (.I0(moving_sum[7]),
        .I1(ARG3[7]),
        .I2(moving_sum[11]),
        .O(\velocity[5]_INST_0_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[5]_INST_0_i_4 
       (.I0(moving_sum[8]),
        .O(\velocity[5]_INST_0_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[5]_INST_0_i_5 
       (.I0(moving_sum[7]),
        .O(\velocity[5]_INST_0_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[5]_INST_0_i_6 
       (.I0(moving_sum[6]),
        .O(\velocity[5]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[5]_INST_0_i_7 
       (.I0(moving_sum[5]),
        .O(\velocity[5]_INST_0_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[6]_INST_0 
       (.I0(\velocity[6]_INST_0_i_1_n_0 ),
        .O(velocity[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hABFBFBAB)) 
    \velocity[6]_INST_0_i_1 
       (.I0(velocity1),
        .I1(moving_sum[9]),
        .I2(moving_sum[11]),
        .I3(ARG3[9]),
        .I4(\velocity[7]_INST_0_i_2_n_0 ),
        .O(\velocity[6]_INST_0_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[7]_INST_0 
       (.I0(\velocity[7]_INST_0_i_1_n_0 ),
        .O(velocity[4]));
  LUT6 #(
    .INIT(64'h000000005555555D)) 
    \velocity[7]_INST_0_i_1 
       (.I0(moving_sum[11]),
        .I1(\velocity[7]_INST_0_i_2_n_0 ),
        .I2(\velocity[7]_INST_0_i_3_n_0 ),
        .I3(ARG3[11]),
        .I4(ARG3[10]),
        .I5(velocity1),
        .O(\velocity[7]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \velocity[7]_INST_0_i_2 
       (.I0(\velocity[7]_INST_0_i_5_n_0 ),
        .I1(\velocity[5]_INST_0_i_3_n_0 ),
        .I2(\velocity[3]_INST_0_i_2_n_0 ),
        .I3(\velocity[3]_INST_0_i_1_n_0 ),
        .I4(\velocity[7]_INST_0_i_6_n_0 ),
        .O(\velocity[7]_INST_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \velocity[7]_INST_0_i_3 
       (.I0(ARG3[9]),
        .I1(moving_sum[11]),
        .I2(moving_sum[9]),
        .O(\velocity[7]_INST_0_i_3_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \velocity[7]_INST_0_i_4 
       (.CI(\velocity[5]_INST_0_i_1_n_0 ),
        .CO({\NLW_velocity[7]_INST_0_i_4_CO_UNCONNECTED [3:2],\velocity[7]_INST_0_i_4_n_2 ,\velocity[7]_INST_0_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_velocity[7]_INST_0_i_4_O_UNCONNECTED [3],ARG3[11:9]}),
        .S({1'b0,\velocity[7]_INST_0_i_7_n_0 ,\velocity[7]_INST_0_i_8_n_0 ,\velocity[7]_INST_0_i_9_n_0 }));
  LUT3 #(
    .INIT(8'h35)) 
    \velocity[7]_INST_0_i_5 
       (.I0(moving_sum[8]),
        .I1(ARG3[8]),
        .I2(moving_sum[11]),
        .O(\velocity[7]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \velocity[7]_INST_0_i_6 
       (.I0(ARG3[6]),
        .I1(moving_sum[11]),
        .I2(moving_sum[6]),
        .O(\velocity[7]_INST_0_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[7]_INST_0_i_7 
       (.I0(moving_sum[11]),
        .O(\velocity[7]_INST_0_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[7]_INST_0_i_8 
       (.I0(moving_sum[10]),
        .O(\velocity[7]_INST_0_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \velocity[7]_INST_0_i_9 
       (.I0(moving_sum[9]),
        .O(\velocity[7]_INST_0_i_9_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
