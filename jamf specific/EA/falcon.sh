#!/bin/bash
#########################################################################################
# A script to collect the version of the CrowdStrike Falcon Sensor currently installed.  #
# If CrowdStrike Falcon is not installed "Not Installed" will return back               #
#########################################################################################
RESULT="Not Installed"

if [ -f "/Library/CS/falconctl" ] ; then
    RESULT=$( sysctl cs.version | awk '{print $2}' )
fi

echo "<result>$RESULT</result>"
