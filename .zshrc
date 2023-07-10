#
# History settings
# http://zsh.sourceforge.net/Guide/zshguide02.html#l17
#

export HISTSIZE=2000000
export SAVEHIST=2000000
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
setopt NO_HIST_IGNORE_DUPS

# When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous.
setopt HIST_FIND_NO_DUPS

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS

# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
setopt NO_HIST_IGNORE_ALL_DUPS

# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space.
setopt HIST_IGNORE_SPACE

# When writing out the history file, older commands that duplicate newer ones are omitted.
setopt NO_HIST_SAVE_NO_DUPS

# Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt HIST_VERIFY

# Remove the history (fc -l) command from the history list when invoked. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line.
setopt NO_HIST_NO_STORE

# -> https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/

# Make globbing (filename generation) sensitive to case.
setopt NO_CASE_GLOB

# When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them like MENU_COMPLETE.
setopt GLOB_COMPLETE

# If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD

# Try to correct the spelling of commands.
setopt NO_CORRECT

# Try to correct the spelling of all arguments in a line.
setopt NO_CORRECT_ALL

# -> https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/

fpath=( ~/.local/share/git-repos/mac-zsh-completions $fpath )

autoload -Uz compinit && compinit

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# man zshcompsys -> special-dirs
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# -> https://github.com/rothgar/mastering-zsh/blob/master/docs/usage/line_movement.md
autoload -U select-word-style
select-word-style bash


#
# PATH
#

# Do not add anything to $path if it's there already.
typeset -U path

if [[ -d "$HOME/bin" ]]; then
    path=("$HOME/bin" $path)
fi
if [[ -d "/opt/local/bin" ]]; then
    path=("/opt/local/bin" $path)
fi
if [[ -d "/opt/homebrew/bin" ]]; then
    path=("/opt/homebrew/bin" $path)
fi
if [[ -d "$HOME/Applications/cli.noindex/homebrew/bin" ]]; then
    path=("$HOME/Applications/cli.noindex/homebrew/bin" $path)
fi
if [[ -d "/Library/Frameworks/Python.framework/Versions/3.7/bin" ]]; then
    path=("/Library/Frameworks/Python.framework/Versions/3.7/bin" $path)
fi
if [[ -d "/Library/Frameworks/Python.framework/Versions/3.8/bin" ]]; then
    path=("/Library/Frameworks/Python.framework/Versions/3.8/bin" $path)
fi
if [[ -d "/Library/Frameworks/Python.framework/Versions/3.9/bin" ]]; then
    path=("/Library/Frameworks/Python.framework/Versions/3.9/bin" $path)
fi
if [[ -d "/Library/Frameworks/Python.framework/Versions/3.10/bin" ]]; then
    path=("/Library/Frameworks/Python.framework/Versions/3.10/bin" $path)
fi
if [[ -d "/Library/Frameworks/Python.framework/Versions/3.11/bin" ]]; then
    path=("/Library/Frameworks/Python.framework/Versions/3.11/bin" $path)
fi

export fpath

#
# Google Cloud SDK
#
CLOUDSDK_INSTALL_DIR="${HOME}/Applications/cli.noindex/google-cloud-sdk"
if [[ -f "${CLOUDSDK_INSTALL_DIR}/path.zsh.inc" ]]; then
    source "${CLOUDSDK_INSTALL_DIR}/path.zsh.inc"
fi
if [[ -f "${CLOUDSDK_INSTALL_DIR}/completion.zsh.inc" ]]; then
    source "${CLOUDSDK_INSTALL_DIR}/completion.zsh.inc"
fi

#
# nix
#
if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

#
# 1Password CLI
#
eval "$(op completion zsh)"; compdef _op op

#
# atuin
#
# don't bind control-R or arrow keys
#
if [[ -f /opt/homebrew/bin/atuin || -f ${HOME}/.nix-profile/bin/atuin ]]; then
    eval "$(atuin init zsh --disable-up-arrow --disable-ctrl-r)"
fi

#
# direnv
#
if [[ -f /opt/homebrew/bin/direnv || -f ${HOME}/.nix-profile/bin/direnv ]]; then
    eval "$(direnv hook zsh)"
fi

#
# Homebrew
#
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GOOGLE_ANALYTICS=1

#
# Misc
#

export CLICOLOR=1
export EDITOR="bbedit -w"

#
# Aliases
#

alias history='fc -i -l 1'
alias PlistBuddy='/usr/libexec/PlistBuddy'

#
# Load custom files from .zsh.d
#

if [[ -d "${HOME}"/.zsh.d/ ]]; then
    for ZSH_FILE in "${HOME}"/.zsh.d/**/*.zsh(.); do
        source "${ZSH_FILE}"
    done
fi
