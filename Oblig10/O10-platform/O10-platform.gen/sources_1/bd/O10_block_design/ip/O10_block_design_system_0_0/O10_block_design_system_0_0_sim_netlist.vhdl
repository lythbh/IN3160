-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Tue Apr 29 13:26:33 2025
-- Host        : peregrin.ifi.uio.no running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim
--               /uio/hume/student-u39/lythbh/IN3160/Oblig10/O10-platform/O10-platform.gen/sources_1/bd/O10_block_design/ip/O10_block_design_system_0_0/O10_block_design_system_0_0_sim_netlist.vhdl
-- Design      : O10_block_design_system_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_input_synchronizer is
  port (
    SB_synch_sig : out STD_LOGIC;
    SA_synch_sig : out STD_LOGIC;
    reset : in STD_LOGIC;
    SB : in STD_LOGIC;
    mclk : in STD_LOGIC;
    SA : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_input_synchronizer : entity is "input_synchronizer";
end O10_block_design_system_0_0_input_synchronizer;

architecture STRUCTURE of O10_block_design_system_0_0_input_synchronizer is
  signal ffa : STD_LOGIC;
  signal ffb : STD_LOGIC;
begin
SA_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => ffa,
      Q => SA_synch_sig,
      R => reset
    );
SB_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => ffb,
      Q => SB_synch_sig,
      R => reset
    );
ffa_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      D => SA,
      Q => ffa,
      R => reset
    );
ffb_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      D => SB,
      Q => ffb,
      R => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_output_synchronizer is
  port (
    en_synch_out : out STD_LOGIC;
    dir_synch_out : out STD_LOGIC;
    duty_cycle_4_sp_1 : out STD_LOGIC;
    duty_cycle_2_sp_1 : out STD_LOGIC;
    duty_cycle_0_sp_1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    en_sig : in STD_LOGIC;
    mclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    duty_cycle : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_output_synchronizer : entity is "output_synchronizer";
end O10_block_design_system_0_0_output_synchronizer;

architecture STRUCTURE of O10_block_design_system_0_0_output_synchronizer is
  signal duty_cycle_0_sn_1 : STD_LOGIC;
  signal duty_cycle_2_sn_1 : STD_LOGIC;
  signal duty_cycle_4_sn_1 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of en0_carry_i_10 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of en0_carry_i_11 : label is "soft_lutpair0";
begin
  duty_cycle_0_sp_1 <= duty_cycle_0_sn_1;
  duty_cycle_2_sp_1 <= duty_cycle_2_sn_1;
  duty_cycle_4_sp_1 <= duty_cycle_4_sn_1;
dir_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => Q(0),
      Q => dir_synch_out,
      R => reset
    );
en0_carry_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => duty_cycle(2),
      I1 => duty_cycle(0),
      I2 => duty_cycle(1),
      I3 => duty_cycle(3),
      O => duty_cycle_2_sn_1
    );
en0_carry_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => duty_cycle(0),
      I1 => duty_cycle(1),
      O => duty_cycle_0_sn_1
    );
en0_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => duty_cycle(4),
      I1 => duty_cycle(2),
      I2 => duty_cycle(0),
      I3 => duty_cycle(1),
      I4 => duty_cycle(3),
      I5 => duty_cycle(5),
      O => duty_cycle_4_sn_1
    );
en_synch_reg: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => '1',
      D => en_sig,
      Q => en_synch_out,
      R => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_pulse_width_modulator is
  port (
    en_sig : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    duty_cycle : in STD_LOGIC_VECTOR ( 7 downto 0 );
    en0_carry_0 : in STD_LOGIC;
    en0_carry_1 : in STD_LOGIC;
    en0_carry_2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_pulse_width_modulator : entity is "pulse_width_modulator";
end O10_block_design_system_0_0_pulse_width_modulator;

architecture STRUCTURE of O10_block_design_system_0_0_pulse_width_modulator is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \counter[0]_i_2_n_0\ : STD_LOGIC;
  signal counter_reg : STD_LOGIC_VECTOR ( 13 downto 7 );
  signal \counter_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter_reg_n_0_[0]\ : STD_LOGIC;
  signal \counter_reg_n_0_[1]\ : STD_LOGIC;
  signal \counter_reg_n_0_[2]\ : STD_LOGIC;
  signal \counter_reg_n_0_[3]\ : STD_LOGIC;
  signal \counter_reg_n_0_[4]\ : STD_LOGIC;
  signal \counter_reg_n_0_[5]\ : STD_LOGIC;
  signal \counter_reg_n_0_[6]\ : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal en0_carry_i_1_n_0 : STD_LOGIC;
  signal en0_carry_i_2_n_0 : STD_LOGIC;
  signal en0_carry_i_3_n_0 : STD_LOGIC;
  signal en0_carry_i_4_n_0 : STD_LOGIC;
  signal en0_carry_i_5_n_0 : STD_LOGIC;
  signal en0_carry_i_6_n_0 : STD_LOGIC;
  signal en0_carry_i_7_n_0 : STD_LOGIC;
  signal en0_carry_i_8_n_0 : STD_LOGIC;
  signal en0_carry_n_0 : STD_LOGIC;
  signal en0_carry_n_1 : STD_LOGIC;
  signal en0_carry_n_2 : STD_LOGIC;
  signal en0_carry_n_3 : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_counter_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_counter_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_en0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[0]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[1]_i_1\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "forward_idle:10,forward:11,reverse_idle:00,reverse:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "forward_idle:10,forward:11,reverse_idle:00,reverse:01";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \counter_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \counter_reg[8]_i_1\ : label is 11;
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of en0_carry : label is 11;
begin
  Q(0) <= \^q\(0);
\FSM_sequential_current_state[0]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => duty_cycle(7),
      O => next_state(0)
    );
\FSM_sequential_current_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \^q\(0),
      I1 => current_state(0),
      I2 => duty_cycle(7),
      O => next_state(1)
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_state(0),
      Q => current_state(0)
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_state(1),
      Q => \^q\(0)
    );
\counter[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \counter_reg_n_0_[0]\,
      O => \counter[0]_i_2_n_0\
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[0]_i_1_n_7\,
      Q => \counter_reg_n_0_[0]\
    );
\counter_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter_reg[0]_i_1_n_0\,
      CO(2) => \counter_reg[0]_i_1_n_1\,
      CO(1) => \counter_reg[0]_i_1_n_2\,
      CO(0) => \counter_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \counter_reg[0]_i_1_n_4\,
      O(2) => \counter_reg[0]_i_1_n_5\,
      O(1) => \counter_reg[0]_i_1_n_6\,
      O(0) => \counter_reg[0]_i_1_n_7\,
      S(3) => \counter_reg_n_0_[3]\,
      S(2) => \counter_reg_n_0_[2]\,
      S(1) => \counter_reg_n_0_[1]\,
      S(0) => \counter[0]_i_2_n_0\
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[8]_i_1_n_5\,
      Q => counter_reg(10)
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[8]_i_1_n_4\,
      Q => counter_reg(11)
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[12]_i_1_n_7\,
      Q => counter_reg(12)
    );
\counter_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[8]_i_1_n_0\,
      CO(3 downto 1) => \NLW_counter_reg[12]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \counter_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_counter_reg[12]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \counter_reg[12]_i_1_n_6\,
      O(0) => \counter_reg[12]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1 downto 0) => counter_reg(13 downto 12)
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[12]_i_1_n_6\,
      Q => counter_reg(13)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[0]_i_1_n_6\,
      Q => \counter_reg_n_0_[1]\
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[0]_i_1_n_5\,
      Q => \counter_reg_n_0_[2]\
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[0]_i_1_n_4\,
      Q => \counter_reg_n_0_[3]\
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[4]_i_1_n_7\,
      Q => \counter_reg_n_0_[4]\
    );
\counter_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[0]_i_1_n_0\,
      CO(3) => \counter_reg[4]_i_1_n_0\,
      CO(2) => \counter_reg[4]_i_1_n_1\,
      CO(1) => \counter_reg[4]_i_1_n_2\,
      CO(0) => \counter_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[4]_i_1_n_4\,
      O(2) => \counter_reg[4]_i_1_n_5\,
      O(1) => \counter_reg[4]_i_1_n_6\,
      O(0) => \counter_reg[4]_i_1_n_7\,
      S(3) => counter_reg(7),
      S(2) => \counter_reg_n_0_[6]\,
      S(1) => \counter_reg_n_0_[5]\,
      S(0) => \counter_reg_n_0_[4]\
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[4]_i_1_n_6\,
      Q => \counter_reg_n_0_[5]\
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[4]_i_1_n_5\,
      Q => \counter_reg_n_0_[6]\
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[4]_i_1_n_4\,
      Q => counter_reg(7)
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[8]_i_1_n_7\,
      Q => counter_reg(8)
    );
\counter_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter_reg[4]_i_1_n_0\,
      CO(3) => \counter_reg[8]_i_1_n_0\,
      CO(2) => \counter_reg[8]_i_1_n_1\,
      CO(1) => \counter_reg[8]_i_1_n_2\,
      CO(0) => \counter_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \counter_reg[8]_i_1_n_4\,
      O(2) => \counter_reg[8]_i_1_n_5\,
      O(1) => \counter_reg[8]_i_1_n_6\,
      O(0) => \counter_reg[8]_i_1_n_7\,
      S(3 downto 0) => counter_reg(11 downto 8)
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \counter_reg[8]_i_1_n_6\,
      Q => counter_reg(9)
    );
en0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => en0_carry_n_0,
      CO(2) => en0_carry_n_1,
      CO(1) => en0_carry_n_2,
      CO(0) => en0_carry_n_3,
      CYINIT => '0',
      DI(3) => en0_carry_i_1_n_0,
      DI(2) => en0_carry_i_2_n_0,
      DI(1) => en0_carry_i_3_n_0,
      DI(0) => en0_carry_i_4_n_0,
      O(3 downto 0) => NLW_en0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => en0_carry_i_5_n_0,
      S(2) => en0_carry_i_6_n_0,
      S(1) => en0_carry_i_7_n_0,
      S(0) => en0_carry_i_8_n_0
    );
en0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7414"
    )
        port map (
      I0 => counter_reg(13),
      I1 => duty_cycle(6),
      I2 => duty_cycle(7),
      I3 => en0_carry_2,
      O => en0_carry_i_1_n_0
    );
en0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1055450051DDC744"
    )
        port map (
      I0 => counter_reg(12),
      I1 => duty_cycle(4),
      I2 => en0_carry_1,
      I3 => duty_cycle(7),
      I4 => duty_cycle(5),
      I5 => counter_reg(11),
      O => en0_carry_i_2_n_0
    );
en0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1055450051DDC744"
    )
        port map (
      I0 => counter_reg(10),
      I1 => duty_cycle(2),
      I2 => en0_carry_0,
      I3 => duty_cycle(7),
      I4 => duty_cycle(3),
      I5 => counter_reg(9),
      O => en0_carry_i_3_n_0
    );
en0_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14447D44"
    )
        port map (
      I0 => counter_reg(8),
      I1 => duty_cycle(1),
      I2 => duty_cycle(7),
      I3 => duty_cycle(0),
      I4 => counter_reg(7),
      O => en0_carry_i_4_n_0
    );
en0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8969"
    )
        port map (
      I0 => counter_reg(13),
      I1 => duty_cycle(6),
      I2 => duty_cycle(7),
      I3 => en0_carry_2,
      O => en0_carry_i_5_n_0
    );
en0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6006909009600909"
    )
        port map (
      I0 => duty_cycle(5),
      I1 => counter_reg(12),
      I2 => duty_cycle(4),
      I3 => en0_carry_1,
      I4 => duty_cycle(7),
      I5 => counter_reg(11),
      O => en0_carry_i_6_n_0
    );
en0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6090069009096009"
    )
        port map (
      I0 => duty_cycle(3),
      I1 => counter_reg(10),
      I2 => duty_cycle(2),
      I3 => duty_cycle(7),
      I4 => en0_carry_0,
      I5 => counter_reg(9),
      O => en0_carry_i_7_n_0
    );
en0_carry_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"690000C3"
    )
        port map (
      I0 => duty_cycle(7),
      I1 => duty_cycle(1),
      I2 => counter_reg(8),
      I3 => duty_cycle(0),
      I4 => counter_reg(7),
      O => en0_carry_i_8_n_0
    );
en_synch_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => en0_carry_n_0,
      I1 => current_state(0),
      O => en_sig
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_quadrature_decoder is
  port (
    DI : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \FSM_sequential_current_state_reg[2]_0\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    SA_synch_sig : in STD_LOGIC;
    SB_synch_sig : in STD_LOGIC;
    \pos_count_reg[3]\ : in STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_quadrature_decoder : entity is "quadrature_decoder";
end O10_block_design_system_0_0_quadrature_decoder;

architecture STRUCTURE of O10_block_design_system_0_0_quadrature_decoder is
  signal \FSM_sequential_current_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_current_state[2]_i_1_n_0\ : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[1]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[2]_i_1\ : label is "soft_lutpair3";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "s_init:001,s_1:100,s_0:101,s_2:011,s_reset:000,s_3:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "s_init:001,s_1:100,s_0:101,s_2:011,s_reset:000,s_3:010";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[2]\ : label is "s_init:001,s_1:100,s_0:101,s_2:011,s_reset:000,s_3:010";
  attribute SOFT_HLUTNM of \i__carry_i_11\ : label is "soft_lutpair2";
begin
\FSM_sequential_current_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8919899F"
    )
        port map (
      I0 => SB_synch_sig,
      I1 => SA_synch_sig,
      I2 => current_state(0),
      I3 => current_state(1),
      I4 => current_state(2),
      O => \FSM_sequential_current_state[0]_i_1_n_0\
    );
\FSM_sequential_current_state[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA2A80"
    )
        port map (
      I0 => SA_synch_sig,
      I1 => current_state(2),
      I2 => SB_synch_sig,
      I3 => current_state(0),
      I4 => current_state(1),
      O => \FSM_sequential_current_state[1]_i_1__0_n_0\
    );
\FSM_sequential_current_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFB4"
    )
        port map (
      I0 => SB_synch_sig,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => current_state(2),
      I4 => SA_synch_sig,
      O => \FSM_sequential_current_state[2]_i_1_n_0\
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \FSM_sequential_current_state[0]_i_1_n_0\,
      Q => current_state(0)
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \FSM_sequential_current_state[1]_i_1__0_n_0\,
      Q => current_state(1)
    );
\FSM_sequential_current_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \FSM_sequential_current_state[2]_i_1_n_0\,
      Q => current_state(2)
    );
\i__carry_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A40A004"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      I2 => SA_synch_sig,
      I3 => SB_synch_sig,
      I4 => current_state(0),
      O => \FSM_sequential_current_state_reg[2]_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAEABAEAAEABAAAA"
    )
        port map (
      I0 => \pos_count_reg[3]\,
      I1 => current_state(0),
      I2 => SB_synch_sig,
      I3 => SA_synch_sig,
      I4 => current_state(1),
      I5 => current_state(2),
      O => DI(1)
    );
\i__carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A40A004F5BF5FFB"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      I2 => SA_synch_sig,
      I3 => SB_synch_sig,
      I4 => current_state(0),
      I5 => \pos_count_reg[3]\,
      O => DI(0)
    );
\i__carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"966996699669AAAA"
    )
        port map (
      I0 => \pos_count_reg[3]\,
      I1 => current_state(0),
      I2 => SA_synch_sig,
      I3 => SB_synch_sig,
      I4 => current_state(1),
      I5 => current_state(2),
      O => S(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_seg7ctrl is
  port (
    c_reg_reg_0 : out STD_LOGIC;
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_seg7ctrl : entity is "seg7ctrl";
end O10_block_design_system_0_0_seg7ctrl;

architecture STRUCTURE of O10_block_design_system_0_0_seg7ctrl is
  signal c_reg : STD_LOGIC;
  signal c_reg_i_1_n_0 : STD_LOGIC;
  signal c_reg_i_3_n_0 : STD_LOGIC;
  signal c_reg_i_4_n_0 : STD_LOGIC;
  signal c_reg_i_5_n_0 : STD_LOGIC;
  signal c_reg_i_6_n_0 : STD_LOGIC;
  signal \^c_reg_reg_0\ : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 20 downto 1 );
  signal next_count : STD_LOGIC_VECTOR ( 20 downto 0 );
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_n_1\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal \plusOp_carry__3_n_1\ : STD_LOGIC;
  signal \plusOp_carry__3_n_2\ : STD_LOGIC;
  signal \plusOp_carry__3_n_3\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal \NLW_plusOp_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of c_reg_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \counter[10]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[11]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \counter[12]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[13]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \counter[14]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[15]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \counter[16]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[17]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \counter[18]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter[19]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \counter[20]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counter[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \counter[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \counter[5]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \counter[6]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \counter[8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \counter[9]_i_1\ : label is "soft_lutpair10";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of plusOp_carry : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__3\ : label is 35;
begin
  c_reg_reg_0 <= \^c_reg_reg_0\;
c_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => c_reg,
      I1 => \^c_reg_reg_0\,
      O => c_reg_i_1_n_0
    );
c_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => c_reg_i_3_n_0,
      I1 => counter(9),
      I2 => counter(14),
      I3 => counter(13),
      I4 => c_reg_i_4_n_0,
      I5 => c_reg_i_5_n_0,
      O => c_reg
    );
c_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => counter(17),
      I1 => counter(0),
      I2 => counter(3),
      I3 => counter(4),
      I4 => counter(6),
      I5 => counter(15),
      O => c_reg_i_3_n_0
    );
c_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter(12),
      I1 => counter(1),
      I2 => counter(11),
      I3 => counter(20),
      O => c_reg_i_4_n_0
    );
c_reg_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => counter(7),
      I1 => counter(19),
      I2 => counter(16),
      I3 => counter(8),
      I4 => c_reg_i_6_n_0,
      O => c_reg_i_5_n_0
    );
c_reg_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => counter(18),
      I1 => counter(2),
      I2 => counter(10),
      I3 => counter(5),
      O => c_reg_i_6_n_0
    );
c_reg_reg: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => c_reg_i_1_n_0,
      Q => \^c_reg_reg_0\
    );
\counter[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      I1 => c_reg,
      O => next_count(0)
    );
\counter[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(10),
      I1 => c_reg,
      O => next_count(10)
    );
\counter[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(11),
      I1 => c_reg,
      O => next_count(11)
    );
\counter[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(12),
      I1 => c_reg,
      O => next_count(12)
    );
\counter[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(13),
      I1 => c_reg,
      O => next_count(13)
    );
\counter[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(14),
      I1 => c_reg,
      O => next_count(14)
    );
\counter[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(15),
      I1 => c_reg,
      O => next_count(15)
    );
\counter[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(16),
      I1 => c_reg,
      O => next_count(16)
    );
\counter[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(17),
      I1 => c_reg,
      O => next_count(17)
    );
\counter[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(18),
      I1 => c_reg,
      O => next_count(18)
    );
\counter[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(19),
      I1 => c_reg,
      O => next_count(19)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(1),
      I1 => c_reg,
      O => next_count(1)
    );
\counter[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(20),
      I1 => c_reg,
      O => next_count(20)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(2),
      I1 => c_reg,
      O => next_count(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(3),
      I1 => c_reg,
      O => next_count(3)
    );
\counter[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(4),
      I1 => c_reg,
      O => next_count(4)
    );
\counter[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(5),
      I1 => c_reg,
      O => next_count(5)
    );
\counter[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(6),
      I1 => c_reg,
      O => next_count(6)
    );
\counter[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(7),
      I1 => c_reg,
      O => next_count(7)
    );
\counter[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(8),
      I1 => c_reg,
      O => next_count(8)
    );
\counter[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => data0(9),
      I1 => c_reg,
      O => next_count(9)
    );
\counter_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(0),
      Q => counter(0)
    );
\counter_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(10),
      Q => counter(10)
    );
\counter_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(11),
      Q => counter(11)
    );
\counter_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(12),
      Q => counter(12)
    );
\counter_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(13),
      Q => counter(13)
    );
\counter_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(14),
      Q => counter(14)
    );
\counter_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(15),
      Q => counter(15)
    );
\counter_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(16),
      Q => counter(16)
    );
\counter_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(17),
      Q => counter(17)
    );
\counter_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(18),
      Q => counter(18)
    );
\counter_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(19),
      Q => counter(19)
    );
\counter_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(1),
      Q => counter(1)
    );
\counter_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(20),
      Q => counter(20)
    );
\counter_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(2),
      Q => counter(2)
    );
\counter_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(3),
      Q => counter(3)
    );
\counter_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(4),
      Q => counter(4)
    );
\counter_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(5),
      Q => counter(5)
    );
\counter_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(6),
      Q => counter(6)
    );
\counter_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(7),
      Q => counter(7)
    );
\counter_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(8),
      Q => counter(8)
    );
\counter_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => next_count(9),
      Q => counter(9)
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => counter(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => counter(4 downto 1)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => counter(8 downto 5)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => counter(12 downto 9)
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3) => \plusOp_carry__2_n_0\,
      CO(2) => \plusOp_carry__2_n_1\,
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => counter(16 downto 13)
    );
\plusOp_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__2_n_0\,
      CO(3) => \NLW_plusOp_carry__3_CO_UNCONNECTED\(3),
      CO(2) => \plusOp_carry__3_n_1\,
      CO(1) => \plusOp_carry__3_n_2\,
      CO(0) => \plusOp_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => counter(20 downto 17)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_velocity_reader is
  port (
    \moving_sum_reg[11]_0\ : out STD_LOGIC;
    \moving_sum_reg[5]_0\ : out STD_LOGIC;
    \pos_count_reg[0]_0\ : out STD_LOGIC;
    \moving_sum_reg[11]_1\ : out STD_LOGIC;
    velocity : out STD_LOGIC_VECTOR ( 4 downto 0 );
    abcdefg_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    DI : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S : in STD_LOGIC_VECTOR ( 0 to 0 );
    abcdefg_out_2_sp_1 : in STD_LOGIC;
    \pos_count_reg[3]_0\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_velocity_reader : entity is "velocity_reader";
end O10_block_design_system_0_0_velocity_reader;

architecture STRUCTURE of O10_block_design_system_0_0_velocity_reader is
  signal ARG3 : STD_LOGIC_VECTOR ( 11 downto 3 );
  signal \_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \abcdefg_out[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[2]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[4]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \abcdefg_out[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \abcdefg_out[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal abcdefg_out_2_sn_1 : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_12_n_0\ : STD_LOGIC;
  signal \i__carry_i_13_n_0\ : STD_LOGIC;
  signal \i__carry_i_14_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_9_n_0\ : STD_LOGIC;
  signal moving_sum : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \moving_sum[11]_i_2_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_3_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_4_n_0\ : STD_LOGIC;
  signal \moving_sum[11]_i_5_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_1\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_2\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_3\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_4\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_5\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_6\ : STD_LOGIC;
  signal \moving_sum_next_carry__0_n_7\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_1\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_2\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_3\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_4\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_5\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_6\ : STD_LOGIC;
  signal \moving_sum_next_carry__1_n_7\ : STD_LOGIC;
  signal moving_sum_next_carry_i_1_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_2_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_3_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_4_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_5_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_6_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_7_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_i_8_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_n_0 : STD_LOGIC;
  signal moving_sum_next_carry_n_1 : STD_LOGIC;
  signal moving_sum_next_carry_n_2 : STD_LOGIC;
  signal moving_sum_next_carry_n_3 : STD_LOGIC;
  signal moving_sum_next_carry_n_4 : STD_LOGIC;
  signal moving_sum_next_carry_n_5 : STD_LOGIC;
  signal moving_sum_next_carry_n_6 : STD_LOGIC;
  signal moving_sum_next_carry_n_7 : STD_LOGIC;
  signal \^moving_sum_reg[11]_0\ : STD_LOGIC;
  signal \^moving_sum_reg[11]_1\ : STD_LOGIC;
  signal \^moving_sum_reg[5]_0\ : STD_LOGIC;
  signal pos_count : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\ : STD_LOGIC;
  signal \pos_shift_reg[9]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal pos_shift_reg_c_0_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_1_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_2_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_3_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_4_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_5_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_6_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_7_n_0 : STD_LOGIC;
  signal pos_shift_reg_c_n_0 : STD_LOGIC;
  signal \pos_shift_reg_gate__0_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__1_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__2_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__3_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__4_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__5_n_0\ : STD_LOGIC;
  signal \pos_shift_reg_gate__6_n_0\ : STD_LOGIC;
  signal pos_shift_reg_gate_n_0 : STD_LOGIC;
  signal \rcount[0]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_6_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_7_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_8_n_0\ : STD_LOGIC;
  signal \rcount[0]_i_9_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[12]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[16]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[4]_i_5_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_2_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_3_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_4_n_0\ : STD_LOGIC;
  signal \rcount[8]_i_5_n_0\ : STD_LOGIC;
  signal rcount_reg : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \rcount_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \rcount_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal ten_ms_pulse : STD_LOGIC;
  signal \^velocity\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal velocity1 : STD_LOGIC;
  signal velocity1_carry_i_10_n_0 : STD_LOGIC;
  signal velocity1_carry_i_10_n_1 : STD_LOGIC;
  signal velocity1_carry_i_10_n_2 : STD_LOGIC;
  signal velocity1_carry_i_10_n_3 : STD_LOGIC;
  signal velocity1_carry_i_11_n_0 : STD_LOGIC;
  signal velocity1_carry_i_12_n_0 : STD_LOGIC;
  signal velocity1_carry_i_13_n_0 : STD_LOGIC;
  signal velocity1_carry_i_14_n_0 : STD_LOGIC;
  signal velocity1_carry_i_15_n_0 : STD_LOGIC;
  signal velocity1_carry_i_16_n_0 : STD_LOGIC;
  signal velocity1_carry_i_17_n_0 : STD_LOGIC;
  signal velocity1_carry_i_18_n_0 : STD_LOGIC;
  signal velocity1_carry_i_19_n_0 : STD_LOGIC;
  signal velocity1_carry_i_1_n_0 : STD_LOGIC;
  signal velocity1_carry_i_20_n_0 : STD_LOGIC;
  signal velocity1_carry_i_21_n_0 : STD_LOGIC;
  signal velocity1_carry_i_2_n_0 : STD_LOGIC;
  signal velocity1_carry_i_4_n_0 : STD_LOGIC;
  signal velocity1_carry_i_5_n_0 : STD_LOGIC;
  signal velocity1_carry_i_6_n_0 : STD_LOGIC;
  signal velocity1_carry_i_7_n_0 : STD_LOGIC;
  signal velocity1_carry_i_8_n_2 : STD_LOGIC;
  signal velocity1_carry_i_8_n_3 : STD_LOGIC;
  signal velocity1_carry_i_9_n_0 : STD_LOGIC;
  signal velocity1_carry_i_9_n_1 : STD_LOGIC;
  signal velocity1_carry_i_9_n_2 : STD_LOGIC;
  signal velocity1_carry_i_9_n_3 : STD_LOGIC;
  signal velocity1_carry_n_1 : STD_LOGIC;
  signal velocity1_carry_n_2 : STD_LOGIC;
  signal velocity1_carry_n_3 : STD_LOGIC;
  signal velocity2 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal velocity3 : STD_LOGIC_VECTOR ( 11 downto 4 );
  signal \velocity[1]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \velocity[1]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \velocity[3]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \velocity[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_1_n_1\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_1_n_2\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_1_n_3\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \velocity[5]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \velocity[6]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_4_n_2\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_4_n_3\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \velocity[7]_INST_0_i_9_n_0\ : STD_LOGIC;
  signal \NLW__inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_moving_sum_next_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_rcount_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_velocity1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_velocity1_carry_i_10_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_velocity1_carry_i_8_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal NLW_velocity1_carry_i_8_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_velocity[1]_INST_0_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \NLW_velocity[7]_INST_0_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_velocity[7]_INST_0_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \_inferred__0/i__carry__0\ : label is 35;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \abcdefg_out[0]_INST_0_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \abcdefg_out[2]_INST_0_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \abcdefg_out[3]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \abcdefg_out[5]_INST_0_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \abcdefg_out[5]_INST_0_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \abcdefg_out[6]_INST_0_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \abcdefg_out[6]_INST_0_i_2\ : label is "soft_lutpair22";
  attribute ADDER_THRESHOLD of moving_sum_next_carry : label is 35;
  attribute ADDER_THRESHOLD of \moving_sum_next_carry__0\ : label is 35;
  attribute HLUTNM : string;
  attribute HLUTNM of \moving_sum_next_carry__0_i_1\ : label is "lutpair5";
  attribute HLUTNM of \moving_sum_next_carry__0_i_2\ : label is "lutpair4";
  attribute HLUTNM of \moving_sum_next_carry__0_i_3\ : label is "lutpair3";
  attribute HLUTNM of \moving_sum_next_carry__0_i_4\ : label is "lutpair2";
  attribute HLUTNM of \moving_sum_next_carry__0_i_6\ : label is "lutpair5";
  attribute HLUTNM of \moving_sum_next_carry__0_i_7\ : label is "lutpair4";
  attribute HLUTNM of \moving_sum_next_carry__0_i_8\ : label is "lutpair3";
  attribute ADDER_THRESHOLD of \moving_sum_next_carry__1\ : label is 35;
  attribute HLUTNM of moving_sum_next_carry_i_1 : label is "lutpair1";
  attribute HLUTNM of moving_sum_next_carry_i_2 : label is "lutpair0";
  attribute HLUTNM of moving_sum_next_carry_i_3 : label is "lutpair6";
  attribute HLUTNM of moving_sum_next_carry_i_5 : label is "lutpair2";
  attribute HLUTNM of moving_sum_next_carry_i_6 : label is "lutpair1";
  attribute HLUTNM of moving_sum_next_carry_i_7 : label is "lutpair0";
  attribute HLUTNM of moving_sum_next_carry_i_8 : label is "lutpair6";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name : string;
  attribute srl_name of \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute srl_bus_name of \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7] ";
  attribute srl_name of \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\ : label is "\U0/DUT_velocity_reader/pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6 ";
  attribute SOFT_HLUTNM of pos_shift_reg_gate : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__4\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__5\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \pos_shift_reg_gate__6\ : label is "soft_lutpair26";
  attribute ADDER_THRESHOLD of \rcount_reg[0]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \rcount_reg[8]_i_1\ : label is 11;
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of velocity1_carry : label is 11;
  attribute ADDER_THRESHOLD of velocity1_carry_i_10 : label is 35;
  attribute ADDER_THRESHOLD of velocity1_carry_i_8 : label is 35;
  attribute ADDER_THRESHOLD of velocity1_carry_i_9 : label is 35;
  attribute SOFT_HLUTNM of \velocity[0]_INST_0\ : label is "soft_lutpair22";
  attribute ADDER_THRESHOLD of \velocity[1]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \velocity[2]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \velocity[3]_INST_0_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \velocity[4]_INST_0\ : label is "soft_lutpair20";
  attribute ADDER_THRESHOLD of \velocity[5]_INST_0_i_1\ : label is 35;
  attribute SOFT_HLUTNM of \velocity[5]_INST_0_i_3\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \velocity[6]_INST_0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \velocity[6]_INST_0_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \velocity[7]_INST_0_i_3\ : label is "soft_lutpair19";
  attribute ADDER_THRESHOLD of \velocity[7]_INST_0_i_4\ : label is 35;
  attribute SOFT_HLUTNM of \velocity[7]_INST_0_i_6\ : label is "soft_lutpair16";
begin
  abcdefg_out_2_sn_1 <= abcdefg_out_2_sp_1;
  \moving_sum_reg[11]_0\ <= \^moving_sum_reg[11]_0\;
  \moving_sum_reg[11]_1\ <= \^moving_sum_reg[11]_1\;
  \moving_sum_reg[5]_0\ <= \^moving_sum_reg[5]_0\;
  velocity(4 downto 0) <= \^velocity\(4 downto 0);
\_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \_inferred__0/i__carry_n_0\,
      CO(2) => \_inferred__0/i__carry_n_1\,
      CO(1) => \_inferred__0/i__carry_n_2\,
      CO(0) => \_inferred__0/i__carry_n_3\,
      CYINIT => '0',
      DI(3) => \i__carry_i_1_n_0\,
      DI(2) => \i__carry_i_2_n_0\,
      DI(1 downto 0) => DI(1 downto 0),
      O(3) => \_inferred__0/i__carry_n_4\,
      O(2) => \_inferred__0/i__carry_n_5\,
      O(1) => \_inferred__0/i__carry_n_6\,
      O(0) => \_inferred__0/i__carry_n_7\,
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => S(0)
    );
\_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \_inferred__0/i__carry_n_0\,
      CO(3) => \NLW__inferred__0/i__carry__0_CO_UNCONNECTED\(3),
      CO(2) => \_inferred__0/i__carry__0_n_1\,
      CO(1) => \_inferred__0/i__carry__0_n_2\,
      CO(0) => \_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \i__carry__0_i_1_n_0\,
      DI(1) => \i__carry__0_i_2_n_0\,
      DI(0) => \i__carry__0_i_3_n_0\,
      O(3) => \_inferred__0/i__carry__0_n_4\,
      O(2) => \_inferred__0/i__carry__0_n_5\,
      O(1) => \_inferred__0/i__carry__0_n_6\,
      O(0) => \_inferred__0/i__carry__0_n_7\,
      S(3) => \i__carry__0_i_4_n_0\,
      S(2) => \i__carry__0_i_5_n_0\,
      S(1) => \i__carry__0_i_6_n_0\,
      S(0) => \i__carry__0_i_7_n_0\
    );
\abcdefg_out[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000F5F75FFF"
    )
        port map (
      I0 => abcdefg_out_2_sn_1,
      I1 => \velocity[7]_INST_0_i_1_n_0\,
      I2 => \^moving_sum_reg[11]_1\,
      I3 => \^velocity\(2),
      I4 => \velocity[6]_INST_0_i_1_n_0\,
      I5 => \abcdefg_out[0]_INST_0_i_1_n_0\,
      O => abcdefg_out(0)
    );
\abcdefg_out[0]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00410021"
    )
        port map (
      I0 => \^moving_sum_reg[11]_0\,
      I1 => \^velocity\(1),
      I2 => \^moving_sum_reg[5]_0\,
      I3 => abcdefg_out_2_sn_1,
      I4 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      O => \abcdefg_out[0]_INST_0_i_1_n_0\
    );
\abcdefg_out[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1115155551115155"
    )
        port map (
      I0 => \abcdefg_out[1]_INST_0_i_1_n_0\,
      I1 => abcdefg_out_2_sn_1,
      I2 => \velocity[6]_INST_0_i_1_n_0\,
      I3 => \^moving_sum_reg[11]_1\,
      I4 => \^velocity\(2),
      I5 => \velocity[7]_INST_0_i_1_n_0\,
      O => abcdefg_out(1)
    );
\abcdefg_out[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0500000055050014"
    )
        port map (
      I0 => abcdefg_out_2_sn_1,
      I1 => velocity1,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_0\,
      I4 => \abcdefg_out[5]_INST_0_i_2_n_0\,
      I5 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      O => \abcdefg_out[1]_INST_0_i_1_n_0\
    );
\abcdefg_out[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"32FF3200"
    )
        port map (
      I0 => \^moving_sum_reg[11]_1\,
      I1 => \^velocity\(2),
      I2 => \velocity[6]_INST_0_i_1_n_0\,
      I3 => abcdefg_out_2_sn_1,
      I4 => \abcdefg_out[2]_INST_0_i_1_n_0\,
      O => abcdefg_out(2)
    );
\abcdefg_out[2]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8ACE8AFE"
    )
        port map (
      I0 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      I1 => \^moving_sum_reg[11]_0\,
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \abcdefg_out[5]_INST_0_i_2_n_0\,
      I4 => velocity1,
      O => \abcdefg_out[2]_INST_0_i_1_n_0\
    );
\abcdefg_out[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00009EFF"
    )
        port map (
      I0 => \velocity[6]_INST_0_i_1_n_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^velocity\(2),
      I3 => abcdefg_out_2_sn_1,
      I4 => \abcdefg_out[3]_INST_0_i_1_n_0\,
      O => abcdefg_out(3)
    );
\abcdefg_out[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0550100504501004"
    )
        port map (
      I0 => abcdefg_out_2_sn_1,
      I1 => \abcdefg_out[5]_INST_0_i_2_n_0\,
      I2 => \^moving_sum_reg[11]_0\,
      I3 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      I4 => \^moving_sum_reg[5]_0\,
      I5 => velocity1,
      O => \abcdefg_out[3]_INST_0_i_1_n_0\
    );
\abcdefg_out[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF7FFFDF"
    )
        port map (
      I0 => abcdefg_out_2_sn_1,
      I1 => \velocity[6]_INST_0_i_1_n_0\,
      I2 => \^moving_sum_reg[11]_1\,
      I3 => \^velocity\(2),
      I4 => \velocity[7]_INST_0_i_1_n_0\,
      I5 => \abcdefg_out[4]_INST_0_i_1_n_0\,
      O => abcdefg_out(4)
    );
\abcdefg_out[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000026040400"
    )
        port map (
      I0 => \abcdefg_out[5]_INST_0_i_2_n_0\,
      I1 => \^moving_sum_reg[5]_0\,
      I2 => velocity1,
      I3 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      I4 => \^moving_sum_reg[11]_0\,
      I5 => abcdefg_out_2_sn_1,
      O => \abcdefg_out[4]_INST_0_i_1_n_0\
    );
\abcdefg_out[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EB77FFFFEB770000"
    )
        port map (
      I0 => \velocity[6]_INST_0_i_1_n_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^velocity\(2),
      I3 => \velocity[7]_INST_0_i_1_n_0\,
      I4 => abcdefg_out_2_sn_1,
      I5 => \abcdefg_out[5]_INST_0_i_1_n_0\,
      O => abcdefg_out(5)
    );
\abcdefg_out[5]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7D7D4D47"
    )
        port map (
      I0 => \^moving_sum_reg[5]_0\,
      I1 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      I2 => \^moving_sum_reg[11]_0\,
      I3 => velocity1,
      I4 => \abcdefg_out[5]_INST_0_i_2_n_0\,
      O => \abcdefg_out[5]_INST_0_i_1_n_0\
    );
\abcdefg_out[5]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8A20DF75"
    )
        port map (
      I0 => moving_sum(11),
      I1 => ARG3(5),
      I2 => \velocity[3]_INST_0_i_1_n_0\,
      I3 => ARG3(6),
      I4 => moving_sum(6),
      O => \abcdefg_out[5]_INST_0_i_2_n_0\
    );
\abcdefg_out[6]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DEBEFFFFDEBE0000"
    )
        port map (
      I0 => \velocity[6]_INST_0_i_1_n_0\,
      I1 => \^moving_sum_reg[11]_1\,
      I2 => \^velocity\(2),
      I3 => \velocity[7]_INST_0_i_1_n_0\,
      I4 => abcdefg_out_2_sn_1,
      I5 => \abcdefg_out[6]_INST_0_i_1_n_0\,
      O => abcdefg_out(6)
    );
\abcdefg_out[6]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB9E"
    )
        port map (
      I0 => \abcdefg_out[6]_INST_0_i_2_n_0\,
      I1 => \^velocity\(1),
      I2 => \^moving_sum_reg[5]_0\,
      I3 => \^moving_sum_reg[11]_0\,
      O => \abcdefg_out[6]_INST_0_i_1_n_0\
    );
\abcdefg_out[6]_INST_0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0151"
    )
        port map (
      I0 => velocity1,
      I1 => moving_sum(3),
      I2 => moving_sum(11),
      I3 => ARG3(3),
      O => \abcdefg_out[6]_INST_0_i_2_n_0\
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(5),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(4),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(3),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(7),
      I3 => pos_count(6),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(5),
      I3 => pos_count(6),
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(4),
      I3 => pos_count(5),
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(3),
      I3 => pos_count(4),
      O => \i__carry__0_i_7_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(2),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(0),
      O => \pos_count_reg[0]_0\
    );
\i__carry_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => pos_count(7),
      I1 => pos_count(6),
      I2 => pos_count(4),
      I3 => pos_count(3),
      O => \i__carry_i_12_n_0\
    );
\i__carry_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => pos_count(5),
      I1 => pos_count(3),
      I2 => pos_count(4),
      I3 => \i__carry_i_14_n_0\,
      O => \i__carry_i_13_n_0\
    );
\i__carry_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => pos_count(7),
      I1 => pos_count(6),
      I2 => pos_count(2),
      I3 => pos_count(1),
      O => \i__carry_i_14_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(1),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(2),
      I3 => pos_count(3),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEF"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => pos_count(1),
      I3 => pos_count(2),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1F1E0E0F"
    )
        port map (
      I0 => ten_ms_pulse,
      I1 => \i__carry_i_9_n_0\,
      I2 => \pos_count_reg[3]_0\,
      I3 => pos_count(0),
      I4 => pos_count(1),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040FFFF00400000"
    )
        port map (
      I0 => pos_count(2),
      I1 => pos_count(1),
      I2 => pos_count(5),
      I3 => \i__carry_i_12_n_0\,
      I4 => pos_count(0),
      I5 => \i__carry_i_13_n_0\,
      O => \i__carry_i_9_n_0\
    );
\moving_sum[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(6),
      I2 => rcount_reg(7),
      I3 => rcount_reg(8),
      I4 => \moving_sum[11]_i_3_n_0\,
      I5 => \moving_sum[11]_i_4_n_0\,
      O => ten_ms_pulse
    );
\moving_sum[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rcount_reg(15),
      I1 => rcount_reg(10),
      I2 => rcount_reg(11),
      I3 => rcount_reg(12),
      I4 => rcount_reg(13),
      O => \moving_sum[11]_i_2_n_0\
    );
\moving_sum[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rcount_reg(19),
      I1 => rcount_reg(5),
      I2 => rcount_reg(9),
      I3 => rcount_reg(4),
      O => \moving_sum[11]_i_3_n_0\
    );
\moving_sum[11]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => rcount_reg(17),
      I1 => rcount_reg(18),
      I2 => rcount_reg(1),
      I3 => rcount_reg(16),
      I4 => \moving_sum[11]_i_5_n_0\,
      O => \moving_sum[11]_i_4_n_0\
    );
\moving_sum[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => rcount_reg(14),
      I1 => rcount_reg(2),
      I2 => rcount_reg(3),
      I3 => rcount_reg(0),
      O => \moving_sum[11]_i_5_n_0\
    );
moving_sum_next_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => moving_sum_next_carry_n_0,
      CO(2) => moving_sum_next_carry_n_1,
      CO(1) => moving_sum_next_carry_n_2,
      CO(0) => moving_sum_next_carry_n_3,
      CYINIT => '0',
      DI(3) => moving_sum_next_carry_i_1_n_0,
      DI(2) => moving_sum_next_carry_i_2_n_0,
      DI(1) => moving_sum_next_carry_i_3_n_0,
      DI(0) => moving_sum_next_carry_i_4_n_0,
      O(3) => moving_sum_next_carry_n_4,
      O(2) => moving_sum_next_carry_n_5,
      O(1) => moving_sum_next_carry_n_6,
      O(0) => moving_sum_next_carry_n_7,
      S(3) => moving_sum_next_carry_i_5_n_0,
      S(2) => moving_sum_next_carry_i_6_n_0,
      S(1) => moving_sum_next_carry_i_7_n_0,
      S(0) => moving_sum_next_carry_i_8_n_0
    );
\moving_sum_next_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => moving_sum_next_carry_n_0,
      CO(3) => \moving_sum_next_carry__0_n_0\,
      CO(2) => \moving_sum_next_carry__0_n_1\,
      CO(1) => \moving_sum_next_carry__0_n_2\,
      CO(0) => \moving_sum_next_carry__0_n_3\,
      CYINIT => '0',
      DI(3) => \moving_sum_next_carry__0_i_1_n_0\,
      DI(2) => \moving_sum_next_carry__0_i_2_n_0\,
      DI(1) => \moving_sum_next_carry__0_i_3_n_0\,
      DI(0) => \moving_sum_next_carry__0_i_4_n_0\,
      O(3) => \moving_sum_next_carry__0_n_4\,
      O(2) => \moving_sum_next_carry__0_n_5\,
      O(1) => \moving_sum_next_carry__0_n_6\,
      O(0) => \moving_sum_next_carry__0_n_7\,
      S(3) => \moving_sum_next_carry__0_i_5_n_0\,
      S(2) => \moving_sum_next_carry__0_i_6_n_0\,
      S(1) => \moving_sum_next_carry__0_i_7_n_0\,
      S(0) => \moving_sum_next_carry__0_i_8_n_0\
    );
\moving_sum_next_carry__0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => pos_count(6),
      I1 => \pos_shift_reg[9]\(6),
      I2 => moving_sum(6),
      O => \moving_sum_next_carry__0_i_1_n_0\
    );
\moving_sum_next_carry__0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => pos_count(5),
      I1 => \pos_shift_reg[9]\(5),
      I2 => moving_sum(5),
      O => \moving_sum_next_carry__0_i_2_n_0\
    );
\moving_sum_next_carry__0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => pos_count(4),
      I1 => \pos_shift_reg[9]\(4),
      I2 => moving_sum(4),
      O => \moving_sum_next_carry__0_i_3_n_0\
    );
\moving_sum_next_carry__0_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => pos_count(3),
      I1 => \pos_shift_reg[9]\(3),
      I2 => moving_sum(3),
      O => \moving_sum_next_carry__0_i_4_n_0\
    );
\moving_sum_next_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => \moving_sum_next_carry__0_i_1_n_0\,
      I1 => moving_sum(7),
      I2 => pos_count(7),
      I3 => \pos_shift_reg[9]\(7),
      O => \moving_sum_next_carry__0_i_5_n_0\
    );
\moving_sum_next_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => pos_count(6),
      I1 => \pos_shift_reg[9]\(6),
      I2 => moving_sum(6),
      I3 => \moving_sum_next_carry__0_i_2_n_0\,
      O => \moving_sum_next_carry__0_i_6_n_0\
    );
\moving_sum_next_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => pos_count(5),
      I1 => \pos_shift_reg[9]\(5),
      I2 => moving_sum(5),
      I3 => \moving_sum_next_carry__0_i_3_n_0\,
      O => \moving_sum_next_carry__0_i_7_n_0\
    );
\moving_sum_next_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => pos_count(4),
      I1 => \pos_shift_reg[9]\(4),
      I2 => moving_sum(4),
      I3 => \moving_sum_next_carry__0_i_4_n_0\,
      O => \moving_sum_next_carry__0_i_8_n_0\
    );
\moving_sum_next_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \moving_sum_next_carry__0_n_0\,
      CO(3) => \NLW_moving_sum_next_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \moving_sum_next_carry__1_n_1\,
      CO(1) => \moving_sum_next_carry__1_n_2\,
      CO(0) => \moving_sum_next_carry__1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2 downto 1) => moving_sum(9 downto 8),
      DI(0) => \moving_sum_next_carry__1_i_1_n_0\,
      O(3) => \moving_sum_next_carry__1_n_4\,
      O(2) => \moving_sum_next_carry__1_n_5\,
      O(1) => \moving_sum_next_carry__1_n_6\,
      O(0) => \moving_sum_next_carry__1_n_7\,
      S(3) => \moving_sum_next_carry__1_i_2_n_0\,
      S(2) => \moving_sum_next_carry__1_i_3_n_0\,
      S(1) => \moving_sum_next_carry__1_i_4_n_0\,
      S(0) => \moving_sum_next_carry__1_i_5_n_0\
    );
\moving_sum_next_carry__1_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(8),
      O => \moving_sum_next_carry__1_i_1_n_0\
    );
\moving_sum_next_carry__1_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(10),
      I1 => moving_sum(11),
      O => \moving_sum_next_carry__1_i_2_n_0\
    );
\moving_sum_next_carry__1_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(9),
      I1 => moving_sum(10),
      O => \moving_sum_next_carry__1_i_3_n_0\
    );
\moving_sum_next_carry__1_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(8),
      I1 => moving_sum(9),
      O => \moving_sum_next_carry__1_i_4_n_0\
    );
\moving_sum_next_carry__1_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B24D"
    )
        port map (
      I0 => \pos_shift_reg[9]\(7),
      I1 => pos_count(7),
      I2 => moving_sum(7),
      I3 => moving_sum(8),
      O => \moving_sum_next_carry__1_i_5_n_0\
    );
moving_sum_next_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => pos_count(2),
      I1 => \pos_shift_reg[9]\(2),
      I2 => moving_sum(2),
      O => moving_sum_next_carry_i_1_n_0
    );
moving_sum_next_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => pos_count(1),
      I1 => \pos_shift_reg[9]\(1),
      I2 => moving_sum(1),
      O => moving_sum_next_carry_i_2_n_0
    );
moving_sum_next_carry_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => moving_sum(0),
      I1 => pos_count(0),
      O => moving_sum_next_carry_i_3_n_0
    );
moving_sum_next_carry_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => moving_sum(0),
      I1 => pos_count(0),
      O => moving_sum_next_carry_i_4_n_0
    );
moving_sum_next_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => pos_count(3),
      I1 => \pos_shift_reg[9]\(3),
      I2 => moving_sum(3),
      I3 => moving_sum_next_carry_i_1_n_0,
      O => moving_sum_next_carry_i_5_n_0
    );
moving_sum_next_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => pos_count(2),
      I1 => \pos_shift_reg[9]\(2),
      I2 => moving_sum(2),
      I3 => moving_sum_next_carry_i_2_n_0,
      O => moving_sum_next_carry_i_6_n_0
    );
moving_sum_next_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9669"
    )
        port map (
      I0 => pos_count(1),
      I1 => \pos_shift_reg[9]\(1),
      I2 => moving_sum(1),
      I3 => moving_sum_next_carry_i_3_n_0,
      O => moving_sum_next_carry_i_7_n_0
    );
moving_sum_next_carry_i_8: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => moving_sum(0),
      I1 => pos_count(0),
      I2 => \pos_shift_reg[9]\(0),
      O => moving_sum_next_carry_i_8_n_0
    );
\moving_sum_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => moving_sum_next_carry_n_7,
      Q => moving_sum(0)
    );
\moving_sum_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_5\,
      Q => moving_sum(10)
    );
\moving_sum_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_4\,
      Q => moving_sum(11)
    );
\moving_sum_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => moving_sum_next_carry_n_6,
      Q => moving_sum(1)
    );
\moving_sum_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => moving_sum_next_carry_n_5,
      Q => moving_sum(2)
    );
\moving_sum_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => moving_sum_next_carry_n_4,
      Q => moving_sum(3)
    );
\moving_sum_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_7\,
      Q => moving_sum(4)
    );
\moving_sum_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_6\,
      Q => moving_sum(5)
    );
\moving_sum_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_5\,
      Q => moving_sum(6)
    );
\moving_sum_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__0_n_4\,
      Q => moving_sum(7)
    );
\moving_sum_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_7\,
      Q => moving_sum(8)
    );
\moving_sum_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \moving_sum_next_carry__1_n_6\,
      Q => moving_sum(9)
    );
\pos_count_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_7\,
      Q => pos_count(0)
    );
\pos_count_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_6\,
      Q => pos_count(1)
    );
\pos_count_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_5\,
      Q => pos_count(2)
    );
\pos_count_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry_n_4\,
      Q => pos_count(3)
    );
\pos_count_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_7\,
      Q => pos_count(4)
    );
\pos_count_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_6\,
      Q => pos_count(5)
    );
\pos_count_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_5\,
      Q => pos_count(6)
    );
\pos_count_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \_inferred__0/i__carry__0_n_4\,
      Q => pos_count(7)
    );
\pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(0),
      Q => \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(1),
      Q => \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(2),
      Q => \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(3),
      Q => \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(4),
      Q => \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(5),
      Q => \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(6),
      Q => \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => ten_ms_pulse,
      CLK => mclk,
      D => pos_count(7),
      Q => \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\
    );
\pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][0]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][1]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][2]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][3]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][4]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][5]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][6]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7\: unisim.vcomponents.FDRE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      D => \pos_shift_reg[7][7]_srl8_U0_DUT_velocity_reader_pos_shift_reg_c_6_n_0\,
      Q => \pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      R => '0'
    );
\pos_shift_reg[9][0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__6_n_0\,
      Q => \pos_shift_reg[9]\(0)
    );
\pos_shift_reg[9][1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__5_n_0\,
      Q => \pos_shift_reg[9]\(1)
    );
\pos_shift_reg[9][2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__4_n_0\,
      Q => \pos_shift_reg[9]\(2)
    );
\pos_shift_reg[9][3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__3_n_0\,
      Q => \pos_shift_reg[9]\(3)
    );
\pos_shift_reg[9][4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__2_n_0\,
      Q => \pos_shift_reg[9]\(4)
    );
\pos_shift_reg[9][5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__1_n_0\,
      Q => \pos_shift_reg[9]\(5)
    );
\pos_shift_reg[9][6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => \pos_shift_reg_gate__0_n_0\,
      Q => \pos_shift_reg[9]\(6)
    );
\pos_shift_reg[9][7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_gate_n_0,
      Q => \pos_shift_reg[9]\(7)
    );
pos_shift_reg_c: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => '1',
      Q => pos_shift_reg_c_n_0
    );
pos_shift_reg_c_0: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_n_0,
      Q => pos_shift_reg_c_0_n_0
    );
pos_shift_reg_c_1: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_0_n_0,
      Q => pos_shift_reg_c_1_n_0
    );
pos_shift_reg_c_2: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_1_n_0,
      Q => pos_shift_reg_c_2_n_0
    );
pos_shift_reg_c_3: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_2_n_0,
      Q => pos_shift_reg_c_3_n_0
    );
pos_shift_reg_c_4: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_3_n_0,
      Q => pos_shift_reg_c_4_n_0
    );
pos_shift_reg_c_5: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_4_n_0,
      Q => pos_shift_reg_c_5_n_0
    );
pos_shift_reg_c_6: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_5_n_0,
      Q => pos_shift_reg_c_6_n_0
    );
pos_shift_reg_c_7: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => ten_ms_pulse,
      CLR => reset,
      D => pos_shift_reg_c_6_n_0,
      Q => pos_shift_reg_c_7_n_0
    );
pos_shift_reg_gate: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][7]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => pos_shift_reg_gate_n_0
    );
\pos_shift_reg_gate__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][6]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__0_n_0\
    );
\pos_shift_reg_gate__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][5]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__1_n_0\
    );
\pos_shift_reg_gate__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][4]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__2_n_0\
    );
\pos_shift_reg_gate__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][3]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__3_n_0\
    );
\pos_shift_reg_gate__4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][2]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__4_n_0\
    );
\pos_shift_reg_gate__5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][1]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__5_n_0\
    );
\pos_shift_reg_gate__6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \pos_shift_reg[8][0]_U0_DUT_velocity_reader_pos_shift_reg_c_7_n_0\,
      I1 => pos_shift_reg_c_7_n_0,
      O => \pos_shift_reg_gate__6_n_0\
    );
\rcount[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(0),
      O => \rcount[0]_i_2_n_0\
    );
\rcount[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(3),
      O => \rcount[0]_i_3_n_0\
    );
\rcount[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(2),
      O => \rcount[0]_i_4_n_0\
    );
\rcount[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(1),
      O => \rcount[0]_i_5_n_0\
    );
\rcount[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFF1511"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(0),
      O => \rcount[0]_i_6_n_0\
    );
\rcount[0]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => rcount_reg(8),
      I1 => rcount_reg(7),
      I2 => rcount_reg(6),
      O => \rcount[0]_i_7_n_0\
    );
\rcount[0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => rcount_reg(4),
      I1 => rcount_reg(2),
      I2 => rcount_reg(1),
      I3 => rcount_reg(5),
      I4 => rcount_reg(0),
      I5 => rcount_reg(3),
      O => \rcount[0]_i_8_n_0\
    );
\rcount[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => rcount_reg(15),
      I1 => rcount_reg(14),
      I2 => rcount_reg(16),
      I3 => rcount_reg(19),
      I4 => rcount_reg(17),
      I5 => rcount_reg(18),
      O => \rcount[0]_i_9_n_0\
    );
\rcount[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(15),
      O => \rcount[12]_i_2_n_0\
    );
\rcount[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(14),
      O => \rcount[12]_i_3_n_0\
    );
\rcount[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(13),
      O => \rcount[12]_i_4_n_0\
    );
\rcount[12]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(12),
      O => \rcount[12]_i_5_n_0\
    );
\rcount[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(19),
      O => \rcount[16]_i_2_n_0\
    );
\rcount[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(18),
      O => \rcount[16]_i_3_n_0\
    );
\rcount[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(17),
      O => \rcount[16]_i_4_n_0\
    );
\rcount[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(16),
      O => \rcount[16]_i_5_n_0\
    );
\rcount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(7),
      O => \rcount[4]_i_2_n_0\
    );
\rcount[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(6),
      O => \rcount[4]_i_3_n_0\
    );
\rcount[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(5),
      O => \rcount[4]_i_4_n_0\
    );
\rcount[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(4),
      O => \rcount[4]_i_5_n_0\
    );
\rcount[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(11),
      O => \rcount[8]_i_2_n_0\
    );
\rcount[8]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(10),
      O => \rcount[8]_i_3_n_0\
    );
\rcount[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCC0400"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      O => \rcount[8]_i_4_n_0\
    );
\rcount[8]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF151100000000"
    )
        port map (
      I0 => \moving_sum[11]_i_2_n_0\,
      I1 => rcount_reg(9),
      I2 => \rcount[0]_i_7_n_0\,
      I3 => \rcount[0]_i_8_n_0\,
      I4 => \rcount[0]_i_9_n_0\,
      I5 => rcount_reg(8),
      O => \rcount[8]_i_5_n_0\
    );
\rcount_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_7\,
      Q => rcount_reg(0)
    );
\rcount_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \rcount_reg[0]_i_1_n_0\,
      CO(2) => \rcount_reg[0]_i_1_n_1\,
      CO(1) => \rcount_reg[0]_i_1_n_2\,
      CO(0) => \rcount_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \rcount[0]_i_2_n_0\,
      O(3) => \rcount_reg[0]_i_1_n_4\,
      O(2) => \rcount_reg[0]_i_1_n_5\,
      O(1) => \rcount_reg[0]_i_1_n_6\,
      O(0) => \rcount_reg[0]_i_1_n_7\,
      S(3) => \rcount[0]_i_3_n_0\,
      S(2) => \rcount[0]_i_4_n_0\,
      S(1) => \rcount[0]_i_5_n_0\,
      S(0) => \rcount[0]_i_6_n_0\
    );
\rcount_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_5\,
      Q => rcount_reg(10)
    );
\rcount_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_4\,
      Q => rcount_reg(11)
    );
\rcount_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_7\,
      Q => rcount_reg(12)
    );
\rcount_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[8]_i_1_n_0\,
      CO(3) => \rcount_reg[12]_i_1_n_0\,
      CO(2) => \rcount_reg[12]_i_1_n_1\,
      CO(1) => \rcount_reg[12]_i_1_n_2\,
      CO(0) => \rcount_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[12]_i_1_n_4\,
      O(2) => \rcount_reg[12]_i_1_n_5\,
      O(1) => \rcount_reg[12]_i_1_n_6\,
      O(0) => \rcount_reg[12]_i_1_n_7\,
      S(3) => \rcount[12]_i_2_n_0\,
      S(2) => \rcount[12]_i_3_n_0\,
      S(1) => \rcount[12]_i_4_n_0\,
      S(0) => \rcount[12]_i_5_n_0\
    );
\rcount_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_6\,
      Q => rcount_reg(13)
    );
\rcount_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_5\,
      Q => rcount_reg(14)
    );
\rcount_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[12]_i_1_n_4\,
      Q => rcount_reg(15)
    );
\rcount_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_7\,
      Q => rcount_reg(16)
    );
\rcount_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[12]_i_1_n_0\,
      CO(3) => \NLW_rcount_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \rcount_reg[16]_i_1_n_1\,
      CO(1) => \rcount_reg[16]_i_1_n_2\,
      CO(0) => \rcount_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[16]_i_1_n_4\,
      O(2) => \rcount_reg[16]_i_1_n_5\,
      O(1) => \rcount_reg[16]_i_1_n_6\,
      O(0) => \rcount_reg[16]_i_1_n_7\,
      S(3) => \rcount[16]_i_2_n_0\,
      S(2) => \rcount[16]_i_3_n_0\,
      S(1) => \rcount[16]_i_4_n_0\,
      S(0) => \rcount[16]_i_5_n_0\
    );
\rcount_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_6\,
      Q => rcount_reg(17)
    );
\rcount_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_5\,
      Q => rcount_reg(18)
    );
\rcount_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[16]_i_1_n_4\,
      Q => rcount_reg(19)
    );
\rcount_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_6\,
      Q => rcount_reg(1)
    );
\rcount_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_5\,
      Q => rcount_reg(2)
    );
\rcount_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[0]_i_1_n_4\,
      Q => rcount_reg(3)
    );
\rcount_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_7\,
      Q => rcount_reg(4)
    );
\rcount_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[0]_i_1_n_0\,
      CO(3) => \rcount_reg[4]_i_1_n_0\,
      CO(2) => \rcount_reg[4]_i_1_n_1\,
      CO(1) => \rcount_reg[4]_i_1_n_2\,
      CO(0) => \rcount_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[4]_i_1_n_4\,
      O(2) => \rcount_reg[4]_i_1_n_5\,
      O(1) => \rcount_reg[4]_i_1_n_6\,
      O(0) => \rcount_reg[4]_i_1_n_7\,
      S(3) => \rcount[4]_i_2_n_0\,
      S(2) => \rcount[4]_i_3_n_0\,
      S(1) => \rcount[4]_i_4_n_0\,
      S(0) => \rcount[4]_i_5_n_0\
    );
\rcount_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_6\,
      Q => rcount_reg(5)
    );
\rcount_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_5\,
      Q => rcount_reg(6)
    );
\rcount_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[4]_i_1_n_4\,
      Q => rcount_reg(7)
    );
\rcount_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_7\,
      Q => rcount_reg(8)
    );
\rcount_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \rcount_reg[4]_i_1_n_0\,
      CO(3) => \rcount_reg[8]_i_1_n_0\,
      CO(2) => \rcount_reg[8]_i_1_n_1\,
      CO(1) => \rcount_reg[8]_i_1_n_2\,
      CO(0) => \rcount_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \rcount_reg[8]_i_1_n_4\,
      O(2) => \rcount_reg[8]_i_1_n_5\,
      O(1) => \rcount_reg[8]_i_1_n_6\,
      O(0) => \rcount_reg[8]_i_1_n_7\,
      S(3) => \rcount[8]_i_2_n_0\,
      S(2) => \rcount[8]_i_3_n_0\,
      S(1) => \rcount[8]_i_4_n_0\,
      S(0) => \rcount[8]_i_5_n_0\
    );
\rcount_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => mclk,
      CE => '1',
      CLR => reset,
      D => \rcount_reg[8]_i_1_n_6\,
      Q => rcount_reg(9)
    );
velocity1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => velocity1,
      CO(2) => velocity1_carry_n_1,
      CO(1) => velocity1_carry_n_2,
      CO(0) => velocity1_carry_n_3,
      CYINIT => '0',
      DI(3) => velocity1_carry_i_1_n_0,
      DI(2) => '0',
      DI(1) => velocity1_carry_i_2_n_0,
      DI(0) => velocity2(5),
      O(3 downto 0) => NLW_velocity1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => velocity1_carry_i_4_n_0,
      S(2) => velocity1_carry_i_5_n_0,
      S(1) => velocity1_carry_i_6_n_0,
      S(0) => velocity1_carry_i_7_n_0
    );
velocity1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0CAC"
    )
        port map (
      I0 => velocity3(10),
      I1 => moving_sum(10),
      I2 => moving_sum(11),
      I3 => velocity3(11),
      O => velocity1_carry_i_1_n_0
    );
velocity1_carry_i_10: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => velocity1_carry_i_10_n_0,
      CO(2) => velocity1_carry_i_10_n_1,
      CO(1) => velocity1_carry_i_10_n_2,
      CO(0) => velocity1_carry_i_10_n_3,
      CYINIT => \velocity[1]_INST_0_i_2_n_0\,
      DI(3 downto 0) => B"0000",
      O(3) => velocity3(4),
      O(2 downto 0) => NLW_velocity1_carry_i_10_O_UNCONNECTED(2 downto 0),
      S(3) => velocity1_carry_i_18_n_0,
      S(2) => velocity1_carry_i_19_n_0,
      S(1) => velocity1_carry_i_20_n_0,
      S(0) => velocity1_carry_i_21_n_0
    );
velocity1_carry_i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(11),
      O => velocity1_carry_i_11_n_0
    );
velocity1_carry_i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(10),
      O => velocity1_carry_i_12_n_0
    );
velocity1_carry_i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(9),
      O => velocity1_carry_i_13_n_0
    );
velocity1_carry_i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(8),
      O => velocity1_carry_i_14_n_0
    );
velocity1_carry_i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(7),
      O => velocity1_carry_i_15_n_0
    );
velocity1_carry_i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(6),
      O => velocity1_carry_i_16_n_0
    );
velocity1_carry_i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(5),
      O => velocity1_carry_i_17_n_0
    );
velocity1_carry_i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(4),
      O => velocity1_carry_i_18_n_0
    );
velocity1_carry_i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(3),
      O => velocity1_carry_i_19_n_0
    );
velocity1_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFBBFCB8"
    )
        port map (
      I0 => velocity3(6),
      I1 => moving_sum(11),
      I2 => moving_sum(6),
      I3 => velocity3(7),
      I4 => moving_sum(7),
      O => velocity1_carry_i_2_n_0
    );
velocity1_carry_i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(2),
      O => velocity1_carry_i_20_n_0
    );
velocity1_carry_i_21: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(1),
      O => velocity1_carry_i_21_n_0
    );
velocity1_carry_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => velocity3(5),
      I1 => moving_sum(11),
      I2 => moving_sum(5),
      O => velocity2(5)
    );
velocity1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0353"
    )
        port map (
      I0 => velocity3(10),
      I1 => moving_sum(10),
      I2 => moving_sum(11),
      I3 => velocity3(11),
      O => velocity1_carry_i_4_n_0
    );
velocity1_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCA000A0"
    )
        port map (
      I0 => moving_sum(9),
      I1 => velocity3(9),
      I2 => moving_sum(8),
      I3 => moving_sum(11),
      I4 => velocity3(8),
      O => velocity1_carry_i_5_n_0
    );
velocity1_carry_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => moving_sum(7),
      I1 => velocity3(7),
      I2 => moving_sum(6),
      I3 => moving_sum(11),
      I4 => velocity3(6),
      O => velocity1_carry_i_6_n_0
    );
velocity1_carry_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000ACC0A"
    )
        port map (
      I0 => moving_sum(4),
      I1 => velocity3(4),
      I2 => moving_sum(5),
      I3 => moving_sum(11),
      I4 => velocity3(5),
      O => velocity1_carry_i_7_n_0
    );
velocity1_carry_i_8: unisim.vcomponents.CARRY4
     port map (
      CI => velocity1_carry_i_9_n_0,
      CO(3 downto 2) => NLW_velocity1_carry_i_8_CO_UNCONNECTED(3 downto 2),
      CO(1) => velocity1_carry_i_8_n_2,
      CO(0) => velocity1_carry_i_8_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => NLW_velocity1_carry_i_8_O_UNCONNECTED(3),
      O(2 downto 0) => velocity3(11 downto 9),
      S(3) => '0',
      S(2) => velocity1_carry_i_11_n_0,
      S(1) => velocity1_carry_i_12_n_0,
      S(0) => velocity1_carry_i_13_n_0
    );
velocity1_carry_i_9: unisim.vcomponents.CARRY4
     port map (
      CI => velocity1_carry_i_10_n_0,
      CO(3) => velocity1_carry_i_9_n_0,
      CO(2) => velocity1_carry_i_9_n_1,
      CO(1) => velocity1_carry_i_9_n_2,
      CO(0) => velocity1_carry_i_9_n_3,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => velocity3(8 downto 5),
      S(3) => velocity1_carry_i_14_n_0,
      S(2) => velocity1_carry_i_15_n_0,
      S(1) => velocity1_carry_i_16_n_0,
      S(0) => velocity1_carry_i_17_n_0
    );
\velocity[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFB8"
    )
        port map (
      I0 => ARG3(3),
      I1 => moving_sum(11),
      I2 => moving_sum(3),
      I3 => velocity1,
      O => \^velocity\(0)
    );
\velocity[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004EE4"
    )
        port map (
      I0 => moving_sum(11),
      I1 => moving_sum(4),
      I2 => ARG3(3),
      I3 => ARG3(4),
      I4 => velocity1,
      O => \^moving_sum_reg[11]_0\
    );
\velocity[1]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \velocity[1]_INST_0_i_1_n_0\,
      CO(2) => \velocity[1]_INST_0_i_1_n_1\,
      CO(1) => \velocity[1]_INST_0_i_1_n_2\,
      CO(0) => \velocity[1]_INST_0_i_1_n_3\,
      CYINIT => \velocity[1]_INST_0_i_2_n_0\,
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => ARG3(4 downto 3),
      O(1 downto 0) => \NLW_velocity[1]_INST_0_i_1_O_UNCONNECTED\(1 downto 0),
      S(3) => \velocity[1]_INST_0_i_3_n_0\,
      S(2) => \velocity[1]_INST_0_i_4_n_0\,
      S(1) => \velocity[1]_INST_0_i_5_n_0\,
      S(0) => \velocity[1]_INST_0_i_6_n_0\
    );
\velocity[1]_INST_0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(0),
      O => \velocity[1]_INST_0_i_2_n_0\
    );
\velocity[1]_INST_0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(4),
      O => \velocity[1]_INST_0_i_3_n_0\
    );
\velocity[1]_INST_0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(3),
      O => \velocity[1]_INST_0_i_4_n_0\
    );
\velocity[1]_INST_0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(2),
      O => \velocity[1]_INST_0_i_5_n_0\
    );
\velocity[1]_INST_0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(1),
      O => \velocity[1]_INST_0_i_6_n_0\
    );
\velocity[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"54040454"
    )
        port map (
      I0 => velocity1,
      I1 => moving_sum(5),
      I2 => moving_sum(11),
      I3 => ARG3(5),
      I4 => \velocity[3]_INST_0_i_1_n_0\,
      O => \^moving_sum_reg[5]_0\
    );
\velocity[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1032103232101032"
    )
        port map (
      I0 => moving_sum(11),
      I1 => velocity1,
      I2 => moving_sum(6),
      I3 => ARG3(6),
      I4 => \velocity[3]_INST_0_i_1_n_0\,
      I5 => \velocity[3]_INST_0_i_2_n_0\,
      O => \^velocity\(1)
    );
\velocity[3]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00053305"
    )
        port map (
      I0 => moving_sum(4),
      I1 => ARG3(4),
      I2 => moving_sum(3),
      I3 => moving_sum(11),
      I4 => ARG3(3),
      O => \velocity[3]_INST_0_i_1_n_0\
    );
\velocity[3]_INST_0_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ARG3(5),
      I1 => moving_sum(11),
      I2 => moving_sum(5),
      O => \velocity[3]_INST_0_i_2_n_0\
    );
\velocity[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000CA3A"
    )
        port map (
      I0 => moving_sum(7),
      I1 => ARG3(7),
      I2 => moving_sum(11),
      I3 => \velocity[5]_INST_0_i_2_n_0\,
      I4 => velocity1,
      O => \^velocity\(2)
    );
\velocity[5]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3210103210321032"
    )
        port map (
      I0 => moving_sum(11),
      I1 => velocity1,
      I2 => moving_sum(8),
      I3 => ARG3(8),
      I4 => \velocity[5]_INST_0_i_2_n_0\,
      I5 => \velocity[5]_INST_0_i_3_n_0\,
      O => \^moving_sum_reg[11]_1\
    );
\velocity[5]_INST_0_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \velocity[1]_INST_0_i_1_n_0\,
      CO(3) => \velocity[5]_INST_0_i_1_n_0\,
      CO(2) => \velocity[5]_INST_0_i_1_n_1\,
      CO(1) => \velocity[5]_INST_0_i_1_n_2\,
      CO(0) => \velocity[5]_INST_0_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => ARG3(8 downto 5),
      S(3) => \velocity[5]_INST_0_i_4_n_0\,
      S(2) => \velocity[5]_INST_0_i_5_n_0\,
      S(1) => \velocity[5]_INST_0_i_6_n_0\,
      S(0) => \velocity[5]_INST_0_i_7_n_0\
    );
\velocity[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000050022002700"
    )
        port map (
      I0 => moving_sum(11),
      I1 => ARG3(5),
      I2 => moving_sum(5),
      I3 => \velocity[3]_INST_0_i_1_n_0\,
      I4 => moving_sum(6),
      I5 => ARG3(6),
      O => \velocity[5]_INST_0_i_2_n_0\
    );
\velocity[5]_INST_0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => moving_sum(7),
      I1 => ARG3(7),
      I2 => moving_sum(11),
      O => \velocity[5]_INST_0_i_3_n_0\
    );
\velocity[5]_INST_0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(8),
      O => \velocity[5]_INST_0_i_4_n_0\
    );
\velocity[5]_INST_0_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(7),
      O => \velocity[5]_INST_0_i_5_n_0\
    );
\velocity[5]_INST_0_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(6),
      O => \velocity[5]_INST_0_i_6_n_0\
    );
\velocity[5]_INST_0_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(5),
      O => \velocity[5]_INST_0_i_7_n_0\
    );
\velocity[6]_INST_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \velocity[6]_INST_0_i_1_n_0\,
      O => \^velocity\(3)
    );
\velocity[6]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABFBFBAB"
    )
        port map (
      I0 => velocity1,
      I1 => moving_sum(9),
      I2 => moving_sum(11),
      I3 => ARG3(9),
      I4 => \velocity[7]_INST_0_i_2_n_0\,
      O => \velocity[6]_INST_0_i_1_n_0\
    );
\velocity[7]_INST_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \velocity[7]_INST_0_i_1_n_0\,
      O => \^velocity\(4)
    );
\velocity[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000005555555D"
    )
        port map (
      I0 => moving_sum(11),
      I1 => \velocity[7]_INST_0_i_2_n_0\,
      I2 => \velocity[7]_INST_0_i_3_n_0\,
      I3 => ARG3(11),
      I4 => ARG3(10),
      I5 => velocity1,
      O => \velocity[7]_INST_0_i_1_n_0\
    );
\velocity[7]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => \velocity[7]_INST_0_i_5_n_0\,
      I1 => \velocity[5]_INST_0_i_3_n_0\,
      I2 => \velocity[3]_INST_0_i_2_n_0\,
      I3 => \velocity[3]_INST_0_i_1_n_0\,
      I4 => \velocity[7]_INST_0_i_6_n_0\,
      O => \velocity[7]_INST_0_i_2_n_0\
    );
\velocity[7]_INST_0_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ARG3(9),
      I1 => moving_sum(11),
      I2 => moving_sum(9),
      O => \velocity[7]_INST_0_i_3_n_0\
    );
\velocity[7]_INST_0_i_4\: unisim.vcomponents.CARRY4
     port map (
      CI => \velocity[5]_INST_0_i_1_n_0\,
      CO(3 downto 2) => \NLW_velocity[7]_INST_0_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \velocity[7]_INST_0_i_4_n_2\,
      CO(0) => \velocity[7]_INST_0_i_4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_velocity[7]_INST_0_i_4_O_UNCONNECTED\(3),
      O(2 downto 0) => ARG3(11 downto 9),
      S(3) => '0',
      S(2) => \velocity[7]_INST_0_i_7_n_0\,
      S(1) => \velocity[7]_INST_0_i_8_n_0\,
      S(0) => \velocity[7]_INST_0_i_9_n_0\
    );
\velocity[7]_INST_0_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => moving_sum(8),
      I1 => ARG3(8),
      I2 => moving_sum(11),
      O => \velocity[7]_INST_0_i_5_n_0\
    );
\velocity[7]_INST_0_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ARG3(6),
      I1 => moving_sum(11),
      I2 => moving_sum(6),
      O => \velocity[7]_INST_0_i_6_n_0\
    );
\velocity[7]_INST_0_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(11),
      O => \velocity[7]_INST_0_i_7_n_0\
    );
\velocity[7]_INST_0_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(10),
      O => \velocity[7]_INST_0_i_8_n_0\
    );
\velocity[7]_INST_0_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => moving_sum(9),
      O => \velocity[7]_INST_0_i_9_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0_system is
  port (
    c_reg_reg : out STD_LOGIC;
    \moving_sum_reg[11]\ : out STD_LOGIC;
    \moving_sum_reg[5]\ : out STD_LOGIC;
    \moving_sum_reg[11]_0\ : out STD_LOGIC;
    velocity : out STD_LOGIC_VECTOR ( 4 downto 0 );
    en_synch_out : out STD_LOGIC;
    dir_synch_out : out STD_LOGIC;
    abcdefg_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    mclk : in STD_LOGIC;
    reset : in STD_LOGIC;
    SB : in STD_LOGIC;
    SA : in STD_LOGIC;
    duty_cycle : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of O10_block_design_system_0_0_system : entity is "system";
end O10_block_design_system_0_0_system;

architecture STRUCTURE of O10_block_design_system_0_0_system is
  signal DUT_output_sync_n_2 : STD_LOGIC;
  signal DUT_output_sync_n_3 : STD_LOGIC;
  signal DUT_output_sync_n_4 : STD_LOGIC;
  signal DUT_quadrature_decoder_n_0 : STD_LOGIC;
  signal DUT_quadrature_decoder_n_1 : STD_LOGIC;
  signal DUT_quadrature_decoder_n_2 : STD_LOGIC;
  signal DUT_quadrature_decoder_n_3 : STD_LOGIC;
  signal DUT_velocity_reader_n_2 : STD_LOGIC;
  signal SA_synch_sig : STD_LOGIC;
  signal SB_synch_sig : STD_LOGIC;
  signal \^c_reg_reg\ : STD_LOGIC;
  signal dir_sig : STD_LOGIC;
  signal en_sig : STD_LOGIC;
begin
  c_reg_reg <= \^c_reg_reg\;
DUT_input_synchronizer: entity work.O10_block_design_system_0_0_input_synchronizer
     port map (
      SA => SA,
      SA_synch_sig => SA_synch_sig,
      SB => SB,
      SB_synch_sig => SB_synch_sig,
      mclk => mclk,
      reset => reset
    );
DUT_output_sync: entity work.O10_block_design_system_0_0_output_synchronizer
     port map (
      Q(0) => dir_sig,
      dir_synch_out => dir_synch_out,
      duty_cycle(5 downto 0) => duty_cycle(5 downto 0),
      duty_cycle_0_sp_1 => DUT_output_sync_n_4,
      duty_cycle_2_sp_1 => DUT_output_sync_n_3,
      duty_cycle_4_sp_1 => DUT_output_sync_n_2,
      en_sig => en_sig,
      en_synch_out => en_synch_out,
      mclk => mclk,
      reset => reset
    );
DUT_pulse_width_modulator: entity work.O10_block_design_system_0_0_pulse_width_modulator
     port map (
      Q(0) => dir_sig,
      duty_cycle(7 downto 0) => duty_cycle(7 downto 0),
      en0_carry_0 => DUT_output_sync_n_4,
      en0_carry_1 => DUT_output_sync_n_3,
      en0_carry_2 => DUT_output_sync_n_2,
      en_sig => en_sig,
      mclk => mclk,
      reset => reset
    );
DUT_quadrature_decoder: entity work.O10_block_design_system_0_0_quadrature_decoder
     port map (
      DI(1) => DUT_quadrature_decoder_n_0,
      DI(0) => DUT_quadrature_decoder_n_1,
      \FSM_sequential_current_state_reg[2]_0\ => DUT_quadrature_decoder_n_2,
      S(0) => DUT_quadrature_decoder_n_3,
      SA_synch_sig => SA_synch_sig,
      SB_synch_sig => SB_synch_sig,
      mclk => mclk,
      \pos_count_reg[3]\ => DUT_velocity_reader_n_2,
      reset => reset
    );
DUT_seg7ctrl: entity work.O10_block_design_system_0_0_seg7ctrl
     port map (
      c_reg_reg_0 => \^c_reg_reg\,
      mclk => mclk,
      reset => reset
    );
DUT_velocity_reader: entity work.O10_block_design_system_0_0_velocity_reader
     port map (
      DI(1) => DUT_quadrature_decoder_n_0,
      DI(0) => DUT_quadrature_decoder_n_1,
      S(0) => DUT_quadrature_decoder_n_3,
      abcdefg_out(6 downto 0) => abcdefg_out(6 downto 0),
      abcdefg_out_2_sp_1 => \^c_reg_reg\,
      mclk => mclk,
      \moving_sum_reg[11]_0\ => \moving_sum_reg[11]\,
      \moving_sum_reg[11]_1\ => \moving_sum_reg[11]_0\,
      \moving_sum_reg[5]_0\ => \moving_sum_reg[5]\,
      \pos_count_reg[0]_0\ => DUT_velocity_reader_n_2,
      \pos_count_reg[3]_0\ => DUT_quadrature_decoder_n_2,
      reset => reset,
      velocity(4 downto 0) => velocity(4 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity O10_block_design_system_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of O10_block_design_system_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of O10_block_design_system_0_0 : entity is "O10_block_design_system_0_0,system,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of O10_block_design_system_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of O10_block_design_system_0_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of O10_block_design_system_0_0 : entity is "system,Vivado 2024.1";
end O10_block_design_system_0_0;

architecture STRUCTURE of O10_block_design_system_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
U0: entity work.O10_block_design_system_0_0_system
     port map (
      SA => SA,
      SB => SB,
      abcdefg_out(6 downto 0) => abcdefg_out(6 downto 0),
      c_reg_reg => c_out,
      dir_synch_out => dir_synch_out,
      duty_cycle(7 downto 0) => duty_cycle(7 downto 0),
      en_synch_out => en_synch_out,
      mclk => mclk,
      \moving_sum_reg[11]\ => velocity(1),
      \moving_sum_reg[11]_0\ => velocity(5),
      \moving_sum_reg[5]\ => velocity(2),
      reset => reset,
      velocity(4 downto 3) => velocity(7 downto 6),
      velocity(2 downto 1) => velocity(4 downto 3),
      velocity(0) => velocity(0)
    );
end STRUCTURE;
