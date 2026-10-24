Last login: Fri Oct 23 19:36:18 on ttys000
mac@macs-MacBook-Pro ~ % cd "$HOME/Desktop/PROJECT ALU"
mac@macs-MacBook-Pro PROJECT ALU % nano testbench/test_alu_auto.v
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
mac@macs-MacBook-Pro PROJECT ALU % git diff --check
mac@macs-MacBook-Pro PROJECT ALU % git status --short
 M testbench/rtl/alu_8bit.v
 M testbench/test_alu_auto.v
?? testbench/test_alu_auto.v.save
?? testbench/test_alu_auto.vo
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
mac@macs-MacBook-Pro PROJECT ALU % ls -lh testbench/test_alu_auto.v.save testbench/test_alu_auto.vo
-rw-------  1 mac  staff   3.1K 23 Oct 19:38 testbench/test_alu_auto.v.save
-rw-r--r--  1 mac  staff   1.5K 23 Oct 19:41 testbench/test_alu_auto.vo
mac@macs-MacBook-Pro PROJECT ALU % rm testbench/test_alu_auto.v.save testbench/test_alu_auto.vo
mac@macs-MacBook-Pro PROJECT ALU % git status --short
 M testbench/rtl/alu_8bit.v
 M testbench/test_alu_auto.v
mac@macs-MacBook-Pro PROJECT ALU % git status --short
 M testbench/rtl/alu_8bit.v
 M testbench/test_alu_auto.v
mac@macs-MacBook-Pro PROJECT ALU % grep -nE 'input ec|input exp|ALL TESTS PASSED|zero !==|zero !=' testbench/test_alu_auto.v
25:    input exp_carry, exp_borrow, exp_overflow;
64:        $display("ALL TESTS PASSED!");
mac@macs-MacBook-Pro PROJECT ALU % input exp_carry, exp_borrow, exp_overflow;
zsh: command not found: input
mac@macs-MacBook-Pro PROJECT ALU % nano testbench/test_alu_auto.v
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
mac@macs-MacBook-Pro PROJECT ALU % >....                                                                                
    $dumpfile("alu.vcd");
    $dumpvars(0, test_alu_auto);

    a=5; b=3; sel=0; check(8,0,0,0,0);
    a=255; b=1; sel=0; check(0,1,0,1,0);
    a=127; b=1; sel=0; check(128,0,0,0,1);

    a=5; b=3; sel=1; check(2,0,0,0,0);
    a=3; b=5; sel=1; check(254,0,1,0,0);
    a=128; b=1; sel=1; check(127,0,0,0,1);

    a=5; b=3; sel=2; check(1,0,0,0,0);
    a=5; b=3; sel=3; check(7,0,0,0,0);
    a=5; b=3; sel=4; check(6,0,0,0,0);
    a=5; b=0; sel=5; check(250,0,0,0,0);
    a=5; b=3; sel=6; check(254,0,0,0,0);
    a=5; b=3; sel=7; check(248,0,0,0,0);
    a=0; b=0; sel=2; check(0,0,0,1,0);

    if (errors == 0)
        $display("ALL TESTS PASSED!");
    else
        $display("TESTS FAILED: %d errors", errors);

    $finish;
end

endmodule
EOF
mac@macs-MacBook-Pro PROJECT ALU % grep -nE 'input ec|zero !== ez|ALL TESTS PASSED' testbench/test_alu_auto.v
20:    input ec, eb, ez, eo;
24:            borrow !== eb || zero !== ez || overflow !== eo) begin
57:        $display("ALL TESTS PASSED!");
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
git diff --check
git status --short
 M testbench/rtl/alu_8bit.v
 M testbench/test_alu_auto.v
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
cat README.md
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
mac@macs-MacBook-Pro PROJECT ALU % >....                                                                                
- Verilog HDL
- EDA Playground for online simulation
- Visual Studio Code for editing
- Git and GitHub for version control

## Verification

The automated testbench checks expected results and status flags.

Test scenarios include:

- Addition: 5 + 3 = 8
- Carry: 255 + 1 produces an 8-bit result of 0 with carry set
- Signed addition overflow: 127 + 1
- Subtraction: 5 - 3 = 2
- Borrow: 3 - 5 produces an 8-bit result of 254
- Signed subtraction overflow: -128 - 1
- AND, OR, XOR, NOT, NAND and NOR operations
- Zero flag when the result is zero

Run the design and testbench on EDA Playground using an
appropriate Verilog simulator. The local testbench includes
automatic PASS/FAIL checks.

## Project Status

Educational RTL design and simulation project.
No physical hardware implementation has been completed.
EOF
mac@macs-MacBook-Pro PROJECT ALU % cat README.md
# 8-Bit Arithmetic Logic Unit (ALU)

An 8-bit Arithmetic Logic Unit designed using Verilog HDL.

The ALU accepts two 8-bit inputs, A and B, and performs
arithmetic and bitwise logical operations based on a 3-bit
selection input.

## Operations

| Select | Operation | Description |
|--------|-----------|-------------|
| 000 | Addition | Adds A and B |
| 001 | Subtraction | Subtracts B from A |
| 010 | AND | Bitwise AND |
| 011 | OR | Bitwise OR |
| 100 | XOR | Bitwise XOR |
| 101 | NOT | Bitwise complement of A |
| 110 | NAND | Bitwise NAND |
| 111 | NOR | Bitwise NOR |

## Status Flags

- Carry: Indicates carry out during addition.
- Borrow: Indicates unsigned subtraction when A is less than B.
- Zero: Indicates that the result is zero.
- Overflow: Indicates signed 8-bit arithmetic overflow for addition or subtraction.

## Tools Used

- Verilog HDL
- EDA Playground for online simulation
- Visual Studio Code for editing
- Git and GitHub for version control

## Verification

The automated testbench checks expected results and status flags.

Test scenarios include:

- Addition: 5 + 3 = 8
- Carry: 255 + 1 produces an 8-bit result of 0 with carry set
- Signed addition overflow: 127 + 1
- Subtraction: 5 - 3 = 2
- Borrow: 3 - 5 produces an 8-bit result of 254
- Signed subtraction overflow: -128 - 1
- AND, OR, XOR, NOT, NAND and NOR operations
- Zero flag when the result is zero

Run the design and testbench on EDA Playground using an
appropriate Verilog simulator. The local testbench includes
automatic PASS/FAIL checks.

## Project Status

Educational RTL design and simulation project.
No physical hardware implementation has been completed.
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
cat PROJECT_NOTES.md
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
mac@macs-MacBook-Pro PROJECT ALU % >....                                                                                

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
EOF
mac@macs-MacBook-Pro PROJECT ALU % cat run_tests.py

import os

print("================================")
print("       ALU PROJECT TESTS")
print("================================")

project_folder = os.path.dirname(os.path.abspath(__file__))

alu_file = os.path.join(
    project_folder, "testbench", "rtl", "alu_8bit.v"
)

test_file = os.path.join(
    project_folder, "testbench", "test_alu_auto.v"
)

if os.path.exists(alu_file):
    print("PASS: ALU design file found")
else:
    print("FAIL: ALU design file missing")

if os.path.exists(test_file):
    print("PASS: Automated testbench found")
else:
    print("FAIL: Automated testbench missing")

print("================================")
print("File check completed.")
mac@macs-MacBook-Pro PROJECT ALU % >....                                                                                
    iverilog, "-g2012", "-o", output_file,
    alu_file, test_file
], capture_output=True, text=True)

if compile_result.returncode != 0:
    print("\nFAIL: Verilog compilation failed")
    print(compile_result.stderr)
    sys.exit(1)

simulation = subprocess.run(
    [vvp, output_file], capture_output=True, text=True
)

print("\nSimulation output:")
print(simulation.stdout)

if simulation.stderr:
    print(simulation.stderr)

if simulation.returncode != 0 or "TESTS FAILED:" in simulation.stdout:
    print("FAIL: Simulation or testbench failed")
    sys.exit(1)

if "ALL TESTS PASSED!" not in simulation.stdout:
    print("FAIL: Testbench did not confirm all tests passed")
    sys.exit(1)

print("PASS: All automated tests passed")
PY
mac@macs-MacBook-Pro PROJECT ALU % python3 run_tests.py
====================================
       8-BIT ALU PROJECT TESTS
====================================
PASS: ALU design file found
PASS: Automated testbench found

SIMULATION NOT RUN
Icarus Verilog (iverilog and vvp) is not installed
or is not available in PATH.
Run the testbench on EDA Playground instead.
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
git diff --check
git status --short
 M PROJECT_NOTES.md
 M README.md
 M run_tests.py
 M testbench/rtl/alu_8bit.v
 M testbench/test_alu_auto.v
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"

git add README.md PROJECT_NOTES.md run_tests.py testbench/rtl/alu_8bit.v testbench/test_alu_auto.v

git commit -m "Upgrade 8-bit ALU with eight operations and status flags"
[main 1b98eea] Upgrade 8-bit ALU with eight operations and status flags
 Committer: mac <mac@macs-MacBook-Pro.local>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

 5 files changed, 198 insertions(+), 87 deletions(-)
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
git push origin main
Enumerating objects: 17, done.
Counting objects: 100% (17/17), done.
Delta compression using up to 12 threads
Compressing objects: 100% (9/9), done.
Writing objects: 100% (9/9), 3.65 KiB | 3.65 MiB/s, done.
Total 9 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/shubh8878/8-bit-alu-verilog.git
   c706e14..1b98eea  main -> main
mac@macs-MacBook-Pro PROJECT ALU % find "$HOME/Desktop" -maxdepth 1 -type f \
  \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) -print
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.21.10 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.51.19 PM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 9.04.05 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.21.47 PM.png
/Users/mac/Desktop/Screenshot 2026-10-11 at 4.01.40 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.25.39 PM.png
/Users/mac/Desktop/Screenshot 2026-10-16 at 11.40.49 AM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 9.19.01 AM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.06.45 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 12.15.50 PM.png
/Users/mac/Desktop/Screenshot 2026-09-10 at 3.31.51 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.20.08 PM.png
/Users/mac/Desktop/Screenshot 2026-10-16 at 11.41.30 AM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.19.47 PM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 9.06.14 PM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 10.40.09 AM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.50.48 PM.png
/Users/mac/Desktop/Screenshot 2026-10-13 at 9.54.25 AM.png
/Users/mac/Desktop/Screenshot 2026-10-13 at 10.16.04 AM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 8.41.05 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.49.27 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.56.47 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.21.28 PM.png
/Users/mac/Desktop/Screenshot 2026-09-27 at 8.55.37 AM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.18.22 PM.png
/Users/mac/Desktop/Screenshot 2026-09-06 at 8.53.10 AM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.43.38 PM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 8.28.07 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.31.15 PM.png
/Users/mac/Desktop/Screenshot 2026-10-13 at 9.47.25 AM.png
/Users/mac/Desktop/Screenshot 2026-09-20 at 8.50.22 AM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.01.02 PM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 9.05.27 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.21.20 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.27.14 PM.png
/Users/mac/Desktop/Screenshot 2026-10-05 at 10.01.27 AM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 8.59.35 PM.png
/Users/mac/Desktop/Screenshot 2026-09-22 at 12.37.20 PM.png
/Users/mac/Desktop/Screenshot 2026-09-27 at 8.55.23 AM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 9.20.11 AM.png
/Users/mac/Desktop/Screenshot 2026-10-16 at 11.53.45 AM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 4.09.17 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.46.51 PM.png
/Users/mac/Desktop/Screenshot 2026-10-05 at 9.24.57 AM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 9.19.50 AM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.13.34 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.44.17 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.47.57 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 11.56.37 AM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.21.22 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.36.05 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.30.04 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.11.43 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 12.49.47 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.31.00 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.36.33 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 8.56.39 PM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 8.56.50 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.37.58 PM.png
/Users/mac/Desktop/Screenshot 2026-10-07 at 9.32.03 PM.png
/Users/mac/Desktop/Screenshot 2026-09-06 at 8.42.10 AM.png
/Users/mac/Desktop/Screenshot 2026-09-06 at 8.30.23 AM.png
/Users/mac/Desktop/Screenshot 2026-09-27 at 8.53.10 AM.png
/Users/mac/Desktop/Screenshot 2026-10-16 at 10.10.01 AM.png
/Users/mac/Desktop/Screenshot 2026-10-16 at 10.31.01 AM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.43.41 PM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 9.16.31 AM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 12.00.08 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.22.57 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.37.33 PM.png
/Users/mac/Desktop/Screenshot 2026-09-06 at 8.34.28 AM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 9.05.38 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.37.42 PM.png
/Users/mac/Desktop/Screenshot 2026-09-27 at 8.22.50 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.22.57 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.50.14 PM.png
/Users/mac/Desktop/Screenshot 2026-09-05 at 9.56.29 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 8.43.46 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.11.47 PM.png
/Users/mac/Desktop/Screenshot 2026-09-21 at 9.51.02 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.52.16 PM.png
/Users/mac/Desktop/Screenshot 2026-09-02 at 9.10.14 PM.png
/Users/mac/Desktop/Screenshot 2026-09-03 at 9.27.42 PM.png
/Users/mac/Desktop/Screenshot 2026-09-07 at 8.00.07 PM.png
mac@macs-MacBook-Pro PROJECT ALU % open "$HOME/Desktop/Screenshot 2026-10-23 at 7.22.57 PM.png"
The file /Users/mac/Desktop/Screenshot 2026-10-23 at 7.22.57 PM.png does not exist.
mac@macs-MacBook-Pro PROJECT ALU % find "$HOME/Desktop" -maxdepth 1 -type f -iname "*2026-10-23*" -print
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.21.10 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 12.15.50 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.20.08 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.19.47 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.21.28 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.18.22 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.21.20 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.13.34 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 11.56.37 AM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 12.49.47 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 12.00.08 PM.png
/Users/mac/Desktop/Screenshot 2026-10-23 at 7.22.57 PM.png
mac@macs-MacBook-Pro PROJECT ALU % open "$HOME/Desktop"/Screenshot\ 2026-10-23\ at\ 7.22.57*.png
mac@macs-MacBook-Pro PROJECT ALU % open "$HOME/Desktop"/Screenshot\ 2026-10-23\ at\ 7.21.28*.png
mac@macs-MacBook-Pro PROJECT ALU % open "$HOME/Desktop"/Screenshot\ 2026-10-23\ at\ 7.21.10*.png
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
mkdir -p docs
mac@macs-MacBook-Pro PROJECT ALU % ls -lh "$HOME/Desktop/PROJECT ALU/docs/"
total 0
mac@macs-MacBook-Pro PROJECT ALU % cp "$HOME/Desktop"/Screenshot\ 2026-10-23\ at\ 7.21.10*.png "$HOME/Desktop/PROJECT ALU/docs/alu_waveform.png"
mac@macs-MacBook-Pro PROJECT ALU % ls -lh "$HOME/Desktop/PROJECT ALU/docs/"
total 8
-rw-r--r--@ 1 mac  staff   2.0K 23 Oct 20:11 alu_waveform.png
mac@macs-MacBook-Pro PROJECT ALU % cd "$HOME/Desktop/PROJECT ALU"
open -a TextEdit README.md
mac@macs-MacBook-Pro PROJECT ALU % 
