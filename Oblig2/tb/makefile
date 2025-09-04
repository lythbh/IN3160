# Simulator and language selection
SIM ?= ghdl
TOPLEVEL_LANG ?= vhdl

# VHDL 2008 (for GHDL)
EXTRA_ARGS +=--std=08

TOPLEVEL ?= decoder

ARCH ?= dec_select

VHDL_SOURCES += $(PWD)/../src/$(TOPLEVEL)_ent.vhd
VHDL_SOURCES += $(PWD)/../src/$(TOPLEVEL)_$(ARCH).vhd

SIM_ARGS += --wave=$(TOPLEVEL).ghw

MODULE = tb_$(TOPLEVEL)_$(ARCH)

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim