# Traffic Light Controller using Verilog (Moore FSM)

## Overview
This project implements a Traffic Light Controller using a Moore Finite State Machine in Verilog.
The controller cycles through RED, GREEN, and YELLOW states based on clock cycles.

## State Timing
- RED    → 10 clock cycles
- GREEN  → 10 clock cycles
- YELLOW → 5 clock cycles

## Files
- traffic_light.v     : RTL design
- traffic_light_tb.v  : Testbench
- images              : Simulation screenshots

## Simulation
Simulated using Icarus Verilog on EDA Playground with waveform verification.

## Outputs
- red
- yellow
- green
