#!/bin/sh
# Cyril Niklaus
# To get the correct time zone name do a 
# sudo systemsetup -listtimezones

#Set your timezone and ntp server here
TimeZone="Europe/Zurich"
ntpServer="time.euro.apple.com"

# nothing to modify below this line
# set the time zone
/usr/sbin/systemsetup -settimezone $TimeZone
/usr/sbin/systemsetup -setusingnetworktime on
/usr/sbin/systemsetup -setnetworktimeserver $ntpServer

# update the time
/usr/sbin/ntpdate -bs time.euro.apple.com
exit 0
