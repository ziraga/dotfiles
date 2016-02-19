#!/usr/bin/env bash

# Set custom OS X defaults
# See also:
# https://github.com/mathiasbynens/dotfiles
# https://github.com/Wilto/dotfiles/blob/master/bin/osxdefaults

# -----------------------------------------------------------------------------
# GENERAL UI
# -----------------------------------------------------------------------------

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the focus ring animation
defaults write -globalDomain NSUseAnimatedFocusRing -bool NO

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# -----------------------------------------------------------------------------
# TRACKPAD, MOUSE, KEYBOARD, BLUETOOTH ACCESSORIES, AND INPUT
# -----------------------------------------------------------------------------

# Trackpad: right-click by tapping with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# -----------------------------------------------------------------------------
# DOCK
# -----------------------------------------------------------------------------

# Enable the 2D Dock
defaults write com.apple.dock no-glass -bool true

# Show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Use the scale effect for window minimizing
defaults write com.apple.dock mineffect scale

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# -----------------------------------------------------------------------------
# FINDER
# -----------------------------------------------------------------------------

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show the ~/Library folder (in OS X Lion)
chflags nohidden ~/Library

# Hide the ~/Public folder
chflags hidden ~/Public

# Use column view in all windows by default
# Four-letter codes for views modes: `icnv`, `Nlsv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Show no mounted media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Set $HOME as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# -----------------------------------------------------------------------------
# SHEETS/PANELS
# -----------------------------------------------------------------------------

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# -----------------------------------------------------------------------------
# SCREEN
# -----------------------------------------------------------------------------

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to ~/Desktop/Screengrabs
mkdir ~/Desktop/Screengrabs
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screengrabs"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "jpg"

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# -----------------------------------------------------------------------------
# DISKS
# -----------------------------------------------------------------------------

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable Time Machine prompts when attaching USB media
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# -----------------------------------------------------------------------------
# ITUNES
# -----------------------------------------------------------------------------

# Make ⌘ + F focus the search input
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# -----------------------------------------------------------------------------
# GOOGLE CHROME
# -----------------------------------------------------------------------------

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

# Disable the all too sensitive backswipe on Magic Mouse
defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

# -----------------------------------------------------------------------------
# PHOTOS
# -----------------------------------------------------------------------------

# Disable Photos show up when devices are plugged (OS X 10.11 and earlier)
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# -----------------------------------------------------------------------------
# SAFARI & WEBKIT
# -----------------------------------------------------------------------------

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# -----------------------------------------------------------------------------
# TIME MACHINE
# -----------------------------------------------------------------------------

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

# -----------------------------------------------------------------------------
# HARDWARE
# -----------------------------------------------------------------------------

# Speed up Magic Mice
# The maximum available in the preference pane is 3.0
defaults write -g com.apple.mouse.scaling 5.0

# Don't open Photos.app on each new device connection
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# -----------------------------------------------------------------------------
# MISC
# -----------------------------------------------------------------------------

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Disable spotlight Dictionary results
defaults write com.apple.spotlight DictionaryLookupEnabled -bool false

# -----------------------------------------------------------------------------
# HUP ALL THE THINGS
# Restart OS X services after running the script
# -----------------------------------------------------------------------------

for app in "Dashboard" "Dock" "Finder" "SystemUIServer" "Terminal" "iTunes"; do
  killall "$app" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."