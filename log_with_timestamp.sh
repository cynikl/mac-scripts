#!/bin/bash
# Cyril Niklaus at amaris dot com
# logging function and timing
# 2018-07

# date string
DATE=$(/bin/date "+%Y-%m-%d %H:%M:%S")
# logfile location and creation if necessary
logFile="$HOME/test.log"
if [ ! -f "$logFile" ];
then
/usr/bin/touch "${logFile}"
fi

function echo_log {
/bin/echo "$DATE" " $1" >> "${logFile}"
}
# 
# start chrono
startChrono=$(/bin/date '+%s')

###
# This is the main part of the script, to be modified
# Do stuff:
echo_log "This is a test 2"
ls /Applications
sleep 3
echo_log " line 3"
# end of main part of the script
###

# stop chrono, calculate the difference and log it
stopChrono=$(/bin/date '+%s')
timeElapsed=$(($stopChrono-$startChrono))
echo_log "This script took $timeElapsed seconds to run."

# we can also log to the system log with:
logger -t "script" "This script ran fine"


exit 0