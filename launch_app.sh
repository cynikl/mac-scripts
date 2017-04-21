#!/bin/bash

###
#
#            Name:  launch_app.sh
#     Description:  Launches an app using the logged-in user context. Requires
#                   the app name to be specified in parameter 4.
#                   Example: "Box Sync"
#
#                   WARNING: Although the "asuser" verb still works in 10.11,
#                   it is deprecated and its replacement verb, "bootstrap" does
#                   not support running one-liner scripts in user context.
#
#          Author:  Elliot Jordan <elliot@lindegroup.com>
#         Created:  2015-02-10
#   Last Modified:  2016-08-30
#         Version:  2.0.2
#
###

# Make sure parameter 4 is specified.
if [[ -z $4 ]]; then
    echo "[ERROR] No app specified in parameter 4."
    exit 1001
fi

# Make sure app exists.
if [[ ! -d "/Applications/$4.app" ]]; then
    echo "[ERROR] /Applications/$4.app does not exist."
    exit 1002
fi

# Get current user and OS information.
CURRENT_USER=$(/usr/bin/stat -f%Su /dev/console)
USER_ID=$(id -u "$CURRENT_USER")
OS_MAJOR=$(/usr/bin/sw_vers -productVersion | awk -F . '{print $1}')
OS_MINOR=$(/usr/bin/sw_vers -productVersion | awk -F . '{print $2}')

# Launch the app using launchctl.
echo "Launching $4..."
if [[ "$OS_MAJOR" -eq 10 && "$OS_MINOR" -le 9 ]]; then
    LOGINWINDOW_PID=$(pgrep -x -u "$USER_ID" loginwindow)
    launchctl bsexec "$LOGINWINDOW_PID" open "/Applications/$4.app"
elif [[ "$OS_MAJOR" -eq 10 && "$OS_MINOR" -gt 9 ]]; then
    launchctl asuser "$USER_ID" open "/Applications/$4.app"
else
    echo "[ERROR] macOS $OS_MAJOR.$OS_MINOR is not supported."
    exit 1004
fi

exit 0
