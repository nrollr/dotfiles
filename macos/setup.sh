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

# Power Management: sleep the display after 1 hours
sudo pmset -a displaysleep 60
# Power Management: disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0
# Power Management: disable wake for network access
sudo pmset -a womp 0
# Power Management: disable put hard disks to sleep when possible
sudo pmset -a disksleep 0

# Screenshot: save screenshots to ~/Screenshots
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"
# Screenshot: save screenshots in PNG format
defaults write com.apple.screencapture type -string "png"
# Screenshot: disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Finder: set Downloads as the default location for new Finder windows
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Finder: disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Finder: show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Dock: change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 31
# Dock: remove recent applications & process indicators
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool false

# Hot corners: bottom left screen corner → Put display to sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Terminal: only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# TextEdit: use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0
# TextEdit: open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4


# Kill affected applications
for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "Terminal" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."