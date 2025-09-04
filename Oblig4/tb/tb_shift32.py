import cocotb
from cocotb.triggers import * #RisingEdge, Edge, Timer
from cocotb.clock import Clock

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
    assert dut.outdata.value[31] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[30] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[29] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[28] == 1  

    await Timer(100, units="ns")
    assert dut.outdata.value[27] == 1  

    await Timer(100, units="ns")
    assert dut.outdata.value[26] == 1  

    await Timer(100, units="ns")
    assert dut.outdata.value[25] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[24] == 1

    await Timer(2400, units="ns")

    assert dut.outdata.value == 0xFFFFFFFF