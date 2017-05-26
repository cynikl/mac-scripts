#!/bin/sh
# reboot_dialog.sh
    osascript << 'END'
    tell application "System Events"
        activate
        set input to display dialog "The computer will reboot in 10 minutes, save your work and quit running applications." buttons {"OK", "Cancel"} default button 1
    end tell
    END
    shutdown -r +10
    exit 0
