#!/bin/bash

set -x
set -euo pipefail

# ==============================================
# macos-user-defaults.sh
#
# Commands target the current boot drive
#
# Hannes Juutilainen <hjuutilainen@mac.com>
# ==============================================


#
# Files and folders
#

# Show the ~/Library directory
chflags nohidden "${HOME}/Library"

# Don't show the ~/bin directory
if [[ -d "${HOME}/bin" ]]; then
    chflags hidden "${HOME}/bin"
fi


#
# NSGlobalDomain settings
#
echo "Setting NSGlobalDomain preferences"

# Interface style: Light
defaults delete NSGlobalDomain AppleInterfaceStyle > /dev/null 2>&1 || true
defaults delete NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1 || true

# Interface style: Dark
# defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# defaults delete NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically > /dev/null 2>&1 || true

# Interface style: Auto
# defaults delete NSGlobalDomain AppleInterfaceStyle > /dev/null 2>&1 || true
# defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Don't automatically hide and show the menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool false

# Don't allow wallpaper tinting in windows
defaults write NSGlobalDomain AppleReduceDesktopTinting -bool true

# Language and Region (locale)
defaults write NSGlobalDomain AppleLanguages -array "en-US"
#defaults write NSGlobalDomain AppleLocale -string "fi_FI"
defaults write NSGlobalDomain AppleLocale -string "en_FI"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

# First day of week, 1 = Sunday, 2 = Monday, etc.
defaults write NSGlobalDomain AppleFirstWeekday -dict gregorian -int 2

# Default date format
defaults delete NSGlobalDomain AppleICUDateFormatStrings > /dev/null 2>&1 || true

# Custom date format
# defaults write NSGlobalDomain AppleICUDateFormatStrings -dict 1 "y-MM-dd"

# 24-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

# Live Text
defaults write NSGlobalDomain AppleLiveTextEnabled -bool true

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

# Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Set window resize time
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Enable text completion
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool true

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Automatically identify language for spelling correction
defaults write NSGlobalDomain NSSpellCheckerAutomaticallyIdentifiesLanguages -bool true

# Disable capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Enable double-space to period
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true

# Disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Sidebar icon size: Small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Show scroll bars: Always, Automatic, WhenScrolling
defaults write NSGlobalDomain AppleShowScrollBars Automatic

# Click in the scroll bar to: Jump to the next page
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 0

# Ask to keep changes when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# Don't try to save to iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable App Nap for all apps
defaults write NSGlobalDomain NSAppSleepDisabled -bool true

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Show fast user switching menu as: Icon
defaults write NSGlobalDomain userMenuExtraStyle -int 2

# Prefer tabs in full-screen apps only
defaults write NSGlobalDomain AppleWindowTabbingMode -string "fullscreen"

#
# Audio and sound effects
#
echo "Setting Sound preferences"

# Disable feedback when changing volume
defaults write NSGlobalDomain com.apple.sound.beep.feedback -bool false

# Disable flashing the screen when an alert sound occurs (accessibility)
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

# Alert volume 50%
defaults write NSGlobalDomain com.apple.sound.beep.volume -float 0.6065307

# Disable interface sound effects
defaults write NSGlobalDomain com.apple.sound.uiaudio.enabled -bool false



#
# Desktop & Screen Saver
#
echo "Setting Desktop & Screen Saver preferences"

# No translucent menu bar
defaults write NSGlobalDomain "AppleEnableMenuBarTransparency" -bool false

# Ask for password after 5 seconds
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Set screensaver to "Computer Name"
defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName -string "Computer Name" path -string "/System/Library/Frameworks/ScreenSaver.framework/PlugIns/Computer Name.appex" type -int 0

# Hot corners -> bottom left -> start screen saver
defaults write com.apple.dock "wvous-bl-corner" -int 5
defaults write com.apple.dock "wvous-bl-modifier" -int 0


#
# Mouse and trackpad
#
echo "Setting Mouse and Trackpad preferences"

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Disable natural scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Swipe between pages with two fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true

# Enable secondary click with two fingers
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Disable secondary click in bottom right or left corner if secondary click with two fingers is enabled
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0


#
# Accessibility
#

# Reduce motion
defaults write com.apple.universalaccess reduceMotion -bool true

# Reduce transparency
defaults write com.apple.universalaccess reduceTransparency -bool true

# Show window title icons
defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

# Show toolbar button shapes
defaults write com.apple.universalaccess showToolbarButtonShapes -bool true



# =====================
# Applications
# =====================



#
# Activity Monitor
#
echo "Setting Activity Monitor preferences"

# Show main window on launch
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Dock icon = CPU Usage
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 100

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Add the "% CPU" column to the Disk and Network tabs
defaults write com.apple.ActivityMonitor "UserColumnsPerTab v6.0" -dict \
    '0' '( Command, CPUUsage, CPUTime, Threads, IdleWakeUps, Architecture, GPUUsage, GPUTime, PID, UID )' \
    '1' '( Command, anonymousMemory, Threads, Ports, PID, UID, ResidentSize )' \
    '2' '( Command, PowerScore, 12HRPower, AppSleep, graphicCard, powerAssertion, UID )' \
    '3' '( Command, bytesWritten, bytesRead, PID, UID, CPUUsage )' \
    '4' '( Command, txBytes, rxBytes, txPackets, rxPackets, PID, UID, CPUUsage )'

# Sort by CPU usage in Disk and Network tabs
defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
    '0' '{ direction = 0; sort = CPUUsage; }' \
    '1' '{ direction = 0; sort = anonymousMemory; }' \
    '2' '{ direction = 0; sort = 12HRPower; }' \
    '3' '{ direction = 0; sort = CPUUsage; }' \
    '4' '{ direction = 0; sort = CPUUsage; }'

# Select the Network tab
# defaults write com.apple.ActivityMonitor SelectedTab -int 4

# Update Frequency: Often (2 sec)
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

# Show Data in the Disk graph (instead of IO)
defaults write com.apple.ActivityMonitor DiskGraphType -int 1

# Show Data in the Network graph (instead of packets)
defaults write com.apple.ActivityMonitor NetworkGraphType -int 1



#
# Contacts (Address Book)
#
echo "Setting Contacts preferences"

# Address format
defaults write com.apple.AddressBook ABDefaultAddressCountryCode -string "fi"

# Sort by last name
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

# Display format "Last, First" (High Sierra)
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 2

# Prefer nicknames
defaults write NSGlobalDomain NSPersonNameDefaultShouldPreferNicknamesPreference -bool true



#
# Calendar (iCal)
#
echo "Setting Calendar preferences"

# Show week numbers
defaults write com.apple.iCal "Show Week Numbers" -bool true

# Show 7 days
defaults write com.apple.iCal "n days of week" -int 7

# Week starts on monday
defaults write com.apple.iCal "first day of week" -int 0

# Day starts at 8am
defaults write com.apple.iCal "first minute of work hours" -int 480

# Day ends at 6pm
defaults write com.apple.iCal "last minute of work hours" -int 1080

# Show event times
defaults write com.apple.iCal "Show time in Month View" -bool true

# Show events in year view
defaults write com.apple.iCal "Show heat map in Year View" -bool true



#
# Mail
#
echo "Setting Mail preferences"

# Mark all messages as read when opening a conversation
defaults write com.apple.mail ConversationViewMarkAllAsRead -bool true

# Disable sounds
defaults write com.apple.mail PlayMailSounds -bool false

# Disable URL loading
defaults write com.apple.mail-shared DisableURLLoading -bool true



#
# Archive Utility
#
echo "Setting Archive Utility preferences"

# Move archives to trash after extraction
defaults write com.apple.archiveutility "dearchive-into" -string "."

# Move archives to trash after extraction
defaults write com.apple.archiveutility "dearchive-move-after" -string "~/.Trash"

# Move archives to trash after extraction
defaults write com.apple.archiveutility "dearchive-recursively" -bool true

# Don't reveal extracted items
defaults write com.apple.archiveutility "dearchive-reveal-after" -bool false



#
# BBEdit
#
echo "Setting BBEdit and TextWrangler preferences"

function set_barebones_prefs() {
    defaults write com.barebones.bbedit "$@"
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
set_barebones_prefs StripTrailingWhitespace -bool true

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



#
# SourceTree
#
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



#
# VMware Fusion
#
echo "Setting VMware Fusion preferences"

# Applications menu: Show in Menu Bar: Never
defaults write com.vmware.fusion showStartMenu3 -int 0

# Show the toolbar items
defaults write com.vmware.fusion fusionDevicesToolbarItemIsExpanded -bool true



#
# Finder
#
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
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

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



#
# Desktop & Dock
#
echo "Setting Desktop & Dock preferences"

# Position (left, bottom, right)
defaults write com.apple.dock orientation -string "left"

# Hide recent apps
defaults write com.apple.dock show-recents -bool false

# Disable click wallpaper to show desktop items
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Disable Stage Manager
defaults write com.apple.WindowManager GloballyEnabled -bool false

# Show desktop icons
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool false

# Show widgets
defaults write com.apple.WindowManager StandardHideWidgets -bool false


#
# Safari & WebKit
#
echo "Setting Safari & WebKit preferences"

# Appearance

# Show status bar
defaults write com.apple.Safari ShowStatusBar -bool true

# Show favorites bar
defaults write com.apple.Safari "ShowFavoritesBar-v2" -bool true

# Don't show tab bar
defaults write com.apple.Safari AlwaysShowTabBar -bool false

# No background colors in toolbar
defaults write com.apple.Safari NeverUseBackgroundColorInToolbar -bool true


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

# Don't autofill anything
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false


# Search settings

# Search engine: Google
# defaults write -g NSPreferredWebServices -dict 'NSWebServicesProviderWebSearch' '{ NSDefaultDisplayName = Google; NSProviderIdentifier = com.google.www; }'
# defaults write com.apple.Safari SearchProviderShortName -string "Google"

# Search engine: Bing
# defaults write -g NSPreferredWebServices -dict 'NSWebServicesProviderWebSearch' '{ NSDefaultDisplayName = Bing; NSProviderIdentifier = com.bing.www; }'
# defaults write com.apple.Safari SearchProviderShortName -string "Bing"

# Search engine: DuckDuckGo
defaults write -g NSPreferredWebServices -dict 'NSWebServicesProviderWebSearch' '{ NSDefaultDisplayName = DuckDuckGo; NSProviderIdentifier = com.duckduckgo; }'
defaults write com.apple.Safari SearchProviderShortName -string "DuckDuckGo"

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
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true



#
# Disk Utility
#
echo "Setting Disk Utility preferences"

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# View -> Show All Devices
defaults write com.apple.DiskUtility SidebarShowAllDevices -bool true

# Show APFS snapshots
defaults write com.apple.DiskUtility WorkspaceShowAPFSSnapshots -bool true



#
# Terminal
#
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
# defaults write com.apple.Terminal Shell -string "/bin/bash"

# Set the "Basic Improved" as the default
defaults write com.apple.Terminal "Startup Window Settings" -string "Basic Improved"
defaults write com.apple.Terminal "Default Window Settings" -string "Basic Improved"


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
    "Disk Utility"
    "Safari"
    "System Preferences"
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
