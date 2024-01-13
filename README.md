# Personal dotfiles

These are my personal dotfiles consisting of a collection of aliases and custom scripts. 

## Installation

```bash
git clone https://github.com/ptrstn/dotfiles
cd dotfiles
```

### Automatic Installation

To automate the installation process, you can use the `setup.sh` script. This script will symbolically link the contents of the `bin` directory into your `~/bin`, copy the `.bash_aliases` file to your `~/.bash_aliases` and source it in your `~/.bashrc`. It safely skips the files that already exist.

```bash
chmod +x setup.sh
./setup.sh
```

### Manual Installation

Alternatively, you can perform a manual installation by following these steps:

1. Copy the contents of the `bin` directory into your `~/bin` directory (create it if it doesn't exist):

   ```bash
   mkdir -p ~/bin
   cp -i bin/* ~/bin
   ```

2. Copy the `.bash_aliases` file to your home directory:

   ```bash
   cp -i .bash_aliases ~
   ```

3. Add the following lines to the beginning of your `.bashrc` file to check if the `.bash_aliases` file exists and source it:

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
