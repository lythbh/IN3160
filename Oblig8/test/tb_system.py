import cocotb
from cocotb import start_soon
from cocotb.clock import Clock
from cocotb.triggers import * 
      
async def reset(dut):
    await RisingEdge(dut.mclk)
    dut.reset.value = 1
    await ClockCycles(dut.mclk, 3)
    await FallingEdge(dut.mclk)
    dut.reset.value = 0

@cocotb.test()
async def main_test(dut):
    dut._log.info("Starting testing...")
    start_soon(Clock(dut.mclk, 10, units="ns").start())
    await reset(dut)
    await ClockCycles(dut.mclk, 100)

    for i in range(100):
        await ClockCycles(dut.mclk, 50)
        await RisingEdge(dut.mclk)
        dut.sa.value = 0
        dut.sb.value = 1
        await ClockCycles(dut.mclk, 10)
        await RisingEdge(dut.mclk)
        dut.sa.value = 1
        dut.sb.value = 1
        await ClockCycles(dut.mclk, 10)
        await RisingEdge(dut.mclk)
        dut.sa.value = 1
        dut.sb.value = 0
        await ClockCycles(dut.mclk, 10)
        await RisingEdge(dut.mclk)
        dut.sa.value = 0
        dut.sb.value = 0
    
    await ClockCycles(dut.mclk, 1000)
    await RisingEdge(dut.mclk)
    dut.sa.value = 1
    dut.sb.value = 0
    await ClockCycles(dut.mclk, 1000)
    await RisingEdge(dut.mclk)
    dut.sa.value = 0
    dut.sb.value = 0

    await ClockCycles(dut.mclk, 20000)
    
    dut._log.info("Testing done")

