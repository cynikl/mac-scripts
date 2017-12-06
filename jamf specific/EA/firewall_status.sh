#!/bin/sh
# Firewall status check EA

result=`/usr/bin/defaults read /Library/Preferences/com.apple.alf globalstate`
if [ "$result" == "0" ]; then
	echo "<result>Off</result>"
else
	echo "<result>On</result>"
fi
