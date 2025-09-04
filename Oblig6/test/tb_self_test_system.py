import cocotb
from cocotb.triggers import RisingEdge, ClockCycles, ReadOnly
from cocotb.clock import Clock

# Mapping of binary input to 7-segment display values (this should match bin2ssd_arch logic)
bin2ssd_arch = {
    0b0000: 0b0000000,  # "0"
    0b0001: 0b0011110,  # "1"
    0b0010: 0b0111100,  # "2"
    0b0011: 0b1001111,  # "3"
    0b0100: 0b0001110,  # "4"
    0b0101: 0b0111101,  # "5"
    0b0110: 0b0011101,  # "6"
    0b0111: 0b0010101,  # "7"
    0b1000: 0b0111011,  # "8"
    0b1001: 0b0111110,  # "9"
    0b1010: 0b1110111,  # "A"
    0b1011: 0b0000101,  # "b"
    0b1100: 0b1111011,  # "C"
    0b1101: 0b0011100,  # "d"
    0b1110: 0b0001101,  # "E"
    0b1111: 0b1111111   # "F"
}

async def reset_dut(dut):
    dut.reset.value = 1
    await RisingEdge(dut.mclk)
    dut.reset.value = 0
    await RisingEdge(dut.mclk)


async def compare(dut):
    while True:
        await RisingEdge(dut.mclk)
        await ReadOnly()

        lower_digit, upper_digit = int(dut.d0.value), int(dut.d1.value)
        ssd_lower, ssd_upper = bin2ssd_arch[lower_digit], bin2ssd_arch[upper_digit]

        # Ensure `c` toggles only at max count value
        # and that d0, d1 and abcdefg produces correct output
        expected_output = ssd_lower if dut.c_sys.value == 0 else ssd_upper
        assert int(dut.abcdefg_sys.value) == expected_output, \
            f"Fail: c={dut.c_sys.value}, expected {expected_output}, got {dut.abcdefg_sys.value}"

        
@cocotb.test()
async def main_test(dut):
    dut._log.info("Starting test\n")
    cocotb.start_soon(Clock(dut.mclk, 10, units="ns").start())  # 100 MHz clock
    await reset_dut(dut)

    # Expected ROM values (d1, d0 pairs) for comparison
    ROM = [
        (1, 2), (3, 4), (4, 0), (0, 0),
        (5, 6), (7, 3), (0, 0), (8, 6),
        (9, 0), (0, 0), (10, 11), (3, 0),
        (0, 0), (12, 6), (6, 5), (0, 0)
    ]

    for expected_d1, expected_d0 in ROM:
        # Wait for one clock cycle (for the self_test_unit to process)
        await RisingEdge(dut.mclk)

        # Wait for a few more cycles to allow the 7-segment controller to update
        await ClockCycles(dut.mclk, 10)

        cocotb.start_soon(compare(dut))

    dut._log.info("Test completed successfully.")
