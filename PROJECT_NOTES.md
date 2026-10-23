# 8-Bit ALU Project Notes

## Project Objective

To design an 8-bit Arithmetic Logic Unit (ALU) using Verilog HDL and verify its operations using a testbench.

## Supported Operations

| Select | Operation   | Description              |
| ------ | ----------- | ------------------------ |
| 00     | Addition    | Adds inputs A and B      |
| 01     | Subtraction | Subtracts B from A       |
| 10     | Bitwise AND | Performs AND on each bit |
| 11     | Bitwise OR  | Performs OR on each bit  |

## Tools Used

- Verilog HDL
- EDA Playground
- Icarus Verilog simulator on EDA Playground
- Python 3
- Git

## Verification

The automated Verilog testbench checks addition, overflow behavior, subtraction, negative unsigned results, bitwise AND, and bitwise OR.

## Future Improvements

- Add XOR and NOT operations.
- Add carry and borrow flag handling.
- Add more automated test cases.
- Run local simulation with Icarus Verilog.
- Add waveform screenshots to document signal behavior.

## Project Status

The basic 8-bit ALU design and its testbench have been simulated on EDA Playground. Local simulator setup is still pending.
