#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for the correct number of command-line arguments
if [ $# -ne 1 ]; then
    echo -e "${RED}Usage: $(basename "$0") <file_extension>${NC}"
    exit 1
fi

# Extract file extension argument, remove leading dot if present
file_extension="${1#.}"

# Output file
output_filename="combined_files.$file_extension"

# Clear the output file if it already exists
> "$output_filename"

# Function to append file content to the output file
append_file() {
    echo "# $1" >> "$output_filename"
    cat "$1" >> "$output_filename"
    echo -e "\n" >> "$output_filename"
}

# Export the function to be available in subshells
export -f append_file
export output_filename

# Find and process files with the specified extension
find . -type f -name "*.$file_extension" ! -path "*/.*/*" ! -name "$output_filename" -exec bash -c 'append_file "$0"' {} \;

echo -e "${BLUE}Files with '$file_extension' extension have been combined into ${GREEN}'$output_filename'${NC}"
