# shellcheck disable=SC2148

# Ensure skipped_files is set
: "${skipped_files:?Error: skipped_files is not set.}"

# Print skipped files, if any
if [ ${#skipped_files[@]} -gt 0 ]; then
	echo
	info_message "Skipped files:"
	for skipped_file in "${skipped_files[@]}"; do
		echo "$skipped_file"
	done
fi
