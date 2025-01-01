#!/bin/bash

# This script attempts to process a large file, but it can fail due to unexpected behavior with the `head` command.

# The problem is that `head -n 1000000 large_file.txt` might not always return the first 1,000,000 lines,
# especially if the file is extremely large and contains characters that `head` interprets unusually.

# The `head` command's behavior might be affected by buffer sizes, file encoding, and other factors.
# A more robust way to get a specified number of lines is to use `awk`.

# Let's demonstrate the issue with a large test file:

echo "This is a large file..." > large_file.txt
for i in {1..1000000}; do echo "Line number $i" >> large_file.txt; done

# Attempt to read 1 million lines using head
head -n 1000000 large_file.txt > head_output.txt

# Check if the output has the expected number of lines
lines=$(wc -l < head_output.txt)
echo "Number of lines read by head: $lines"

if [[ $lines -ne 1000000 ]]; then
  echo "WARNING: head did not read the expected number of lines."
fi

# Clean up
rm large_file.txt head_output.txt