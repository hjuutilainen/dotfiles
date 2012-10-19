#!/bin/bash

# ==============================================
# .osx-user-defaults
# for OS X Lion and Mountain Lion
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

# Don't restore windows when quitting or re-opening apps
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false


# ==============================================
# Desktop & Screen Saver
# ==============================================

# No translucent menu bar
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false

# Ask for password after 5 seconds
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Screen Saver: Flurry
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Flurry" path -string "/System/Library/Screen Savers/Flurry.saver" type -int 0

# Hot corners -> bottom left -> start screen saver
defaults write com.apple.dock "wvous-bl-corner" -int 5
defaults write com.apple.dock "wvous-bl-modifier" -int 0


# ==============================================
# Mouse
# ==============================================

# Set scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

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
# Activity Monitor
# ==============================================

# Show main window on launch
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Dock icon = CPU Usage
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Select the Network tab
defaults write com.apple.ActivityMonitor SelectedTab -int 4


# ==============================================
# Contacts (Address Book)
# ==============================================

# Address format
defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string "fi"

# Display format "Last, First"
defaults write com.apple.AddressBook ABNameDisplay -int 1

# Sort by last name
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"


# ==============================================
# Calendar (iCal)
# ==============================================

# Show week numbers (10.8 only)
defaults write com.apple.iCal "Show Week Numbers" -bool true

# Show 7 days
defaults write com.apple.iCal "n days of week" -int 7

# Week starts on monday
defaults write com.apple.iCal "first day of week" -int 1

# Show event times
defaults write com.apple.iCal "Show time in Month View" -bool true


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
# Xcode
# ==============================================

# Always use spaces for indenting
defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool false

# Show tab bar
defaults write com.apple.dt.Xcode AlwaysShowTabBar -bool true


# ==============================================
# BBEdit and TextWrangler
# ==============================================

# Expand tabs to spaces
defaults write com.barebones.bbedit EditorAutoExpandTabs -bool true
defaults write com.barebones.textwrangler EditorAutoExpandTabs -bool true
defaults write com.barebones.bbedit EditorDefaultTabWidth -int 4
defaults write com.barebones.textwrangler EditorDefaultTabWidth -int 4

# Automatically indent
defaults write com.barebones.bbedit EditorAutoIndent -bool true
defaults write com.barebones.textwrangler EditorAutoIndent -bool true

# Don't check spelling
defaults write com.barebones.bbedit EditorCheckSpellingAsYouType -bool false
defaults write com.barebones.textwrangler EditorCheckSpellingAsYouType -bool false

# Don't suggest nonsense when I'm writing code
defaults write com.barebones.bbedit IncludeDictionaryWordsInCompletionList -bool false
defaults write com.barebones.textwrangler IncludeDictionaryWordsInCompletionList -bool false

# Open documents in new window
defaults write com.barebones.bbedit NewAndOpenPrefersSharedWindow -bool false
defaults write com.barebones.textwrangler NewAndOpenPrefersSharedWindow -bool false

# Ensure that file ends with a line break
defaults write com.barebones.bbedit EnsureTrailingLineBreak -bool true
defaults write com.barebones.textwrangler EnsureTrailingLineBreak -bool true

# Strip trailing white space
defaults write com.barebones.bbedit StripTrailingWhitespace -bool true
defaults write com.barebones.textwrangler StripTrailingWhitespace -bool true

# Allow update checking
defaults write com.barebones.bbedit SUSoftwareUpdateEnabled -bool true
defaults write com.barebones.bbedit SUSoftwareUpdateHasCompletedFirstRun -bool true


# ==============================================
# Go2Shell
# ==============================================

# Custom command, remove the "clear" command
defaults write com.alice.mac.go2shell customCommand -string "cd %PATH%; pwd"


# ==============================================
# Speed Download
# ==============================================

# Concurrent downloads the queue may start
defaults write com.yazsoft.SpeedDownload "Queue Length" -int 2

# Don't start the download queue on launch
defaults write com.yazsoft.SpeedDownload "Start On Launch" -bool false

# Plugin may not start the queue
defaults write com.yazsoft.SpeedDownload "autoStartQueue" -bool false

# Concurrent uploads the queue may start
defaults write com.yazsoft.SpeedDownload "max sim uploads" -int 1

# Don't start the upload queue on launch
defaults write com.yazsoft.SpeedDownload "start ul on launch" -bool false

# Default number of connections
defaults write com.yazsoft.SpeedDownload "Default Ports" -int 3


# ==============================================
# Name Mangler
# ==============================================

# Concise list
defaults write com.manytricks.NameMangler "List Style" -int 0

# No icon previews
defaults write com.manytricks.NameMangler "Show Icon Previews" -bool false

# Quit when window closed
defaults write com.manytricks.NameMangler "Quit When Closed" -bool true

# Don't clear the list after processing
defaults write com.manytricks.NameMangler Repopulate -bool false

# No confirmation, just do it
defaults write com.manytricks.NameMangler Chicken -bool false


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
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use column view
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show the ~/Library folder
chflags nohidden ~/Library


# ==============================================
# Dock
# ==============================================

# Position (left, bottom, right)
defaults write com.apple.dock orientation -string "left"


# ==============================================
# Safari & WebKit
# ==============================================

# Appearance

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Show favorites bar
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Don't show tab bar
defaults write com.apple.Safari AlwaysShowTabBar -bool false


# General settings

# Safari opens with: A new window
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false

# New windows open with: Empty Page
defaults write com.apple.Safari NewWindowBehavior -int 1

# New tabs open with: Empty Page
defaults write com.apple.Safari NewTabBehavior -int 1

# Homepage
defaults write com.apple.Safari HomePage -string "about:blank"

# Don't open "safe" files after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false


# Tabs settings

# Open pages in tabs instead of windows: automatically
defaults write com.apple.Safari TabCreationPolicy -int 1

# Don't make new tabs active
defaults write com.apple.Safari OpenNewTabsInFront -bool false

# Command-clicking a link creates tabs
defaults write com.apple.Safari CommandClickMakesTabs -bool true


# Autofill settings

# Don't remember passwords
defaults write com.apple.Safari AutoFillPasswords -bool false


# Security settings

# Warn About Fraudulent Websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool true

# Enable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool true

# Enable JavaScript
defaults write com.apple.Safari WebKitJavaScriptEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptEnabled -bool true

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Reading list
defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2PluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2LoadsImagesAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2LoadsSiteIconsIgnoringImageLoadingPreference -bool true
defaults write com.apple.Safari com.apple.Safari.ReadingListFetcher.WebKit2JavaScriptEnabled -bool false


# Privacy settings

# Do not track
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true


# Extensions settings

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


# Advanced settings

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

killall "Finder" > /dev/null 2>&1
killall "SystemUIServer" > /dev/null 2>&1
killall "Dock" > /dev/null 2>&1

appsToKill=(
"Activity Monitor"
"BBEdit"
"Calendar"
"Contacts"
"Dashboard"
"Disk Utility"
"Safari"
"System Preferences"
"TextWrangler"
"Xcode"
)

for app in "${appsToKill[@]}"
do
    killall "$app" > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        # We just killed an app so restart it
        open -a "$app"
    fi
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
