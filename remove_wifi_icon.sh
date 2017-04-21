#!/bin/sh
# http://superuser.com/questions/398071/how-can-i-hide-show-the-wi-fi-menu-item-from-the-terminal-in-os-x
# Removes the Wifi menu from the menubar.
# This setting is set on a per-user basis, so needs to be run as the user
# Will require a logout. A 'kill SystemUIServer' might work?

OIFS="$IFS"

menutemp=$(defaults read com.apple.systemuiserver menuExtras)
menutemp2=$(echo $menutemp | sed 's/( //')
menutemp3=$(echo $menutemp2 | sed 's/ )//')

IFS=','
read -a menuitems <<< "$menutemp3"
IFS="$OIFS"

for (( i = 0 ; i < ${#menuitems[@]} ; i++ ))
do
    if [ "${menuitems[$i]}" = '"/System/Library/CoreServices/Menu Extras/AirPort.menu"' ]
    then
        /usr/libexec/PlistBuddy -c "Delete :menuExtras:$i" ~/Library/Preferences/com.apple.systemuiserver.plist
    fi
done
killall SystemUIServer