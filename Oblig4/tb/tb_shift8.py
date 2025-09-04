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
    assert dut.outdata.value[7] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[6] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[5] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[4] == 1  

    await Timer(100, units="ns")
    assert dut.outdata.value[3] == 1  

    await Timer(100, units="ns")
    assert dut.outdata.value[2] == 1  

    await Timer(100, units="ns")
    assert dut.outdata.value[1] == 1

    await Timer(100, units="ns")
    assert dut.outdata.value[0] == 1

    assert dut.outdata.value == 0b11111111