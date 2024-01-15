[![CI](https://github.com/ptrstn/dotfiles/actions/workflows/ci.yml/badge.svg)](https://github.com/ptrstn/dotfiles/actions/workflows/ci.yml)

# Personal dotfiles

These are my personal dotfiles consisting of a collection of aliases and custom scripts. 

## Installation

```bash
git clone https://github.com/ptrstn/dotfiles
cd dotfiles
```

### Automatic Installation

To automate the installation process, you can use the `setup.sh` script. 
This script will symbolically link the contents of the `bin` directory into your 
[user-specific bin directory](#user-specific-bin-path), which is determined from your `PATH` variable.
It symbolically links the `.bash_aliases` file to your `~/.bash_aliases` and sources it in your `~/.bashrc`. 
It also safely skips the files that already exist.

```bash
chmod +x setup.sh
./setup.sh
```

### Manual Installation

Alternatively, you can perform a manual installation by following these steps:

1. Copy the contents of the `bin` directory into your [user-specific bin directory](#user-specific-bin-path) (create it, if it doesn't exist):

   ```bash
   mkdir -p ~/.local/bin
   cp -i bin/* ~/.local/bin
   ```

2. Copy the `.bash_aliases` file to your home directory:

   ```bash
   cp -i .bash_aliases ~
   ```

3. Add the following lines at the beginning of your `.bashrc` file to check if the `.bash_aliases` file exists and to source it:

   ```bash
   if [ -f ~/.bash_aliases ]; then
      source ~/.bash_aliases
   fi
   ```

## Update

To update the scripts, simply perform a `git pull` and redo the installation instructions:

```bash
git pull
./setup.sh
```

## Help

### User-Specific `bin` Path

Your user-specific `bin` directory is either `~/bin` for most Linux distributions or `~/.local/bin` for [Arch Linux](https://archlinux.org/) based distributions.
If you're not sure, check your `$PATH` variable.

```bash
echo $PATH | tr ':' '\n' | grep -E '^/home/.+/bin$'
```

### Reformat Scripts

[`shfmt`](https://github.com/mvdan/sh) is used to format the scripts inside this repository. 
To format all the scripts, simply run:

```bash
shfmt -l -i 2 -ci -w .
```

### Static Analysis

[ShellCheck](https://github.com/koalaman/shellcheck) is used for static code analysis.
To check all the scripts, simply run:

```bash
shellcheck -x setup.sh ./scripts/*.sh ./bin/*.sh
```

### Run GitHub Actions workflows locally

You can run GitHub Actions workflows locally on your own machine using a tool called [act](https://github.com/nektos/act).

Act is a command-line tool that simulates the GitHub Actions runner environment on your local machine, 
allowing you to test and debug your workflows locally before pushing changes to your repository.

To trigger the entire workflow locally, simply run:

```bash
act
```
