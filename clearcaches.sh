#!/bin/bash
# this script will clear the ~/Library/Caches folder of all users.

over500=`dscl /LDAPv3/127.0.0.1 list /Users UniqueID | awk '$2 > 500 { print $1 }'`
for i in $over500
do
    cd /Users/$i/Library/
if [ -d /Users/$i/Library/Saved\ Application\ State ]; then
    echo $i
    #/bin/rm -R /Users/$i/Library/Caches/*
    fi

done