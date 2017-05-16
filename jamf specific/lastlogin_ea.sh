#!/bin/bash
# extension attribute to get the last login
lastlogin =$(last -1 -t console |grep -v _ | awk '{ print $1" "$3" "$4" "$5" "$6}')
echo "<result>$lastUser</result>"
