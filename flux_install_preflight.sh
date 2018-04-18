#!/bin/bash
## preinstall

pathToScript=$0
pathToPackage=$1
targetLocation=$2
targetVolume=$3

if [ -d "/Applications/Flux.app" ] ; then
	echo "Flux is here!"
	#rm -rf /Applications/Flux.app
else
	echo "Flux is not present"
fi





exit 0		## Success
exit 1		## Failure
