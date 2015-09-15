#!/bin/bash

# ==============================================
# .osx-user-defaults
# for OS X Lion, Mountain Lion and Mavericks
#
# Commands target the current boot drive
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================


function CFPreferencesAppSynchronize() {
    python - <<END
from Foundation import CFPreferencesAppSynchronize
CFPreferencesAppSynchronize('$1')
END
}

# ==============================================
# Files and folders
# ==============================================

# Show the ~/Library directory
chflags nohidden "${HOME}/Library"

# Don't show the ~/bin directory
chflags hidden "${HOME}/bin"


# ==============================================
# NSGlobalDomain settings
# ==============================================
echo "Setting NSGlobalDomain preferences"

# Locale
defaults write NSGlobalDomain AppleLocale -string "fi_FI"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# 24-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

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

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool true

# Sidebar icon size: Small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1


# ==============================================
# Desktop & Screen Saver
# ==============================================
echo "Setting Desktop & Screen Saver preferences"

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
echo "Setting Mouse preferences"

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
echo "Setting Trackpad preferences"

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
echo "Setting Activity Monitor preferences"

# Show main window on launch
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Dock icon = CPU Usage
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Mountain Lion: Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Mavericks: Add the "% CPU" column to the Disk and Network tabs
defaults write com.apple.ActivityMonitor "UserColumnsPerTab v4.0" -dict \
    '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, PID, UID )' \
    '1' '( Command, anonymousMemory, Threads, Ports, PID, UID, ResidentSize )' \
    '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, UID )' \
    '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID, CPUUsage )' \
    '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID, CPUUsage )'

# Mavericks: Sort by CPU usage in Disk and Network tabs
defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
    '0' '{ direction = 0; sort = CPUUsage; }' \
    '1' '{ direction = 0; sort = ResidentSize; }' \
    '2' '{ direction = 0; sort = 12HRPower; }' \
    '3' '{ direction = 0; sort = CPUUsage; }' \
    '4' '{ direction = 0; sort = CPUUsage; }'

# Select the Network tab
defaults write com.apple.ActivityMonitor SelectedTab -int 4

# Update Frequency: Often (2 sec)
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

# Mavericks: Show Data in the Disk graph (instead of IO)
defaults write com.apple.ActivityMonitor DiskGraphType -int 1

# Mavericks: Show Data in the Network graph (instead of packets)
defaults write com.apple.ActivityMonitor NetworkGraphType -int 1


# ==============================================
# Contacts (Address Book)
# ==============================================
echo "Setting Contacts preferences"

# Address format
defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string "fi"

# Display format "Last, First"
defaults write com.apple.AddressBook ABNameDisplay -int 1

# Sort by last name
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"


# ==============================================
# Calendar (iCal)
# ==============================================
echo "Setting Calendar preferences"

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
echo "Setting CD & DVD preferences"

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
echo "Setting Archive Utility preferences"

# Move archives to trash after extraction
defaults write com.apple.archiveutility "dearchive-move-after" -string "~/.Trash"

# Don't reveal extracted items
defaults write com.apple.archiveutility "dearchive-reveal-after" -bool false


# ==============================================
# Xcode
# ==============================================
echo "Setting Xcode preferences"

# Always use spaces for indenting
defaults write com.apple.dt.Xcode DVTTextIndentUsingTabs -bool false

# Show tab bar
defaults write com.apple.dt.Xcode AlwaysShowTabBar -bool true


# ==============================================
# BBEdit and TextWrangler
# ==============================================
echo "Setting BBEdit and TextWrangler preferences"

function set_barebones_prefs() {
    defaults write com.barebones.bbedit "$@"
    defaults write com.barebones.textwrangler "$@"
}

# Expand tabs to spaces (except in XML)
set_barebones_prefs EditorAutoExpandTabs -bool true
set_barebones_prefs EditorAutoExpandTabs_XML -bool false

# In XML, show invisibles and soft wrap text
set_barebones_prefs EditorShowInvisibleCharacters_XML -bool true
set_barebones_prefs EditorSoftWrap_XML -bool true

# Default tab width is 4 spaces
set_barebones_prefs EditorDefaultTabWidth -int 4

# Ruby tab width is 2 spaces
set_barebones_prefs EditorDefaultTabWidth_Ruby -int 2

# Automatically indent
set_barebones_prefs EditorAutoIndent -bool true

# Don't check spelling
set_barebones_prefs EditorCheckSpellingAsYouType -bool false

# Don't suggest nonsense when I'm writing code
set_barebones_prefs IncludeDictionaryWordsInCompletionList -bool false

# Open documents in new window
set_barebones_prefs NewAndOpenPrefersSharedWindow -bool false

# Do nothing when app becomes active
set_barebones_prefs StartupAndResumeAction -int 1

# Ensure that file ends with a line break
set_barebones_prefs EnsureTrailingLineBreak -bool true

# Don't strip trailing white space
set_barebones_prefs StripTrailingWhitespace -bool false

# Complete with ESC
set_barebones_prefs UseEscapeKeyAsCompletionTrigger -boolean true

# No default filename extensions
set_barebones_prefs EnableDefaultFilenameExtensions -bool false

# Double-clicking on a delimiter includes the delimiters in the resulting selection
set_barebones_prefs BalanceIncludesDelimiters -bool true

# Don't try to reopen files if it requires mounting volumes
set_barebones_prefs AllowVolumeMount -bool false

# Allow update checking
set_barebones_prefs SUSoftwareUpdateEnabled -bool true
set_barebones_prefs SUSoftwareUpdateHasCompletedFirstRun -bool true

# Add some default mappings
set_barebones_prefs BBSuffixMapOverrides -array-add '{ fileExtension = recipe; languageName = { languageCode = "XML "; languageName = XML; }; }'
set_barebones_prefs BBSuffixMapOverrides -array-add '{ fileExtension = pkginfo; languageName = { languageCode = "XML "; languageName = XML; }; }'
set_barebones_prefs BBSuffixMapOverrides -array-add '{ fileExtension = pp; languageName = { languageCode = Ruby; languageName = Ruby; }; }'

CFPreferencesAppSynchronize "com.barebones.bbedit"
CFPreferencesAppSynchronize "com.barebones.textwrangler"


# ==============================================
# Go2Shell
# ==============================================
echo "Setting Go2Shell preferences"

# Custom command
defaults write com.zipzapmac.Go2Shell "Terminal Command" -string "cd %PATH%"
CFPreferencesAppSynchronize "com.zipzapmac.Go2Shell"


# ==============================================
# Name Mangler
# ==============================================
echo "Setting Name Mangler preferences"

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

CFPreferencesAppSynchronize "com.manytricks.NameMangler"


# ==============================================
# Tweetbot
# ==============================================
echo "Setting Tweetbot preferences"

# Use absolute dates
defaults write com.tapbots.TweetbotMac dateFormatType -int 1

# Display both name and username
defaults write com.tapbots.TweetbotMac displayNameType -int 3

# Don't pin timeline to top
defaults write com.tapbots.TweetbotMac streamingPinToTopEnabled -bool false

# Quote format: RT with comment
defaults write com.tapbots.TweetbotMac quoteFormatType -int 1

# Font size: Medium
defaults write com.tapbots.TweetbotMac fontSize -int 13

# Don't show status item
defaults write com.tapbots.TweetbotMac showStatusItem -bool false

# No sounds
defaults write com.tapbots.TweetbotMac soundType -int 2

# Image Thumbnails: Small
defaults write com.tapbots.TweetbotMac statusViewImageType -int 1

CFPreferencesAppSynchronize "com.tapbots.TweetbotMac"

# ==============================================
# VMware Fusion
# ==============================================
echo "Setting VMware Fusion preferences"

# Applications menu: Show in Menu Bar: Never
defaults write com.vmware.fusion showStartMenu3 -int 0

CFPreferencesAppSynchronize "com.vmware.fusion"

# ==============================================
# Finder
# ==============================================
echo "Setting Finder preferences"

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

CFPreferencesAppSynchronize "com.apple.finder"

# ==============================================
# Dock
# ==============================================
echo "Setting Dock preferences"

# Position (left, bottom, right)
defaults write com.apple.dock orientation -string "left"


# ==============================================
# Safari & WebKit
# ==============================================
echo "Setting Safari & WebKit preferences"

# Appearance

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Show favorites bar
defaults write com.apple.Safari ShowFavoritesBar -bool true
defaults write com.apple.Safari "ShowFavoritesBar-v2" -bool true

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
defaults write com.apple.Safari AutoFillPasswords -bool true


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


# Notifications

# Don't even ask about the push notifications
defaults write com.apple.Safari CanPromptForPushNotifications -bool false


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

CFPreferencesAppSynchronize "com.apple.Safari"


# ==============================================
# Disk Utility
# ==============================================
echo "Setting Disk Utility preferences"

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

CFPreferencesAppSynchronize "com.apple.DiskUtility"


# ==============================================
# Terminal
# ==============================================
echo "Setting Terminal preferences"

# ----------------------------------------------
# Copy the Basic profile to "Basic Improved"
# ----------------------------------------------
pathToTerminalPrefs="${HOME}/Library/Preferences/com.apple.Terminal.plist"
/usr/libexec/PlistBuddy -c "Copy :Window\ Settings:Basic :Window\ Settings:Basic\ Improved" ${pathToTerminalPrefs}
/usr/libexec/PlistBuddy -c "Set :Window\ Settings:Basic\ Improved:name Basic\ Improved" ${pathToTerminalPrefs}

# ----------------------------------------------
# Modify the "Basic Improved" profile
# ----------------------------------------------

# Close if the shell exited cleanly
/usr/libexec/PlistBuddy -c "Add :Window\ Settings:Basic\ Improved:shellExitAction integer 1" ${pathToTerminalPrefs}

# Make the window a bit larger
/usr/libexec/PlistBuddy -c "Add :Window\ Settings:Basic\ Improved:columnCount integer 120" ${pathToTerminalPrefs}
/usr/libexec/PlistBuddy -c "Add :Window\ Settings:Basic\ Improved:rowCount integer 70" ${pathToTerminalPrefs}

# ----------------------------------------------
# Modify Terminal preferences
# ----------------------------------------------

# Shell opens with: /bin/bash
defaults write com.apple.Terminal Shell -string "/bin/bash"

# Set the "Basic Improved" as the default
defaults write com.apple.Terminal "Startup Window Settings" -string "Basic Improved"
defaults write com.apple.Terminal "Default Window Settings" -string "Basic Improved"

CFPreferencesAppSynchronize "com.apple.Terminal"


# ==============================================
# Kill affected applications
# ==============================================

function killallApps() {
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
        killall "${app}" > /dev/null 2>&1
        if [[ $? -eq 0 ]]; then
            # We just killed an app so restart it
            open -a "${app}"
        fi
    done

    echo "Note that some of these changes require a logout/restart to take effect."
}

printf "Restart the affected applications? (y/n): "
read killallReply
if [[ $killallReply =~ ^[Yy]$ ]]; then
    killallApps
fi

exit 0
