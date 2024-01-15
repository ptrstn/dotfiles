# shellcheck disable=SC2148

# Print skipped files, if any
if [ ${#skipped_files[@]} -gt 0 ]; then
	echo
	info_message "Skipped files:"
	for skipped_file in "${skipped_files[@]}"; do
		echo "$skipped_file"
	done
fi
