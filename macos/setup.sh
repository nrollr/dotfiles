#!/usr/bin/env bash

# Close any open System Preferences panes
osascript -e 'tell application "System Preferences" to quit'
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# General: set computer name
sudo scutil --set ComputerName "MacBookPro"
sudo scutil --set HostName "MacBookPro"
sudo scutil --set LocalHostName "MacBookPro"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MacBookPro"
# General: set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
# General: show scroll bars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
# General: expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# General: expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# General: disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# General: disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# General: disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# General: disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# General: disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# General: disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# General: remove duplicates in the “Open With” menu (also see `lscleanup` alias)
# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

# Trackpad: enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Trackpad: disable “natural” scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Trackpad: silent clicking
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# Bluetooth: increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Input: set language and text formats
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# Date & Time: set the timezone
sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

# Power Management: sleep the display after 3 hours
sudo pmset -a displaysleep 180
# Power Management: set standby delay to 24 hours
sudo pmset -a standbydelay 86400
# Power Management: never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null
# Power Management: disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0
# Power Management: disable wake for network access
sudo pmset -a womp 0
# Power Management: disable put hard disks ti sleep when possible
sudo pmset -a disksleep 0

# Security & Privacy: require password immediately after sleep
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Screenshot: save screenshots to ~/Screenshots
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
# Screenshot: save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"
# Screenshot: disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Finder: set Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Finder: avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Finder: disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Finder: show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Dock: change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
# Dock: wipe all default app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Hot corners: bottom left screen corner → Put display to sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Safari: privacy - don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Safari: set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# Safari: prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Safari: hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false
# Safari: enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Safari: disable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool false
# Safari: disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
# Safari: disable AutoFill
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
# Safari: warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
# Safari: block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
# Safari: disable auto-playing video
defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
# Safari: enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
# Safari: update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Terminal: only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Time Machine: prevent from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Time Machine: disable local snapshots
sudo tmutil disablelocal

# Activity Monitor: show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Activity Monitor: show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Activity Monitor: sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# TextEdit: use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0
# TextEdit: open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Mac App Store: enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Mac App Store: check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Mac App Store: turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Photos: prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Messages: disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Transmission: don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false
# Transmission: trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true
# Transmission: hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Transmission: hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Kill affected applications
for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "Messages" \
    "Photos" \
    "Safari" \
    "SystemUIServer" \
    "Transmission"; do
    killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."