
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
