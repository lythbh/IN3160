import cocotb
from random import randrange
from cocotb import start_soon
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ReadOnly, Timer

# Skeleton for task d starting here:
async def reset_dut(dut):
    await FallingEdge(dut.mclk)
    dut.rst_n.value = 0
    dut.indata1.value = 0
    dut.indata2.value = 0
    await RisingEdge(dut.mclk)
    dut.rst_n.value = 1

def parity(value):
    """ Function to calculate what the parity of value is.
        arguments:
        value(cocotb.binary.BinaryValue): Value to calculate parity from (dut.indata*.value).
        return:
        result(int): Parity of value (1 or 0).
    """
    result = 0
    for i in range(value.n_bits):
        result = result ^ (value & 1)
        value = value >> 1
    return result

def predict(dut):
    pred_parity_indata1 = parity(dut.indata1.value)
    pred_parity_indata2 = parity(dut.indata2.value)

    # ^ is bitwise XOR in python
    pred_par = pred_parity_indata1 ^ pred_parity_indata2 
    return pred_par
   

async def stimuli_generator(dut):

    for i in range(20):
        await FallingEdge(dut.mclk)
        dut.indata1.value = randrange(0, 0xFFFF)
        dut.indata2.value = i
        await RisingEdge(dut.mclk)
    # Awaiting one last rising_edge(mclk) without changes
    await RisingEdge(dut.mclk)


async def compare(dut):

    while True:
      await RisingEdge(dut.mclk)
      await ReadOnly()
      assert dut.par.value == predict(dut), ("output is not as predicted")
      dut._log.info("Parity_value: "+str(dut.toggle_parity.value))


@cocotb.test()
async def main_test(dut):
    dut._log.info("Running test...")
    start_soon(Clock(dut.mclk, 100, units="ns").start())
    await reset_dut(dut)

    await Timer(1000, units="ns")
    cocotb.start_soon(compare(dut))
    await start_soon(stimuli_generator(dut))
    dut._log.info("Running test... done")
