#
# History settings
#

# Number of lines in the history file
export HISTFILESIZE=1000000

# Number of entries in the history file
export HISTSIZE=1000000

# History file location
export HISTFILE=~/.bash_history

# Display timestamps as "yyyy-mm-dd HH:MM:SS"
export HISTTIMEFORMAT="%F %T "

# Ignore duplicates
export HISTCONTROL=ignoreboth:erasedups

# We might want to ignore something
# HISTIGNORE="&:pwd:ls:[bf]g:exit:[ \t]*"

#
# Bash settings
#

# Attempt to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# Appended instead of overwriting the history file
shopt -s histappend

# Case-insensitive filename expansion
shopt -s nocaseglob

# Make sure every simultaneous session has the same history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#
# Some history helpers
#
function hs {
    grep $1 $HISTFILE
}
alias h1='history 10'
alias h2='history 20'
alias h3='history 30'

# Add ~/bin to $PATH
export PATH="$HOME/bin:$PATH"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
