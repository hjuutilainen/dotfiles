#!/bin/bash

# ==============================================
# setup-dock.sh
#
# This script configures your Dock content the
# way I like it. Use with caution...
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================

# Check for dockutil
which dockutil > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    echo "dockutil not found"
    echo "Get it from https://github.com/kcrawford/dockutil"
    exit 1
fi

# First remove everything
dockutil --remove all --no-restart


# =======================================
# Applications
# =======================================

# Shortcut function for calling dockutil
function dockutilAdd() {
    dockutil --add "$1" --no-restart > /dev/null 2>&1
}

# These are the apps I use. There are many others
# but these deserve their special place in my dock.
appPaths=(
"/Applications/Launchpad.app"
"/Applications/Mission Control.app"
"/Applications/App Store.app"
"/Applications/Mail.app"
"/Applications/Safari.app"
"/Applications/Contacts.app"
"/Applications/Calendar.app"
"/Applications/1Password.app"
"/Applications/Tweetbot.app"
"/Applications/Reeder.app"
"/Applications/Transmit.app"
"/Applications/iTunes.app"
"/Applications/System Preferences.app"
"/Applications/Xcode.app"
"/Applications/Gitbox.app"
"/Applications/BBEdit.app"
"/Applications/Utilities/Activity Monitor.app"
"/Applications/Utilities/Console.app"
"/Applications/Utilities/Disk Utility.app"
"/Applications/Utilities/Terminal.app"
)

for aPath in "${appPaths[@]}"
do
    dockutilAdd "$aPath"
done


# =======================================
# Folders
# =======================================

# Nothing special here...
dockutil --add '~/Documents' --view grid --display stack --sort dateadded --no-restart
dockutil --add '~/Downloads' --view grid --display folder --sort name

exit 0
