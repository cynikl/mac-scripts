#!/bin/bash
# Cyril Niklaus at amaris dot com
# 2018-07-19 v 0.1 first working draft
# 2018-07-20 v 0.2 edited some comments
# This deletes a NoMAD install; to be run as root from a management solution
# Hat tip to Richard Purves for the find lines, this is more flexible than simply searching for an exact match.

# getting the logged-in user if present
loggedinuser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
# getting the logged-in user UID. This is needed for unloading the LaunchAgent.
luserUID=$(/usr/bin/id -u "$loggedinuser")

# logging
# date string
DATE=$(/bin/date +%Y-%m-%d_%H:%M:%S)
# logfile
logFile="/private/var/log/rmNoMAD.log"
if [ ! -f "$logFile" ];
then
/usr/bin/touch ${logFile}
fi

function echo_log {
    /bin/echo "$DATE" " $1" >> ${logFile}
}

# start
echo_log --------------------
echo_log "Let us remove NoMAD"
echo_log "Localuser logged-in name: $loggedinuser "

if [ -n "$loggedinuser" ];
then
	# check if the LaunchAgent is present and unloading it
	LAgent=$(/usr/bin/find /Library/LaunchAgents -maxdepth 1 -type f -iname "*nomad*.plist")
	# usually it is here:
	# LAgent="/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"
if [ ! -z "$LAgent" ];
then
	# unloading it using the correct method for 10.10 upwards
	echo_log "Unloading NoMAD LaunchAgent"
	/usr/bin/sudo -iu "$loggedinuser" launchctl bootout gui/"$luserUID" "$LAgent"
else
echo_log "LaunchAgent was not found"
fi

# check if nomad is running
NoMADPID=$(/usr/bin/pgrep NoMAD)
if [ ! -z "$NoMADPID" ];
then
	echo_log "killing NoMAD"
	/bin/kill -9 "$NoMADPID"
else
	echo_log "NoMAD is not running."
fi

# remove Nomad itself
echo_log "Removing Nomad if present"
nomad=$(/usr/bin/find /Applications -maxdepth 1 -type d -iname "*nomad*.app")
if [ -d "$nomad" ];
then
	echo_log "Removing NoMAD"
	/bin/rm -rf "$nomad"
	echo_log "Removing LaunchAgent"
	/bin/rm -rf "$LAgent"
else
	echo_log "NoMAD not installed"
fi
fi
echo_log "Removal complete"
exit 0
