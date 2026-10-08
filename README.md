4-Digit 7-Segment FPGA Counter

A simple VHDL project for an FPGA that drives a 4-digit 7-segment display.

Features
Uses the FPGA system clock as the main clock.
Generates slower clock signals for different digits.
Displays numbers from 0–9.
Each of the four digits counts at a different speed.
Uses multiplexing to control all four 7-segment digits with one 7-segment data bus.
Digit Speeds
Digit	Counter Clock	Function
D0	1 Hz	Counts 0 → 9
D1	0.1 Hz	Counts 0 → 9
D2	0.01 Hz	Counts 0 → 9
D3	0.001 Hz	Counts 0 → 4