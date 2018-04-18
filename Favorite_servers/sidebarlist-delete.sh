
#!/bin/bash
# This script will clear the Favorites Servers then add one to the list appearing at Go -> Connect to Server
# for all > 500 user accounts and reboot the client.
# Based on work by
# Mike (http://jamfnation.jamfsoftware.com/viewProfile.html?userID=1927)
# Rich Trouton (http://derflounder.wordpress.com/2013/01/10/updating-server-bookmarks-in-com-apple-sidebarlists-plist/)
# themacdweeb (https://jamfnation.jamfsoftware.com/viewProfile.html?userID=1474); https://jamfnation.jamfsoftware.com/discussion.html?id=5010
# Modified by Cyril Niklaus

#----------------------------------------------------------
#   Variables
#----------------------------------------------------------
# Modify the values under assignments to reflect your needs.
# To add more than one server, at the moment you'll have to create value pairs for them and add the relevant lines for Plist.
# eg: 
# ServerName1="prof"
# ServerURL1="smb://fileshare.example.com/prof"
#
#	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:1 dict" >> $LOG
#	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:1:Name string ${ServerName1}" >> $LOG
#	 $Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:1:URL string ${ServerURL1}" >> $LOG
#
# --- assignments ---
ServerName="eleves"
ServerURL="smb://my.server.edu/eleves$"

# --- executables ---
Plist="/usr/libexec/PlistBuddy"

# --- directories ---
LOG="/var/log/system.log"

# --- computationals ---
date=`date +%Y%m%d`

over500=`dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'`

# This returns the currently logged-in, active user.
# who | awk '/console{print $1}'
LoggedInUser=`stat /dev/console | awk '{print $5}'` 

# Determine OS version
osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
# reboot time in minutes
rTime="2"

# ---------------------------------------------------------------------------
#   Go to every user, back-up file, clean the favorites, add the bookmark we definded then fix permissions
# ---------------------------------------------------------------------------
for i in $over500
do
	cd /Users/$i/Library/Preferences
if [ -f /Users/$i/Library/Preferences/com.apple.sidebarlists.plist ]; then
      
      # Back up the existing file
      /bin/cp /Users/$i/Library/Preferences/com.apple.sidebarlists.plist /Users/$i/Library/Preferences/com.apple.sidebarlists-$date.plist

      # Fix permissions on backup file
      /usr/sbin/chown $i /Users/$i/Library/Preferences/com.apple.sidebarlists-$date.plist
	fi
	$Plist com.apple.sidebarlists.plist -c "Delete :favoriteservers:CustomListItems" >> $LOG
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems array"
	#$Plist com.apple.sidebarlists.plist -c 'Add :favoriteservers:Controller string "CustomListItems"'
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0 dict" >> $LOG
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0:Name string ${ServerName}" >> $LOG
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0:URL string ${ServerURL}" >> $LOG
	/usr/sbin/chown $i:staff /Users/$i/Library/Preferences/com.apple.sidebarlists.plist
	
done

if [[ ${osvers} -lt 8 ]]; then
shutdown -r +2
osascript << 'END'
set rTime2 to "$rTime"
set endTime to ((current date) + (rTime2 as integer) * 60)
repeat until (endTime = (current date))
	set whatsLeft to ((endTime - (current date)) as number)
	if whatsLeft > 60 then
		set whatsLeft to (whatsLeft / 60)
		display dialog ((whatsLeft as integer) as string) & " minutes left before the computer will reboot. Please save your work. 
L'ordinateur va redémarrer dans " & ((whatsLeft as integer) as string) & " minutes. Enregistrez vos documents ouverts, s'il vous plaît. " giving up after 60 buttons {"Refresh"} default button 1
	else
		display dialog ((whatsLeft as integer) as string) & " seconds left before the computer will reboot. Please save your work. 
L'ordinateur va redémarrer dans " & ((whatsLeft as integer) as string) & " secondes. Enregistrez vos documents ouverts, s'il vous plaît. " giving up after 30 buttons {"Refresh"} default button 1
	end if
end repeat
END

fi

if [[ ${osvers} -ge 8 ]]; then
	killall -u $LoggedInUser cfprefsd
fi
exit 0