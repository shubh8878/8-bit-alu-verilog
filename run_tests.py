import os
import shutil
import subprocess
import sys

project_folder = os.path.dirname(os.path.abspath(__file__))

alu_file = os.path.join(
    project_folder, "testbench", "rtl", "alu_8bit.v"
)
test_file = os.path.join(
    project_folder, "testbench", "test_alu_auto.v"
)

print("=" * 36)
print("       8-BIT ALU PROJECT TESTS")
print("=" * 36)

if not os.path.isfile(alu_file):
    print("FAIL: ALU design file missing")
    sys.exit(1)

if not os.path.isfile(test_file):
    print("FAIL: Automated testbench missing")
    sys.exit(1)

print("PASS: ALU design file found")
print("PASS: Automated testbench found")

iverilog = shutil.which("iverilog")
vvp = shutil.which("vvp")

if not iverilog or not vvp:
    print("\nSIMULATION NOT RUN")
    print("Icarus Verilog (iverilog and vvp) is not installed")
    print("or is not available in PATH.")
    print("Run the testbench on EDA Playground instead.")
    sys.exit(0)

output_file = os.path.join(project_folder, "alu_test.out")

compile_result = subprocess.run([
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
