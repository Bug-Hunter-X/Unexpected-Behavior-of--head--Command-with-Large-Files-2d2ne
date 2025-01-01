#!/bin/bash

# This script demonstrates a more robust way to process a large file using awk

# Let's create a large test file:

echo "This is a large file..." > large_file.txt
for i in {1..1000000}; do echo "Line number $i" >> large_file.txt; done

# Use awk to read the first 1 million lines
awkscript="NR <= 1000000 {print}"
awk "$awkscript" large_file.txt > awk_output.txt

# Check if the output has the expected number of lines
lines=$(wc -l < awk_output.txt)
echo "Number of lines read by awk: $lines"

if [[ $lines -ne 1000000 ]]; then
  echo "ERROR: awk did not read the expected number of lines."
fi

#Clean up
rm large_file.txt awk_output.txt