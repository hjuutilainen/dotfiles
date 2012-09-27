# Most of these are taken from dotfiles by Mathias Bynens
# https://github.com/mathiasbynens/dotfiles

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Case-insensitive globbing
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
