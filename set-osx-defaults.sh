#!/bin/bash

# ==============================================
# OS X Client setup
# for OS X Mountain Lion (10.8.x)
#
# Commands target the current boot drive
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================

# ==============================================
# Set energy preferences
# ==============================================
systemsetup -setcomputersleep Never
systemsetup -setdisplaysleep 30
systemsetup -setharddisksleep Never

# ==============================================
# Language and formats
# ==============================================
defaults write NSGlobalDomain AppleLocale fi_FI
defaults write NSGlobalDomain AppleMeasurementUnits Centimeters
defaults write NSGlobalDomain AppleMetricUnits -bool YES

# ==============================================
# Set keyboard preferences
# ==============================================
defaults write /Library/Preferences/com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID "com.apple.keylayout.Finnish"
defaults write /Library/Preferences/com.apple.HIToolbox AppleDefaultAsciiInputSource -dict InputSourceKind "Keyboard Layout" "KeyboardLayout ID" -int 17 "KeyboardLayout Name" Finnish

# Delete the default layouts (US)
defaults delete /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources

# Enable Finnish layout
defaults write /Library/Preferences/com.apple.HIToolbox AppleEnabledInputSources -array '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 17; "KeyboardLayout Name" = Finnish; }'
defaults write /Library/Preferences/com.apple.HIToolbox AppleInputSourceHistory -array '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 17; "KeyboardLayout Name" = Finnish; }'
defaults write /Library/Preferences/com.apple.HIToolbox AppleSelectedInputSources -array '{ InputSourceKind = "Keyboard Layout"; "KeyboardLayout ID" = 17; "KeyboardLayout Name" = Finnish; }'

# Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool FALSE

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set scroll direction
defaults write /Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false

for USER_TEMPLATE in "/System/Library/User Template"/*
  do
    defaults write "${USER_TEMPLATE}"/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool FALSE
    defaults write "${USER_TEMPLATE}"/Library/Preferences/.GlobalPreferences ApplePressAndHoldEnabled -bool FALSE
    defaults write "${USER_TEMPLATE}"/Library/Preferences/.GlobalPreferences KeyRepeat -int 2
  done


# ==============================================
# Disable CD & DVD actions
# ==============================================
# Disable blank CD automatic action.
defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.blank.cd.appeared -dict action 1
# Disable music CD automatic action.
defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.cd.music.appeared -dict action 1
# Disable picture CD automatic action.
defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.cd.picture.appeared -dict action 1
# Disable blank DVD automatic action.
defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.blank.dvd.appeared -dict action 1
# Disable video DVD automatic action.
defaults write /Library/Preferences/com.apple.digihub com.apple.digihub.dvd.video.appeared -dict action 1


# ==============================================
# All of the following taken from dotfiles/.osx by Mathias Bynens
# https://github.com/mathiasbynens/dotfiles/
# ==============================================

# ==============================================
# Finder
# ==============================================

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
#defaults write com.apple.frameworks.diskimages skip-verify -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
#defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library


# ==============================================
# Dock
# ==============================================

# Set the icon size of Dock items to 36 pixels
#defaults write com.apple.dock tilesize -int 36

# ==============================================
# Safari & WebKit
# ==============================================

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


# ==============================================
# Disk Utility
# ==============================================

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# ==============================================
# Kill affected applications
# ==============================================

for app in "Dashboard" "Dock" "Finder" "Safari" "SystemUIServer"; do
    killall "$app" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
