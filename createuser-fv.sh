#!/bin/sh

# https://www.jamf.com/jamf-nation/discussions/11869/creating-a-new-user-from-self-service

# Joe Thurwood 17/09/2014
#
# Create new user script, used in Self service
# this script will create a new user based on
# the credentials supplied. It also enables # the user in FileVault

# Set cocoaDialog location
CD="/private/etc/Ogilvy/Applications/CocoaDialog.app/Contents/MacOS/CocoaDialog"

# Dialog to enter the User name and the create $USERNAME variable
rv=($($CD standard-inputbox --title "Username" --no-newline --informative-text "Enter the name of the new user to add"))

USERNAME=${rv[1]}

if [ "$rv" == "1" ]; then echo "User said OK"
elif [ "$rv" == "2" ]; then echo "Cancelling" exit
fi

# Dialog to enter the Password and the create $PASSWORD variable
rv=($($CD secure-standard-inputbox --title "Password" --no-newline --informative-text "Enter the password of the new user to add"))

PASSWORD=${rv[1]}

if [ "$rv" == "1" ]; then echo "User said OK"
elif [ "$rv" == "2" ]; then echo "Canceling" exit
fi

#Create Mobile Account
sudo /System/Library/CoreServices/ManagedClient.app/Contents/Resources/createmobileaccount -n $USERNAME -p $PASSWORD > /dev/null 2>&1

# create the FileVault plist file:
echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>Username</key>
<string>'$4'</string>
<key>Password</key>
<string>'$5'</string>
<key>AdditionalUsers</key>
<array>
<dict>
<key>Username</key>
<string>'$USERNAME'</string>
<key>Password</key>
<string>'$PASSWORD'</string>
</dict>
</array>
</dict>
</plist>' > /tmp/fvenable.plist

# now add user to FileVault
sudo fdesetup add -i < /tmp/fvenable.plist

# remove fvenable.plist
rm /tmp/fvenable.plist
