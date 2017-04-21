#!/bin/bash


# simple scripts to get rid of printers


for eachPath in `/usr/bin/find /Users/* -maxdepth 0`

do

homeown=`echo $eachPath | cut -d/ -f3`

#echo `ls -la /Users/$homeown/Library/Printers/`
rm -rf /Users/$homeown/Library/Printers/*
done

exit 0