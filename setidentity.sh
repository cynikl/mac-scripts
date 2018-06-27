#!/bin/bash
# maintenance script to set the identity
# Cyril Niklaus 2018-05-25

DATE='date +%Y-%m-%d_%H:%M:%S'


# log file
LOG='/var/log/setidentity.log'

function echo_log {
    echo `$DATE`" $1" >> $LOG
}
# start

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

echo_log "Got the logged-in user"

sudo -u "$loggedInUser" security set-identity-preference -s *.pretendco.com -c "$loggedInUser"

echo_log "All done here"
exit 0
