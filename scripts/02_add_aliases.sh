# shellcheck disable=SC2148

echo
info_message "Adding aliases..."

# Ensure dotfiles_dir and user_home_dir are set
: "${dotfiles_dir:?Error: dotfiles_dir is not set.}"
: "${user_home_dir:?Error: user_home_dir is not set.}"

create_symbolic_link "$dotfiles_dir/.bash_aliases" "$HOME/.bash_aliases"

# Check if .bash_aliases is sourced in .bashrc with "." (dot) or "source" command
if grep -Eq "(\.|source)\s+~/.bash_aliases" "$user_home_dir/.bashrc"; then
	warning_message "'.bash_aliases' is already sourced in '.bashrc'."
else
	cat templates/source_aliases.template >>"$HOME/.bashrc"
	success_message "Added sourcing of .bash_aliases to .bashrc..."
fi

info_message "Done."
