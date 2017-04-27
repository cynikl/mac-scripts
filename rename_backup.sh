#!/bin/bash
# 2016-07-22 Cyril Niklaus
# petit script pour renommer le dmg de sauvegarde
DATE=$(date +"%Y-%m-%d")
mv /Volumes/Clone_app/System.dmg /Volumes/Clone_app/System_files-$DATE.dmg
exit 0

