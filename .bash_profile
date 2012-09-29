# History settings
TIMESTAMP=$(date +%Y%m)
HISTDIR="$HOME/.history_files"
#if [[ ! -d $HISTDIR ]]; then
mkdir -p $HISTDIR
#fi
HISTFILESIZE=1000000
HISTFILE=$HISTDIR/bash_history.${TIMESTAMP}
HISTTIMEFORMAT="%F %T "
# We might want to ignore something
# HISTIGNORE="&:pwd:ls:[bf]g:exit:[ \t]*"
shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
function hs {
    grep $1 $HISTFILE
}

# The following are taken from dotfiles by Mathias Bynens
# https://github.com/mathiasbynens/dotfiles

# Add `~/bin` to the `$PATH`
#export PATH="$HOME/bin:$PATH"

# Case-insensitive globbing
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
