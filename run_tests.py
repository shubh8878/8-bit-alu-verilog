
import os
import shutil
import subprocess
import sys

project_folder = os.path.dirname(os.path.abspath(__file__))
rtl = os.path.join(project_folder, "testbench", "rtl")
tb = os.path.join(project_folder, "testbench")

print("=" * 45)
print("       8-BIT ALU PROJECT TEST SUITE")
print("=" * 45)

iverilog = shutil.which("iverilog")
vvp = shutil.which("vvp")

if not iverilog or not vvp:
    print("FAIL: iverilog or vvp not found in PATH")
    print("Activate the environment containing Icarus Verilog.")
    sys.exit(1)

# Each test has its required design files and testbench.
tests = [
    ("Half Adder",
     [os.path.join(rtl, "half_adder.v")],
     [os.path.join(rtl, "test_half_adder.v")]),

    ("Full Adder",
     [os.path.join(rtl, "full_adder.v")],
     [os.path.join(tb, "test_full_adder.v")]),

    ("8-bit Adder",
     [os.path.join(rtl, "full_adder.v"),
      os.path.join(rtl, "adder_8bit.v")],
     [os.path.join(tb, "test_adder_8bit.v")]),

    ("Subtractor",
     [os.path.join(rtl, "subtractor_8bit.v")],
     [os.path.join(tb, "test_subtractor_8bit.v")]),

    ("AND Gate",
     [os.path.join(project_folder, "and_gate.v")],
     [os.path.join(tb, "test_and_gate.v")]),

    ("OR Gate",
     [os.path.join(rtl, "or_gate.v")],
     [os.path.join(tb, "test_or_gate.v")]),

    ("NOT Gate",
     [os.path.join(rtl, "not_gate.v")],
     [os.path.join(tb, "test_not_gate.v")]),

    ("ALU Fixed Tests",
     [os.path.join(rtl, "alu_8bit.v")],
     [os.path.join(tb, "test_alu_auto.v")]),

    ("ALU Random Tests",
     [os.path.join(rtl, "alu_8bit.v")],
     [os.path.join(tb, "test_alu_random.v")]),
]

passed = 0
failed = 0

for name, design_files, test_files in tests:
    print("\n" + "-" * 45)
    print("TEST:", name)

    all_files = design_files + test_files
    missing = [f for f in all_files if not os.path.isfile(f)]

    if missing:
        print("FAIL: Required file missing:")
        for filename in missing:
            print(" ", filename)
        failed += 1
        continue

    output_file = os.path.join(project_folder, "build",
                               "test_output.out")
    os.makedirs(os.path.dirname(output_file), exist_ok=True)

    compile_result = subprocess.run(
        [iverilog, "-g2012", "-o", output_file] + all_files,
        capture_output=True, text=True
    )

    if compile_result.returncode != 0:
        print("FAIL: Compilation error")
        print(compile_result.stderr)
        failed += 1
        continue

    simulation = subprocess.run(
        [vvp, output_file], capture_output=True, text=True
    )

    print(simulation.stdout, end="")

    if simulation.stderr:
        print(simulation.stderr, end="")

    output = simulation.stdout
    has_failure = (
        simulation.returncode != 0
        or "TESTS FAILED:" in output
        or "RANDOM TESTS FAILED:" in output
        or "FAIL:" in output
    )

    if name == "ALU Fixed Tests":
        has_failure = has_failure or "ALL TESTS PASSED!" not in output

    if name == "ALU Random Tests":
        has_failure = has_failure or (
            "RANDOM TESTS PASSED: 100 cases" not in output
        )

    if has_failure:
        print("RESULT: FAIL")
        failed += 1
    else:
        print("RESULT: PASS")
        passed += 1

print("\n" + "=" * 45)
print("FINAL SUMMARY")
print("Passed:", passed)
print("Failed:", failed)
print("=" * 45)

if failed:
    print("PROJECT TEST SUITE FAILED")
    sys.exit(1)

print("ALL PROJECT TESTS PASSED!")
