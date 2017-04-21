#!/bin/sh
# enables automatic check, as some clients seem to have it off, never appearing in FW asking for updates
# disable automatic downloads of updates, esp Sierra
# Cyril Niklaus ART Computer SA
# v1.1 2016-10-19

defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool TRUE
defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool FALSE
# fichiers system
defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool FALSE 
# system updates
defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdateRestartRequired -bool FALSE 
# app updates
defaults write /Library/Preferences/com.apple.commerce.plist AutoUpdate -bool FALSE  
exit 0