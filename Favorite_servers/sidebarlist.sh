
#!/bin/sh

# script to add a server to the list appearing at Go -> Connect to Server
# for all > 500 user accounts.
# to create your own shortcuts, just change the variables:
#
# ServerName = the name of the server you'd like to appear in your list
# ServerURL = the actual URL to that server
# LOG = whatever your sdout file is

# reference thanks to:
# Mike (http://jamfnation.jamfsoftware.com/viewProfile.html?userID=1927)
# Rich Trouton (http://derflounder.wordpress.com/2013/01/10/updating-server-bookmarks-in-com-apple-sidebarlists-plist/)
# Written by
# themacdweeb (https://jamfnation.jamfsoftware.com/viewProfile.html?userID=1474)
# https://jamfnation.jamfsoftware.com/discussion.html?id=5010

#----------------------------------------------------------
#   Variables
#----------------------------------------------------------

# --- assignments ---
ServerName="eleves" #doesn't need to be a URL
ServerURL="smb://florinfo-dc01.florinfo.ch/eleves$"

# --- executables ---
Plist="/usr/libexec/PlistBuddy"

# --- directories ---
LOG="/var/log/sidebarlists.log"

# --- computationals ---
date=`date "+%A %m/%d/%Y %H:%M"`
over500=`dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'`
# CN
LoggedInUser=`stat /dev/console | awk '{print $5}'`

# ---------------------------------------------------------------------------
#   Go to every user, back-up file, add new link, fix permissions
# ---------------------------------------------------------------------------
for i in $over500
do
	cd /Users/$i/Library/Preferences
	zip SidebarListsBackup.zip com.apple.sidebarlists.plist
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0 dict" >> $LOG
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0:Name string ${ServerName}" >> $LOG
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0:URL string ${ServerURL}" >> $LOG
	/usr/sbin/chown ${i}:staff /Users/$i/Library/Preferences/com.apple.sidebarlists.plist
	
done

# add CN
if [[ ${osvers} -lt 8 ]]; then
   #exit 0
   osascript << 'END'
tell application "System Events"
	activate
	set input to display dialog "The computer will reboot in 10 minutes, save your work." buttons {"OK", "Cancel"} default button 1
end tell
END
shutdown -r +1
exit 0
fi

if [[ ${osvers} -ge 8 ]]; then
	killall -u $LoggedInUser cfprefsd
fi
exit 0