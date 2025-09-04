import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def main_test(dut):

    dut._log.info("Running test...")

    # Testing input-->output values according to the truth table
    dut.SW.value = 0b00
    await Timer(20, units="ns")

    assert dut.LD.value == 0b1110

    
    dut.SW.value = 0b01
    await Timer(20, units="ns")

    assert dut.LD.value == 0b1101


    dut.SW.value = 0b10
    await Timer(20, units="ns")

    assert dut.LD.value == 0b1011


    dut.SW.value = 0b11
    await Timer(20, units="ns")

    assert dut.LD.value == 0b0110

    dut._log.info("Running test... done")