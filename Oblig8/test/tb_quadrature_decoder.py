import cocotb
from cocotb.clock import Clock
from cocotb.regression import TestFactory
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles

state_conv_table = {
    0: 'S_0',
    1: 'S_1',
    2: 'S_2',
    3: 'S_3',
    4: 'S_reset',
    5: 'S_init'
}

async def reset_dut(dut):
    """Function to reset the DUT."""
    await FallingEdge(dut.mclk)
    dut.reset.value = 1
    await RisingEdge(dut.mclk)
    dut.reset.value = 0

@cocotb.test()
async def main_test(dut):
    """Test the quadrature decoder FSM."""
    dut._log.info("Starting FSM test...")


    clock = Clock(dut.mclk, 10, units="ns")
    cocotb.start_soon(clock.start())


    await reset_dut(dut)
    
    # Simulate the FSM for a few clock cycles
    for cycle in range(20):
        if cycle % 4 == 0:
            dut.SA.value = 0
            dut.SB.value = 0
        elif cycle % 4 == 1:
            dut.SA.value = 1
            dut.SB.value = 0
        elif cycle % 4 == 2:
            dut.SA.value = 0
            dut.SB.value = 1
        else:
            dut.SA.value = 1
            dut.SB.value = 1
        
        await RisingEdge(dut.mclk)

        current_state = int(dut.current_state)
        dut._log.info(f"Cycle {cycle}: SA={dut.SA.value}, SB={dut.SB.value}, State={state_conv_table[current_state]}, pos_inc={dut.pos_inc.value}, pos_dec={dut.pos_dec.value}")
    
    dut._log.info("Testing completed")
