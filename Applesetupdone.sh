#!/bin/bash
# Applesetupdone.sh
# cyril.niklaus@gmail.com
# In order to get rid of the assistant when Deploying images done with AutoDMG,
# it makes more sense to use that functionnality in DSS.
# v 0.2 2014-04-29 Added .SetupRegComplete and permissions

touch /var/db/.AppleSetupDone
chmown root:wheel /var/db/.Applesetupdone
chmod 600 /var/db/.Applesetupdone

touch /Library/Receipts/.SetupRegComplete
chown root:wheel /Library/Receipts/.SetupRegComplete
chmod	400 /Library/Receipts/.SetupRegComplete