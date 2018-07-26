#!/bin/bash
# Cyril Niklaus
# 2018-07-26
# Needs Install macOS High Sierra.app to be on the client, mimunum 10.13.4 for --eraseinstall to work.
# This deletes the jamfpro entry before erasing the Mac itself, which helps with a clean re-enroll
# Logging for this script is not implemented, since the Mac is erased.
# The --eraseinstall option may not work with vms as it needs more than 8 GB of free space.

# Set these three parameters in jamfpro
apiUsername="$4"
apiPassword="$5"
jamfproURL="$6"

jamfproIDURL="${jamfproURL}/JSSResource/computers/id"

serialNumber=$(ioreg -rd1 -c IOPlatformExpertDevice | awk -F'"' '/IOPlatformSerialNumber/{print $4}')

# Using head -1 to get only the computer ID, as there is also the site ID in the general subset
idNumber=$(curl -sfku "${apiUsername}:${apiPassword}" "${jamfproURL}/JSSResource/computers/serialnumber/${serialNumber}/subset/general" | xmllint --format - | awk -F'>|<' '/<id>/{print $3}' | head -1)

# Check if the ID returned is a number
if [[ "$idNumber" =~ ^[0-9]+$ ]]; then
 echo "curl -X DELETE ${jamfproIDURL}/$idNumber"
 # Uncomment the following line when sure you want to delete the entry
 # curl -X DELETE "${jamfproIDURL}/$idNumber" -u $apiUsername:${apiPassword}

 else
 	echo " $idNumber is not a correct ID number, but let's erase the Mac anyway."
fi

# Putting this in the background
echo "Erasing and Reinstalling macOS High Sierra"
# Uncomment the following line when you want to erase and reinstall the Mac
#"/Applications/Install macOS High Sierra.app/Contents/Resources/startosinstall" --applicationpath "/Applications/Install macOS High Sierra.app" --eraseinstall --newvolumename "Macintosh HD" --agreetolicense --nointeraction &

# One could kill the Self-Service app but it is not particularly necessary, as startosinstall will do that for us.
exit 0
