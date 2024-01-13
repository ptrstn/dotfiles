#!/bin/bash

# Output file
output_file="combined_python_files.py"

# Clear the output file if it already exists
> "$output_file"

# Function to append file content to the output file
append_file() {
    echo "# $1" >> "$output_file"
    cat "$1" >> "$output_file"
    echo -e "\n" >> "$output_file"
}

# Export the function to be available in subshells
export -f append_file
export output_file

# Find and process python files
find . -type f -name "*.py" ! -path "*/.*/*" -exec bash -c 'append_file "$0"' {} \;

echo "Python files have been combined into $output_file"

