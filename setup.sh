#!/bin/bash

echo "Setting up dotfiles..."
source scripts/00_common_functions.sh
source scripts/01_add_aliases.sh
source scripts/02_link_custom_scripts_to_bin.sh
source scripts/03_echo_skipped_files.sh
echo
echo "Setup completed."
