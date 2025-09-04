import cocotb
from cocotb import start_soon
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

async def reset(dut):
    """Reset the entire system"""
    dut.reset.value = 1
    await ClockCycles(dut.mclk, 5)
    dut.reset.value = 0
    await ClockCycles(dut.mclk, 5)

@cocotb.test()
async def test_pwm_output_synchronization(dut):

    # Start system clock
    clock = Clock(dut.mclk, 10, units="ns")  # 100 MHz clock
    start_soon(clock.start())

    # Apply reset
    await reset(dut)

    # Monitor output behavior
    for _ in range(5000):  # Run simulation for enough time
        await RisingEdge(dut.mclk)

        # Log important signals
        dut._log.info(f"DutyCycle: {dut.duty_cycle.value}, "
                      f"DIR: {dut.dir.value}, EN: {dut.en.value}, "
                      f"DIR_synch: {dut.dir_synch.value}, EN_synch: {dut.en_synch.value}")

        # Ensure synchronized signals match expectations
        assert dut.dir_synch.value == dut.dir.value, "DIR synchronization failed"
        assert dut.en_synch.value == dut.en.value, "EN synchronization failed"
