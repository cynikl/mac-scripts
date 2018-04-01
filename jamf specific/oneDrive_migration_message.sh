#!/bin/bash
process="OneDrive"
processrunning=$( pgrep OneDrive )
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
windowType="hud"

# Window title
title="OneDrive Update"
# Window heading
heading="OneDrive Update"
# Window message
description="Your Mac requires a security update to Microsoft OneDrive. 
*Please save your documents before clicking on Update."

button1="Update"
button2="Cancel"
icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns"

alignDescription="left" 
alignHeading="center"

defaultButton="1"
cancelButton="2"

timeout="7200"
userChoice=$("$jamfHelper" -windowType "$windowType" -lockHUD -title "$title" -timeout "$timeout" -defaultButton "$defaultButton" -cancelButton "$cancelButton" -icon "$icon" -description "$description" -alignDescription "$alignDescription" -alignHeading "$alignHeading" -button1 "$button1" -button2 "$button2")
if [ "$userChoice" == "0" ]; then
    echo "User clicked Update; now running policy via ID number."

    # # Runs checks to see if $process is running
    # # not needed for onedrive
    # if [ "$processrunning" != "" ]; then
    #     echo "$process found running"
    #     /bin/echo "Stopping process: $process"
    #     kill -9 "${processrunning}"
    #     jamf policy -id 89
    # else
    #     jamf policy -id 89
    # fi
    jamf policy -event migrate_onedrive
fi