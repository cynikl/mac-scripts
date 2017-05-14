#!/bin/bash
# this is an example of a script that runs a query then fills the custom field with the result.
# change the key from "SSD" to custom_string_01/ the string name used.
# based on Tony Wheeler and Guillaume Gete on slack macadmin

#query
# this checks for the presence of an SSD, returns Yes/No
var=/usr/sbin/diskutil info disk0 | grep "Solid State" | awk '{print $3}'

#fills the Custom Field with that value
/usr/local/sbin/FileWave.app/Contents/MacOS/fwcld -custom_write -key "SSD" -value "$var"
