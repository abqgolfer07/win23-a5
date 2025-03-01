#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"


# Test 01: Ensure the program runs without error with a simple, valid invocation.
if ! $CALCULATOR 1 + 1; then  # If the return code of $PROGRAM is non-zero (i.e. error)...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

# Test 02: Ensure simple case has correct output...
if [[ $($CALCULATOR 1 + 1) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

# Test 03: Ensure program errors with an invalid operand
if $CALCULATOR 3 @ 2; then  # If the return code of $PROGRAM is zero (i.e. success)...
  echo 'ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!'
  exit 1
fi

# Test 04: Make sure subtraction works 
if [[ $($CALCULATOR 5 - 3) -ne 2 ]]; then
  echo 'ERROR! Subtraction test (5 - 3) did not return 2!'
  exit 1
fi

# Test 05: make sure multiplication works
if [[ $($CALCULATOR 4 \* 2) -ne 8 ]]; then
  echo 'ERROR! Multiplication test (4 * 2) did not return 8!'
  exit 1
fi

# Test 06: Make sure division works 
if [[ $($CALCULATOR 8 / 2) -ne 4 ]]; then
  echo 'ERROR! Division test (8 / 2) did not return 4!'
  exit 1
fi

# Test 07: Make sure program handles negative numbers 
if [[ $($CALCULATOR -4 + 6) -ne 2 ]]; then
  echo 'ERROR! Negative number test (-4 + 6) did not return 2!'
  exit 1
fi

# Test 08: Ensure program handles large numbers
if [[ $($CALCULATOR 1000000 + 2000000) -ne 3000000 ]]; then
  echo 'ERROR! Large number test (1000000 + 2000000) did not return 3000000!'
  exit 1
fi

# Test 09: Ensure program rejects non-numeric inputs
if [[ $($CALCULATOR apple + banana) -ne 0 ]]; then
  echo 'ERROR! Non-numeric input (apple + banana) should have been 0 but values read incorrectly!'
  exit 1
fi

# Test 10: Ensure program rejects missing arguments
if $CALCULATOR 5 +; then
  echo 'ERROR! Missing argument (5 +) should have failed but succeeded!'
  exit 1
fi

# Test 11: Ensure program rejects empty input
if $CALCULATOR ""; then
  echo 'ERROR! Empty input should have failed but succeeded!'
  exit 1
fi

# Test 12: Ensure subtraction with negative numbers works correctly
if [[ $($CALCULATOR -10 - -5) -ne -5 ]]; then
  echo 'ERROR! Subtraction with negatives (-10 - -5) did not return -5!'
  exit 1
fi

# Test 13: Ensure modulo operation is rejected (if unsupported)
if $CALCULATOR 10 % 3; then
  echo 'ERROR! Modulo (10 % 3) should have failed but succeeded!'
  exit 1
fi

echo "All tests passed!"
exit 0

