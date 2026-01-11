# Pulse Generator (Verilog)

## Overview
This repository contains a **parameterized pulse generator** written in **Verilog HDL**.
The module generates a periodic digital pulse with configurable **pulse duration** and **pulse period**, making it suitable for timing control and test signal generation in digital systems.

---

## Module Description
The pulse generator is implemented using a **clock-driven 7-bit counter**.

- The counter increments on every **positive edge of the clock**
- When the counter reaches `PULSE_PERIOD - 1`, it resets to zero
- The output pulse (`o_pulse`) is **HIGH** for `PULSE_DURATION` clock cycles
- The output remains **LOW** for the remaining cycles of the period
- An **active-high synchronous reset** initializes both the counter and output

---

## Parameters

| Parameter Name   | Description |
|-----------------|-------------|
| PULSE_DURATION  | Number of clock cycles the pulse stays HIGH |
| PULSE_PERIOD    | Total number of clock cycles in one pulse period |

---

## Ports

| Port Name | Direction | Description |
|----------|-----------|-------------|
| i_clk    | Input     | System clock |
| i_rst    | Input     | Active-high synchronous reset |
| o_pulse  | Output    | Generated pulse output |

---

## File Information
- **Module Name:** pulse_generator
- **Language:** Verilog HDL
- **Timescale:** 1ns / 1ps

---

## Applications
- Timing and control logic
- Pulse and waveform generation
- Digital testbench stimulus
- Clock-based triggering systems

---

