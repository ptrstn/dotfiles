echo
info_message "Adding aliases..."
create_symbolic_link "$dotfiles_dir/.bash_aliases" "$HOME/.bash_aliases"

# Check if .bash_aliases is sourced in .bashrc with "." (dot) or "source" command
if grep -Eq "^(\.|\s*source)\s+~/.bash_aliases" "$user_home_dir/.bashrc"; then
	warning_message "'.bash_aliases' is already sourced in '.bashrc.'"
else
	cat templates/source_aliases.template >>$HOME/.bashrc
	success_message "Added sourcing of .bash_aliases to .bashrc..."
fi

info_message "Done."
