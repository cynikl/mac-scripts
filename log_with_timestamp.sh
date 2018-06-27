#!/bin/bash
# log date format
DATE='date +%Y-%m-%d_%H:%M:%S'
# log file
LOG='/Users/cyril/setidentity.log'

function echo_log {
	echo `$DATE`" $1" >> $LOG
}
# start
echo_log "This is the start."

exit 0