# shellcheck disable=SC2148

echo
info_message "Adding custom scripts..."

# Ensure user_bin_dir and dotfiles_dir are set
: "${user_bin_dir:?Error: user_bin_dir is not set.}"
: "${dotfiles_dir:?Error: dotfiles_dir is not set.}"

# Check if '~/bin' exists; create it, if not
if [ ! -d "$user_bin_dir" ]; then
  mkdir -p "$user_bin_dir"
  success_message "Created $user_bin_dir"
fi

for bin_file in "$dotfiles_dir/bin"/*; do
  target="$user_bin_dir/$(basename "$bin_file")"
  create_symbolic_link "$bin_file" "$target"
done

info_message "Done."
