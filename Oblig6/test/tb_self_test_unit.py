import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly, ClockCycles, Timer
from cocotb.clock import Clock

async def reset_dut(dut):
    dut.reset.value = 1
    await RisingEdge(dut.mclk)
    dut.reset.value = 0
    await RisingEdge(dut.mclk)

@cocotb.test()
async def main_test(dut):
    dut._log.info("Starting test\n")
    cocotb.start_soon(Clock(dut.mclk, 10, units="ns").start())
    await reset_dut(dut)

    ROM = [
    (1, 2), (3, 4), (4, 0), (0, 0),
    (5, 6), (7, 3), (0, 0), (8, 6),
    (9, 0), (0, 0), (10, 11), (3, 0),
    (0, 0), (12, 6), (6, 5), (0, 0)
    ]


    for expected_d1, expected_d0 in ROM:
        await RisingEdge(dut.mclk)
        await ClockCycles(dut.mclk, 10)

        # dut._log.info(f"Expected d0: {expected_d0}")
        # dut._log.info(f"Expected d1: {expected_d1}")
        # dut._log.info(f"Actual d0: {dut.d0.value}")
        # dut._log.info(f"Actual d1: {dut.d1.value}")
        dut._log.info(f"ROM index: {dut.ROM_index.value}")
        # dut._log.info(f"Counter: {dut.counter.value}")
        
        # Check outputs
        assert dut.d1.value == expected_d1, f"Expected d1={expected_d1}, got {int(dut.d1.value)}"
        assert dut.d0.value == expected_d0, f"Expected d0={expected_d0}, got {int(dut.d0.value)}"


    