#!/bin/bash                                                                     

# CN 2015-12-03                                                                 
# small script to help flush the dead connections on the AFP server             
# simply turning it off and on again.
# /usr/local/restartAFP.sh                                           

/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin stop afp > /d\
ev/null 2>&1

# for some reason sleep 1m doesn't work
sleep 60s

/Applications/Server.app/Contents/ServerRoot/usr/sbin/serveradmin start afp > /\
dev/null 2>&1

exit 0