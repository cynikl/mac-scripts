#!/bin/bash
# to reset permissions

userList=/tmp/$(uuidgen)

ls > $userList

while read line; do

	chown -R $line ./$line

done < $userList

rm $userList
