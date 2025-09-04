import cocotb
from cocotb import start_soon
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, ClockCycles, Timer
from cocotb.utils import get_sim_time
import random

CLOCK_PERIOD_NS = 10


# Skeleton for task d starting here:
async def reset_dut(dut):
    await RisingEdge(dut.clk)
    dut.reset.value = 1
    dut.pdm_pulse.value = 0
    dut.mea_req.value = 0
    dut.mea_ack.value = 0
    # Vectors
    dut.setpoint.value = 0b00000000
    dut.min_off.value = 0b00000000
    dut.min_on.value = 0b00000000
    dut.max_on.value = 0b00000000
    await ClockCycles(dut.clk, 10)
    await FallingEdge(dut.clk)
    dut.reset.value = 0

async def stimuli_generator(dut):
    dut.min_on.value = 0b00000101
    dut.min_off.value = 0b00001010
    dut.max_on.value = 0b11001000

async def setpoint_generator(dut):
    for _ in range(50):
        dut.setpoint.value = random.randint(0, 255)
        await ClockCycles(dut.clk, 10)

async def mea_req_generator(dut):
    for _ in range(5):
        dut.mea_req.value = 1
        await ClockCycles(dut.clk, 5)
        dut.mea_ack.value = 0
        await ClockCycles(dut.clk, 400)


async def max_on_check(dut):
    while True:
        await RisingEdge(dut.pdm_pulse)
        start = get_sim_time('ns')

        await FallingEdge(dut.pdm_pulse)
        end = get_sim_time('ns')
        duration = end-start
        cycles = int(duration/CLOCK_PERIOD_NS)

        assert cycles <= int(dut.max_on.value)+1, (
            f"""Pulse of {cycles} cycles greater than 
            max_on: {int(dut.max_on.value)}""")

async def min_on_check(dut):
    while True:
        await FallingEdge(dut.pdm_pulse)
        start = get_sim_time('ns')

        await RisingEdge(dut.pdm_pulse)
        end = get_sim_time('ns')
        duration = end-start
        cycles = int(duration/CLOCK_PERIOD_NS)

        assert cycles >= int(dut.min_on.value) + 1,(
            f"""Pulse of {cycles} cycles less than 
            min_on: {int(dut.min_on.value)}""")
        
async def mea_ack_pulse_assertion_check(dut):
    while True:
        pulsecount = 0
        await RisingEdge(dut.pdm_pulse)
        pulsecount += 1

        while dut.pdm_pulse.value:
            assert dut.mea_ack == 0,(
                f"mea_ack is asserted during pulse nr. {pulsecount}")

async def mea_ack_assert_mea_req_check(dut):
    while True:
        await RisingEdge(dut.mea_req)
        start = get_sim_time('ns')

        await RisingEdge(dut.mea_ack)
        end = get_sim_time('ns')
        duration = end-start

        assert duration <= CLOCK_PERIOD_NS * 2,(
            """mea_ack is not asserted within two clock
            cycles after mea_req is asserted""")
        assert dut.pdm_pulse == 0, (
            f"PDM pulse is high: {dut.pdm_pulse.value}")

async def mea_ack_deassert_mea_req_check(dut):
    while True:
        await FallingEdge(dut.mea_req)
        start = get_sim_time('ns')

        assert dut.mea_ack.value == 1, (
            "mea_ack is not high")
        
        await FallingEdge(dut.mea_ack)
        end = get_sim_time('ns')
        duration = end-start

        assert duration <= CLOCK_PERIOD_NS * 2,(
            """mea_ack is not deasserted within two clock
            cycles after mea_req is deasserted""")

async def reasonable_duty_cycle_check(dut):
    while True:
        start = get_sim_time('ns')
        prcnt = int(dut.setpoint.value) / int('11111111', 2) * 100

        await RisingEdge(dut.pdm_pulse)
        dutystart = get_sim_time('ns')

        await FallingEdge(dut.pdm_pulse)
        dutyend = get_sim_time('ns')
        end = dutyend
        duty_cycle = dutyend-dutystart
        full_duration = end-start
        duty_prcnt = int(duty_cycle / full_duration * 100)

        assert duty_prcnt <= prcnt,(
            f"""Duty cycle makes for {duty_prcnt} of the 
            full duration of {full_duration}""")

@cocotb.test()
async def main_test(dut):
    dut._log.info("Running test...")
    start_soon(Clock(dut.clk, 10, units="ns").start())
    await reset_dut(dut)

    await Timer(100, units="ns")
    # Starting tests
    cocotb.start_soon(max_on_check(dut))
    cocotb.start_soon(min_on_check(dut))
    cocotb.start_soon(mea_ack_pulse_assertion_check(dut))
    cocotb.start_soon(mea_ack_assert_mea_req_check(dut))
    cocotb.start_soon(mea_ack_deassert_mea_req_check(dut))
    cocotb.start_soon(reasonable_duty_cycle_check(dut))
    # Generating values
    await cocotb.start_soon(stimuli_generator(dut))
    cocotb.start_soon(setpoint_generator(dut))
    cocotb.start_soon(mea_req_generator(dut))
    await ClockCycles(dut.clk, 500)
    dut._log.info("Running test... done!")