#!/bin/bash

# ==============================================
# .osx-user-defaults
# for OS X Mountain Lion (10.8.x)
#
# Commands target the current boot drive
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================

# ==============================================
# NSGlobalDomain settings
# ==============================================

# Locale
defaults write NSGlobalDomain AppleLocale -string "fi_FI"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Turn off text smoothing for font sizes
defaults write NSGlobalDomain AppleAntiAliasingThreshold -int 4

# Double-click a window's title bar to minimize
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# Use smooth scrolling
defaults write NSGlobalDomain AppleScrollAnimationEnabled -bool true

# Enable key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Set scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don't restore windows when quitting or re-opening apps
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false


# ==============================================
# Mouse
# ==============================================

# Secondary click:
# Possible values: OneButton, TwoButton, TwoButtonSwapped
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode -string TwoButton

# Smart zoom enabled, double-tap with one finger (set to 0 to disable)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture -int 1

# Double-tap with two fingers to Mission Control (set to 0 to disable)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerDoubleTapGesture -int 3

# Two finger horizontal swipe
# 0 = Swipe between pages with one finger
# 1 = Swipe between pages
# 2 = Swipe between full screen apps with two fingers, swipe between pages with one finger (Default Mode)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 2

defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseVerticalScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseMomentumScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseHorizontalScroll -int 1


# ==============================================
# Trackpad
# ==============================================

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Tap with two fingers to emulate right click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Enable three finger tap (look up)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2

# Disable three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool false

# Zoom in or out
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool true

# Smart zoom, double-tap with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool true

# Rotate
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool true

# Notification Center
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# Swipe between pages with two fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true

# Swipe between full-screen apps
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2

# Enable other multi-finger gestures
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2

defaults write com.apple.dock showMissionControlGestureEnabled -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
defaults write com.apple.dock showDesktopGestureEnabled -bool true
defaults write com.apple.dock showLaunchpadGestureEnabled -bool true


# ==============================================
# Disable CD & DVD actions
# ==============================================

# Disable blank CD automatic action.
defaults write com.apple.digihub com.apple.digihub.blank.cd.appeared -dict action 1

# Disable music CD automatic action.
defaults write com.apple.digihub com.apple.digihub.cd.music.appeared -dict action 1

# Disable picture CD automatic action.
defaults write com.apple.digihub com.apple.digihub.cd.picture.appeared -dict action 1

# Disable blank DVD automatic action.
defaults write com.apple.digihub com.apple.digihub.blank.dvd.appeared -dict action 1

# Disable video DVD automatic action.
defaults write com.apple.digihub com.apple.digihub.dvd.video.appeared -dict action 1

# ==============================================
# Archive Utility
# ==============================================

# Move archives to trash after extraction
defaults write com.apple.archiveutility "dearchive-move-after" -string "~/.Trash"

# Don't reveal extracted items
defaults write com.apple.archiveutility "dearchive-reveal-after" -bool false

# ==============================================
# Finder
# ==============================================

# Expand the "Open with" and "Sharing & Permissions" panes
defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true Privileges -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# New window points to home
defaults write com.apple.finder NewWindowTarget -string "PfHm"

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
# All of the following taken from dotfiles/.osx by Mathias Bynens
# https://github.com/mathiasbynens/dotfiles/
# ==============================================


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
