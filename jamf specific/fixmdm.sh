#!/bin/bash
# Cyril Niklaus
# This script will remove and add again the MDM profile
# fix for MDM capability:no, but the APNS ports have to be open 
# built with the new binary path, after 9.8

# remove the profile
/usr/local/jamf/bin/jamf removeMdmProfile
# request a new one
/usr/local/jamf/bin/jamf mdm
# enforces management
/usr/local/jamf/bin/jamf manage
