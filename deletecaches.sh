#!/bin/sh
# cyril.niklaus@artcomputer.ch 2015-10-01, 2015-12-19

# change the path to point to the correct directory

for USER_HOME in /Volumes/RAID/HDEleve/DoEleves/*
  do
        USER_UID=`basename "${USER_HOME}"`
     if [ ! "${USER_UID}" = "Shared" ]; then
    
       if [ -d "${USER_HOME}"/Library/Caches ]; then
    rm -rf "${USER_HOME}"/Library/Caches/*
       fi
      if [ -d "${USER_HOME}"/Library/Safari ]; then
    rm -rf "${USER_HOME}"/Library/Safari/LocalStorage/
      fi
      if [ -d "${USER_HOME}"/Library/Logs ]; then
    rm -rf "${USER_HOME}"/Library/Logs/*
      fi
      if [ -d "${USER_HOME}"/Library/Saved\ Application\ State ]; then
    rm -rf "${USER_HOME}"/Library/Saved\ Application\ State/*
    # not convinced the 1600017 flags are OK, let's try with immutable first.
    chflags uchg "${USER_HOME}"/Library/Saved\ Application\ State/
      fi
    fi  
done
