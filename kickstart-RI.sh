#!/bin/bash
# kickstart ARD for RI user
#
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -users ri -privs -all -restart -agent -menu
exit 0