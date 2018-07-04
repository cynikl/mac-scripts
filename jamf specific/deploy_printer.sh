#!/bin/bash

# script to deploy printers via the JPS using variables for portability
# note that options are not dealt with.
# 2018-07-04 Cyril Niklaus

# variables to set in the JPS
cupsqueue=${4} # -p
location=${5} # -L
displayname=${6} #-D
path=${7} # -v, needs to be the protocol and the IP, ie lpd://192.168.1.123
ppd=${8} #-P

#Path to the ppd files
ppdPath="/Library/Printers/PPDs/Contents/Resources"

lpadmin -p "$cupsqueue" -L "$location" -D "$displayname" -v "$path" -P "$ppdPath/$ppd" -o printer-is-shared="False" -E
echo Added "$displayname"
exit 0