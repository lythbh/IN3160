-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.org:user:system:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY O10_block_design_system_0_0 IS
  PORT (
    mclk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    SA : IN STD_LOGIC;
    SB : IN STD_LOGIC;
    duty_cycle : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    velocity : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    dir_synch_out : OUT STD_LOGIC;
    en_synch_out : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC;
    abcdefg_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END O10_block_design_system_0_0;

ARCHITECTURE O10_block_design_system_0_0_arch OF O10_block_design_system_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF O10_block_design_system_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT system IS
    PORT (
      mclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      SA : IN STD_LOGIC;
      SB : IN STD_LOGIC;
      duty_cycle : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      velocity : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      dir_synch_out : OUT STD_LOGIC;
      en_synch_out : OUT STD_LOGIC;
      c_out : OUT STD_LOGIC;
      abcdefg_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT system;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF O10_block_design_system_0_0_arch: ARCHITECTURE IS "system,Vivado 2024.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF O10_block_design_system_0_0_arch : ARCHITECTURE IS "O10_block_design_system_0_0,system,{}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF O10_block_design_system_0_0_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF reset: SIGNAL IS "XIL_INTERFACENAME reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF reset: SIGNAL IS "xilinx.com:signal:reset:1.0 reset RST";
BEGIN
  U0 : system
    PORT MAP (
      mclk => mclk,
      reset => reset,
      SA => SA,
      SB => SB,
      duty_cycle => duty_cycle,
      velocity => velocity,
      dir_synch_out => dir_synch_out,
      en_synch_out => en_synch_out,
      c_out => c_out,
      abcdefg_out => abcdefg_out
    );
END O10_block_design_system_0_0_arch;
