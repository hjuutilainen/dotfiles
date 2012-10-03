# History settings
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTFILE=~/.bash_history
export HISTTIMEFORMAT="%F %T "
# We might want to ignore something
# HISTIGNORE="&:pwd:ls:[bf]g:exit:[ \t]*"
shopt -s cmdhist
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
function hs {
    grep $1 $HISTFILE
}

# Add ~/bin to $PATH
export PATH="$HOME/bin:$PATH"

# Add MacPorts paths to $PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Ignore case for wildcard matching within the filesystem names
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
