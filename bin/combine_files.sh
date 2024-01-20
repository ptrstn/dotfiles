#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check for the correct number of command-line arguments
if [ $# -lt 1 ]; then
  echo -e "${RED}Usage: $(basename "$0") <file_extension> [path] [--ignore pattern]${NC}"
  exit 1
fi

# Extract file extension argument, remove leading dot if present
file_extension="${1#.}"
shift

# Initialize variables
path="."
ignore_pattern=""

# Process additional arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --ignore)
      ignore_pattern="$2"
      shift # past argument
      shift # past value
      ;;
    *)
      # Assume the only other argument is the path
      path="$1"
      shift # past argument
      ;;
  esac
done

# Output file
output_filename="combined_files_in_${path//\//_}.$file_extension"
[ "$path" = "." ] && output_filename="combined_files.$file_extension"

# Clear the output file if it already exists
: >"$output_filename"

# Function to append file content to the output file
append_file() {
  {
    echo "# $1"
    cat "$1"
    echo -e "\n"
  } >>"$output_filename"
}

# Export the function to be available in subshells
export -f append_file
export output_filename

# Construct and execute the find command
if [ -n "$ignore_pattern" ]; then
  find "$path" -type f -name "*.$file_extension" ! -path "*/.*/*" ! -path "$ignore_pattern" ! -name "$output_filename" -exec bash -c 'append_file "$0"' {} \;
else
  find "$path" -type f -name "*.$file_extension" ! -path "*/.*/*" ! -name "$output_filename" -exec bash -c 'append_file "$0"' {} \;
fi

echo -e "${GREEN}Files with '$file_extension' extension have been combined into '$output_filename'${NC}"
