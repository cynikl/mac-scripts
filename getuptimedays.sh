#!/bin/bash
# uptime in days, from somewhere, via Emily Kausalik

getDays=`ps -p 1 -o etime | grep "-" | cut -d "-" -f 1`

if [[ "$getDays" == "" ]]
then
        theDays="0 days"
else
        theDays="$getDays days"
fi

echo "<result>"$theDays"</result>"

exit 0
