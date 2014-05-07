#!/bin/sh
# set the time zone
/usr/sbin/systemsetup -settimezone Europe/Zurich
/usr/sbin/systemsetup -setusingnetworktime on
/usr/sbin/systemsetup -setnetworktimeserver time.euro.apple.com

# update the time
/usr/sbin/ntpdate -bs time.euro.apple.com
exit 0