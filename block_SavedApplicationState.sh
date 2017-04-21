#!/bin/sh
# this script will clear the ~/Saved Application State folder of all users OPTI Bussigny.

over500=`dscl /LDAPv3/127.0.0.1 list /Users UniqueID | awk '$2 > 500 { print $1 }'`
for i in $over500
do
    cd /Volumes/RAID/HDEleve/DoEleves/$i/Library/
if [ -d /Volumes/RAID/HDEleve/DoEleves/$i/Library/Saved\ Application\ State ]; then
    #echo $i
    /bin/rm -Rf /Volumes/RAID/HDEleve/DoEleves/$i/Library/Saved\ Application\ State/*
    chflags 1600017 /Volumes/RAID/HDEleve/DoEleves/$i/Library/Saved\ Application\ State/

    fi

done