#
# History settings
# http://zsh.sourceforge.net/Guide/zshguide02.html#l17
#

export HISTSIZE=2000000
export SAVEHIST=1000000
export HISTFILE=~/.zsh_history

# Save each command's beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
setopt EXTENDED_HISTORY

# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file.
setopt SHARE_HISTORY

# If this is set, zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit.
setopt APPEND_HISTORY

# This option works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits.
setopt INC_APPEND_HISTORY

# If the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event from the list. 
setopt HIST_EXPIRE_DUPS_FIRST 

# Do not enter command lines into the history list if they are duplicates of the previous event.
# setopt HIST_IGNORE_DUPS

# When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous.
setopt HIST_FIND_NO_DUPS

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS

# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
# setopt HIST_IGNORE_ALL_DUPS

# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space.
setopt HIST_IGNORE_SPACE

# When writing out the history file, older commands that duplicate newer ones are omitted.
#setopt HIST_SAVE_NO_DUPS

# Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY

# Remove the history (fc -l) command from the history list when invoked. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line.
#setopt HIST_NO_STORE


# -> https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/

# Make globbing (filename generation) sensitive to case.
#setopt CASE_GLOB
setopt NO_CASE_GLOB

# When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them like MENU_COMPLETE.
setopt GLOB_COMPLETE

# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Try to correct the spelling of commands.
setopt CORRECT

# Try to correct the spelling of all arguments in a line.
#setopt CORRECT_ALL


# -> https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/

autoload -Uz compinit && compinit

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'



# -> https://github.com/rothgar/mastering-zsh/blob/master/docs/usage/line_movement.md
autoload -U select-word-style
select-word-style bash


#
# PATH
#

# Do not add anything to $path if it's there already.
typeset -U path

path=("$HOME/bin" $path)
path=("$HOME/homebrew/bin" $path)
export fpath


#
# Misc 
#

export CLICOLOR=1


#
# Aliases
#

alias history='fc -i -l 1'


#
# Load custom files from .zsh.d
#

if [[ -d "${HOME}"/.zsh.d/ ]]; then
    for ZSH_FILE in "${HOME}"/.zsh.d/**/*.zsh(.); do
        source "${ZSH_FILE}"
    done
fi
