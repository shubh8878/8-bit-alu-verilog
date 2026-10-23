# 8-Bit ALU Project Notes

## Objective

Design and verify an 8-bit Arithmetic Logic Unit using Verilog HDL.

## Inputs and Outputs

- A: 8-bit input
- B: 8-bit input
- sel: 3-bit operation selector
- result: 8-bit output
- carry: Addition carry flag
- borrow: Unsigned subtraction borrow flag
- zero: Indicates a zero result
- overflow: Signed arithmetic overflow flag

## Supported Operations

| sel | Operation |
|-----|-----------|
| 000 | Addition |
| 001 | Subtraction |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | NOT A |
| 110 | NAND |
| 111 | NOR |

## Tools

- Verilog HDL
- EDA Playground
- Icarus Verilog simulator through EDA Playground
- Python 3
- Git and GitHub

## Verification

The automated testbench checks arithmetic results, logical operations,
carry, borrow, zero, and signed overflow flags.

Test cases include:
- 5 + 3 = 8
- 255 + 1 produces result 0 with carry set
- 127 + 1 triggers signed addition overflow
- 5 - 3 = 2
- 3 - 5 produces unsigned 8-bit result 254 with borrow set
- 128 - 1 produces 127 with signed subtraction overflow
- AND, OR, XOR, NOT, NAND, and NOR operations
- Zero flag when the result is zero

The updated design and automatic testbench have been run successfully
on EDA Playground. Local simulator setup remains pending.

## Future Improvements

- Capture and add waveform screenshots.
- Run simulation locally after installing a compatible simulator.
- Add randomized test cases.
- Explore FPGA synthesis and hardware implementation.

## Project Status

RTL design and simulation-based educational project.
No physical hardware implementation has been completed.
