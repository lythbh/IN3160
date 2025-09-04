import cocotb
from cocotb.triggers import * #RisingEdge, Edge, Timer
from cocotb.clock import Clock

# For flexibility when changing generic value in Makefile
N = 64

@cocotb.test()
async def main_test(dut):
    dut._log.info("Setting up DUT")
    
    # DUT in reset 
    dut.reset.value = 0

    # Default indata
    dut.indata.value = 1

    # Starting clock
    dut._log.info("Starting clock")
    cocotb.start_soon(Clock(dut.clock, 100, units="ns").start())

    await Timer(100, units="ns")
    dut.reset.value = 1

    await Timer(100, units="ns")
    assert dut.outdata.value[N - 1] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[N - 2] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[N - 3] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[N - 4] == 1  

    await Timer(N*100 - 400, units="ns")
    assert dut.outdata.value == 0xFFFFFFFFFFFFFFFF