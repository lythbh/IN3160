import cocotb
from cocotb import start_soon
from cocotb.clock import Clock
from cocotb.triggers import * 
      
async def reset_dut(dut):
    await FallingEdge(dut.mclk)
    dut.reset.value = 1
    await RisingEdge(dut.mclk)
    dut.reset.value = 0

@cocotb.test()
async def main_test(dut):
    dut._log.info("Starting testing...")
    start_soon(Clock(dut.mclk, 10, units="ns").start())
    await reset_dut(dut)
    for i in range(1000):
        await ClockCycles(dut.mclk, 1)
        dut._log.info(dut.duty_cycle.value)
        

    await ClockCycles(dut.mclk, 3500)
    
    dut._log.info("Testing done. All tests passed")

