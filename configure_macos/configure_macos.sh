#!/usr/bin/env bash

# Quit System Preferences so it doesn't override settings
osascript -e 'tell application "System Preferences" to quit'

# ============================================================================
echo "Configure macOS core settings..."

sudo -v

# Disable startup noise
sudo nvram StartupMute=%01

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ============================================================================
echo "Configuring Finder settings..."

# Use column view by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable Finder animations for speed
defaults write com.apple.finder DisableAllAnimations -bool true

# Always show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the full path at the bottom of Finder
defaults write com.apple.finder ShowPathbar -bool true

# Unhide the ~/Library folder
chflags nohidden ~/Library

# Disable warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show path bar and status bar
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Show POSIX path in title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# New windows open to home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Disable .DS_Store on network and USB drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ============================================================================

echo "Configuring Dock and Mission Control..."

# Hide the Dock
defaults write com.apple.dock autohide -bool true

# Don't show recent apps in the Dock
defaults write com.apple.dock show-recents -bool false

# Put Dock to the left site
defaults write com.apple.dock orientation -string left

# Set Dock icon size
defaults write com.apple.dock tilesize -int 31

# No magnification
defaults write com.apple.dock magnification -bool false

# Group windows by application in Mission Control
defaults write com.apple.dock expose-group-by-app -bool true

# Trackpad gestures for App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Disable hot corners (set all to 0 for no action)
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# ============================================================================

echo "Configuring UI and animations..."

# Reduce menu bar spacing for MacBooks with notch
defaults write NSGlobalDomain NSStatusItemSelectionPadding -int 10
defaults write NSGlobalDomain NSStatusItemSpacing -int 10

# Faster window resize
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Instant Quick Look
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

# ============================================================================

echo "Configuring input and text settings..."

# Disable all automatic text corrections
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false


# Disable press and hold for special characters
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable language indicator
defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled -bool false

# Fast keyboard repeat rate (requires logout)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Sound

defaults write com.apple.sound.beep.flash -bool false
defaults write com.apple.sound.beep.volume -int 0

# Configure Trackpad config
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -bool false

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -bool false

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false

# ============================================================================

echo "Configuring screenshot settings..."

# Save as PNG
defaults write com.apple.screencapture type -string "png"

# Save to Downloads
defaults write com.apple.screencapture location -string "${HOME}/Desktop/Screenshots"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# No floating thumbnail
defaults write com.apple.screencapture show-thumbnail -bool false

# Custom name prefix
defaults write com.apple.screencapture name -string "Screenshot"

# ============================================================================

echo "Configuring Activity Monitor..."

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Show CPU history in Dock icon
defaults write com.apple.ActivityMonitor IconType -int 6

# Update frequency: Often (2 seconds)
defaults write com.apple.ActivityMonitor UpdatePeriod -int 2

# ============================================================================

echo "Configuring privacy settings..."

# Disable Spotlight web search (keeps searches local)
defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool true

# Disable crash reporter dialog
defaults write com.apple.CrashReporter DialogType -string "none"

# ============================================================================

echo "Configuring system preferences..."

# Prevent Photos from auto-launching
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool YES

# Disable app state restoration
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Remove spring loading delay
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# ============================================================================

echo "Applying changes..."

# Restart affected services
for app in "Finder" "Dock" "SystemUIServer" "WindowManager"; do
    killall "${app}" &> /dev/null || true
done

# Restart preference daemon
killall cfprefsd

echo ""
echo "✅ Setup complete!"
echo ""
echo "Consider rebooting for all changes to take effect."
