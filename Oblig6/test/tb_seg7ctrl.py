import cocotb
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly, ClockCycles
from cocotb.clock import Clock

bin2ssd = {
    0b0000: 0b1111110,
    0b0001: 0b0110000,
    0b0010: 0b1101101,
    0b0011: 0b1111001,
    0b0100: 0b0110011,
    0b0101: 0b1011011,
    0b0110: 0b1011111,
    0b0111: 0b1110000,
    0b1000: 0b1111111,
    0b1001: 0b1111011,
    0b1010: 0b1110111,
    0b1011: 0b0011111,
    0b1100: 0b1001110,
    0b1101: 0b0111101,
    0b1110: 0b1001111,
    0b1111: 0b1000111
}

async def reset_dut(dut):
    dut.reset.value = 1
    dut.d0.value, dut.d1.value = 0b0000, 0b0000
    await FallingEdge(dut.mclk)
    dut.reset.value = 0
    await RisingEdge(dut.mclk)

async def stimuli_generator(dut):
    for val in range(16):
        await RisingEdge(dut.mclk)
        dut.d0.value = val
        dut.d1.value = (val + 1) % 16  # d1 gets a different value
        await RisingEdge(dut.mclk)

async def compare(dut):
    dut._log.info("Starting compare...")
    last_c = dut.c.value
    last_count = None
    while True:
        await RisingEdge(dut.mclk)
        await ReadOnly()

        lower_digit, upper_digit = int(dut.d0.value), int(dut.d1.value)
        ssd_lower, ssd_upper = bin2ssd[lower_digit], bin2ssd[upper_digit]

        dut._log.info(f"d0: {lower_digit}")
        dut._log.info(f"d1: {upper_digit}")
        dut._log.info(f"d0 bin2ssd: {ssd_lower}")
        dut._log.info(f"d1 bin2ssd: {ssd_upper}")

        expected_output = ssd_lower if dut.c.value == 0 else ssd_upper
        assert int(dut.abcdefg.value) == expected_output, \
            f"Fail: c={dut.c.value}, expected {expected_output}, got {dut.abcdefg.value}"

        # Ensure `c` toggles only at max count value
        if last_count != dut.count_val.value:
            if dut.count_val.value == "111111111111111111111":
                assert dut.c.value != last_c, f"Fail: c did not toggle at max count_val"
                last_c = dut.c.value

            last_count = dut.count_val.value
    

@cocotb.test()
async def main_test(dut):
    cocotb.start_soon(Clock(dut.mclk, 100, units="ns").start())
    dut._log.info("Starting tests")
    await reset_dut(dut)
    
    cocotb.start_soon(compare(dut))
    cocotb.start_soon(stimuli_generator(dut))

    await ClockCycles(dut.mclk, 10000)  

    dut._log.info("Testing done. All tests passed")
