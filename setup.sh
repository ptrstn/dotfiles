#!/bin/bash

echo "Setting up dotfiles..."
source scripts/common_functions.sh
source scripts/add_aliases.sh
source scripts/link_custom_scripts_to_bin.sh
source scripts/echo_skipped_files.sh
echo
echo "Setup completed."
