#!/bin/sh
# cyril.niklaus@artcomputer.ch 2015-10-01

# change the path to point to the correct directory
# There is no provision for the Shared folder if any present.
# If necessary, uncomment the if-fi statement to deal with it.

for USER_HOME in /Volumes/RAID/ADMIN/HomesEleves/*
do
USER_UID=`basename "${USER_HOME}"`
# if [ ! "${USER_UID}" = "Shared" ]; then
# Removing cache files from users' ~/Library/Caches
if [ -d "${USER_HOME}"/Library/Caches ]; then
rm -rf "${USER_HOME}"/Library/Caches/*
fi
if [ -d "${USER_HOME}"/Library/Safari ]; then
rm -rf "${USER_HOME}"/Library/Safari/LocalStorage/
fi
if [ -d "${USER_HOME}"/Library/Logs ]; then
rm -rf "${USER_HOME}"/Library/Logs/*
fi
#fi 
done