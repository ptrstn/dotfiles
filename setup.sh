#!/bin/bash

dotfiles_dir="$(pwd)"
user_home_dir="$HOME"
user_bin_dir=""
skipped_files=()

export dotfiles_dir
export user_home_dir
export user_bin_dir
export skipped_files

source scripts/00_common_functions.sh
source scripts/01_parse_command_line_arguments.sh
echo "Setting up dotfiles..."
source scripts/02_add_aliases.sh
source scripts/03_link_custom_scripts_to_bin.sh
source scripts/04_echo_skipped_files.sh
echo
echo "Setup completed."
