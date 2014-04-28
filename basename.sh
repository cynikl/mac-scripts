#!/bin/sh
# basename.sh
# Based on an idea cribbed from Todd Kitchen via the MacEnterprise mailing list
# https://discussions.apple.com/message/22391604#22391604
# change an OS X client host name.
if [ -z "$1" ]
then
    echo "Changes an OS X client host name."
    echo "Usage: sudo `basename $0` hostname"
    exit $E_WRONGARGS
fi
scutil --set ComputerName $1
scutil --set HostName $1
scutil --set LocalHostName $1