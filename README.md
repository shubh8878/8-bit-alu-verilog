# 8-bit ALU Design and Verification

## Project Overview

This project implements an 8-bit Arithmetic Logic Unit (ALU)
using Verilog HDL.

The ALU performs arithmetic and logical operations on two
8-bit unsigned inputs.

## Operations

| Select | Operation   | Description        |
| ------ | ----------- | ------------------ |
| 00     | Addition    | Adds A and B       |
| 01     | Subtraction | Subtracts B from A |
| 10     | AND         | Bitwise AND        |
| 11     | OR          | Bitwise OR         |

## Tools Used

- Verilog HDL
- EDA Playground
- Icarus Verilog
- Visual Studio Code

## Verification

An automated testbench checks the ALU operations against
expected results.

Verified test cases:

- Addition: 5 + 3 = 8
- Addition overflow: 255 + 1 gives 8-bit result 0
- Subtraction: 5 - 3 = 2
- Unsigned subtraction: 3 - 5 gives 8-bit result 254
- Bitwise AND: 5 AND 3 = 1
- Bitwise OR: 5 OR 3 = 7

All six current automated test cases passed.

## Project Status

Simulation-based learning project.
No physical hardware implementation yet.
