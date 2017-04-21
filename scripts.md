Voici les scripts que j'ai écrits, trouvés ou modifiés.
    
    #!/bin/sh
    # basename.sh
    # Based on an idea cribbed from Todd Kitchen via the MacEnterprise mailing list
    # https://discussions.apple.com/message/22391604#22391604
    # change a Mac OS X client host name.
    if [ -z "$1" ]
        then
        echo "Changes a Mac OS X client host name."
        echo "Usage: sudo `basename $0` hostname"
        exit $E_WRONGARGS
    fi
    scutil --set ComputerName $1
    scutil --set HostName $1
    scutil --set LocalHostName $1
    
-------

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

----
    #!/bin/sh
    # This script will clear the Favorites Servers then add one to the list appearing at Go -> Connect to Server
    # for all > 500 user accounts. 
    # To create your own shortcut, just change the variables:
    #
    # ServerName = the name of the server you'd like to appear in your list
    # ServerURL = the actual URL to that server
    # LOG = whatever your sdout file is
    
    # Based on work by
    # Mike (http://jamfnation.jamfsoftware.com/viewProfile.html?userID=1927)
    # Rich Trouton (http://derflounder.wordpress.com/2013/01/10/updating-server-bookmarks-in-com-apple-sidebarlists-plist/)
    # themacdweeb (https://jamfnation.jamfsoftware.com/viewProfile.html?userID=1474)
    # https://jamfnation.jamfsoftware.com/discussion.html?id=5010
    # Modified by Cyril Niklaus
    
    #----------------------------------------------------------
    #   Variables
    #----------------------------------------------------------
    
    # --- assignments ---
    ServerName="eleves"
    ServerURL="smb://florinfo-dc01.florinfo.ch/eleves$"
    
    # --- executables ---
    Plist="/usr/libexec/PlistBuddy"
    
    # --- directories ---
    LOG="/var/log/system.log"
    
    # --- computationals ---
    date=`date +%Y%m%d`
    
    over500=`dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'`
    
    # This returns the currently logged-in, active user.
    LoggedInUser=`stat /dev/console | awk '{print $5}'` 
    
    # Determine OS version
    osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
    
    # ---------------------------------------------------------------------------
    #   Go to every user, back-up file, clean the favorites, add the bookmark we defined then fix the permissions.
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
       /usr/bin/osascript << 'END'
    tell application "System Events"
    activate
    set input to display dialog "The computer will reboot in 2 minutes, please save your work." buttons {"OK"} default button 1
    end tell
    END
    shutdown -r +2
    exit 0
    fi
    
    if [[ ${osvers} -ge 8 ]]; then
    killall -u $LoggedInUser cfprefsd
    fi
    exit 0
-----

    dscl . -passwd /Users/admin newpassword
    passwd
----
    # enable ARD for user admin
    sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users admin -privs -all -restart -agent -menu