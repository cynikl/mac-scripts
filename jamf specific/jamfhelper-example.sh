#!/bin/bash
process="Adobe Acrobat"
processrunning=$( pgrep Acrobat )
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
windowType="hud"

# Window title
title="Adobe Acrobat Update"
# Window heading
heading=" "
# Window message
description="Your Mac requires a security update to Adobe Acrobat. 
*Please save your documents before clicking on Update."

button1="Update"
button2="Cancel"
icon="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertNoteIcon.icns"

alignDescription="left" 
alignHeading="center"

defaultButton="2"
cancelButton="2"

timeout="7200"
userChoice=$("$jamfHelper" -windowType "$windowType" -lockHUD -title "$title" -timeout "$timeout" -defaultButton "$defaultButton" -cancelButton "$cancelButton" -icon "$icon" -description "$description" -alignDescription "$alignDescription" -alignHeading "$alignHeading" -button1 "$button1")
if [ "$userChoice" == "0" ]; then
    echo "User clicked Update; now running policy via ID number."

    # Runs checks to see if $process is running
    if [ "$processrunning" != "" ]; then
        echo "$process found running"
        /bin/echo "Stopping process: $process"
        kill -9 "${processrunning}"
        jamf policy -id 1527
    else
        jamf policy -id 1527
    fi
fi