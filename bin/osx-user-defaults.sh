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

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Enable double-space to period
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Sidebar icon size: Small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Show scroll bars: Always
defaults write NSGlobalDomain AppleShowScrollBars Always

# Click in the scroll bar to: Jump to the next page
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 0

# Don't try to save to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Audio and sound effects

# Disable feedback when changing volume
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

# Disable flashing the screen when an alert sound occurs (accessibility)
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

# Alert volume 50%
defaults write NSGlobalDomain com.apple.sound.beep.volume -float 0.6065307

# Disable interface sound effects
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -bool false


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
# Mouse and trackpad
# ==============================================
echo "Setting Mouse and Trackpad preferences"

# Set scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Swipe between pages with two fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true


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

# Sort by last name
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

# Display format "Last, First" (High Sierra)
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 2

# Prefer nicknames
defaults write NSGlobalDomain NSPersonNameDefaultShouldPreferNicknamesPreference -bool true


# ==============================================
# Calendar (iCal)
# ==============================================
echo "Setting Calendar preferences"

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# Show 7 days
defaults write com.apple.iCal "n days of week" -int 7

# Week starts on monday
defaults write com.apple.iCal "first day of week" -int 1

# Day starts at 8am
defaults write com.apple.iCal "first minute of work hours" -int 480

# Day ends at 6pm
defaults write com.apple.iCal "last minute of work hours" -int 1080

# Show event times
defaults write com.apple.iCal "Show time in Month View" -bool true

# Show events in year view
defaults write com.apple.iCal "Show heat map in Year View" -bool true


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

# Ruby and YAML tab width is 2 spaces
set_barebones_prefs EditorDefaultTabWidth_Ruby -int 2
set_barebones_prefs EditorDefaultTabWidth_YAML -int 2

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
# SourceTree
# ==============================================
echo "Setting SourceTree preferences"

# Smaller icons in the bookmark view
defaults write com.torusknot.SourceTreeNotMAS bookmarksStyleSize -int 1

# No notifications
defaults write com.torusknot.SourceTreeNotMAS disableDesktopNotifications -bool true

# Diff defaults
defaults write com.torusknot.SourceTreeNotMAS diffIgnoreWhitespace -bool true
defaults write com.torusknot.SourceTreeNotMAS diffContextLevel -int 6

# Staging mode
defaults write com.torusknot.SourceTreeNotMAS fileStatusFilterMode -int 1
defaults write com.torusknot.SourceTreeNotMAS fileStatusStagingViewMode -int 1
defaults write com.torusknot.SourceTreeNotMAS fileStatusViewMode2 -int 1

# No tips
defaults write com.torusknot.SourceTreeNotMAS showStagingTip -bool false
defaults write com.torusknot.SourceTreeNotMAS showToolbarTip -bool false

CFPreferencesAppSynchronize "com.torusknot.SourceTreeNotMAS"

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

# Show the toolbar items
defaults write com.vmware.fusion fusionDevicesToolbarItemIsExpanded -bool true

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

# No tabs, just plain new windows
defaults write com.apple.finder FinderSpawnTab -bool false

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


# Search settings

# Search engine: Google
defaults write -g NSPreferredWebServices -dict 'NSWebServicesProviderWebSearch' '{ NSDefaultDisplayName = Google; NSProviderIdentifier = com.google.www; }'

# Enable search engine suggestions
defaults write com.apple.Safari SuppressSearchSuggestions -bool false

# Smart search field:

# Disable Safari suggestions
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari UniversalSearchFeatureNotificationHasBeenDisplayed -bool true

# Disable top hit preloading
defaults write com.apple.Safari PreloadTopHit -bool false

# Disable quick website search
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false


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

# Cookies and website data
# - Always block
#defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 2
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 2

# Website use of location services
# 0 = Deny without prompting
# 1 = Prompt for each website once each day
# 2 = Prompt for each website one time only
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 0

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

# View -> Show All Devices
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true

CFPreferencesAppSynchronize "com.apple.DiskUtility"


# ==============================================
# Terminal
# ==============================================
echo "Setting Terminal preferences"

# ----------------------------------------------
# Create a new "Basic Improved" profile
# ----------------------------------------------
defaults write com.apple.Terminal "Window Settings" -dict-add "Basic Improved" "
<dict>
    <key>Font</key>
    <data>
    YnBsaXN0MDDUAQIDBAUGGBlYJHZlcnNpb25YJG9iamVjdHNZJGFy
    Y2hpdmVyVCR0b3ASAAGGoKQHCBESVSRudWxs1AkKCwwNDg8QVk5T
    U2l6ZVhOU2ZGbGFnc1ZOU05hbWVWJGNsYXNzI0AmAAAAAAAAEBCA
    AoADXlNGTW9uby1SZWd1bGFy0hMUFRZaJGNsYXNzbmFtZVgkY2xh
    c3Nlc1ZOU0ZvbnSiFRdYTlNPYmplY3RfEA9OU0tleWVkQXJjaGl2
    ZXLRGhtUcm9vdIABCBEaIy0yNzxCS1JbYmlydHZ4h4yXoKeqs8XI
    zQAAAAAAAAEBAAAAAAAAABwAAAAAAAAAAAAAAAAAAADP
    </data>
    <key>FontAntialias</key>
    <true/>
    <key>FontWidthSpacing</key>
    <real>1.004032258064516</real>
    <key>ProfileCurrentVersion</key>
    <real>2.0499999999999998</real>
    <key>columnCount</key>
    <integer>100</integer>
    <key>name</key>
    <string>Basic Improved</string>
    <key>rowCount</key>
    <integer>45</integer>
    <key>shellExitAction</key>
    <integer>1</integer>
    <key>type</key>
    <string>Window Settings</string>
</dict>
"

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
