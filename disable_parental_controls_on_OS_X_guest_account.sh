#!/bin/bash

# By default, OS X's Guest account will have Parental Controls
# management applied to it, even if Parental Controls is not 
# configured. The command below will disable the Parental Controls
# management for the Guest account.
# https://github.com/rtrouton/rtrouton_scripts/blob/master/rtrouton_scripts/disable_parental_controls_on_OS_X_guest_account/disable_parental_controls_on_OS_X_guest_account.sh

/usr/bin/dscl . -mcxdelete /Users/Guest
exit 0
