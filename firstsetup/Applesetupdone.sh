#!/bin/bash
# Applesetupdone.sh
# cyril.niklaus
# In order to get rid of the assistant when Deploying images done with AutoDMG,
# it makes more sense to use that functionnality in DSS.
# v 0.2 2014-04-29 Added permissions

touch /var/db/.AppleSetupDone
chmown root:wheel /var/db/.Applesetupdone
chmod 600 /var/db/.Applesetupdone
