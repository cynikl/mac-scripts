#!/bin/bash

######################################################################
#
#   Product name:   Foomatic PPD modifier for Yosemite
#        version:   1.1  2014-10-28
#
#   Copyright 2014  Matt Broughton <walterwego@macosx.com>
#
#   This program is freed software; you can redistribute it and/or modify it
#   under the terms of the GNU General Public License as published by the Free
#   Software Foundation; either version 2 of the License, or (at your option)
#   any later version.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
#   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#   for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
#
######################################################################
#
printf "\nOS X 10.10 (Yosemite) introduced extra sandboxing.  This caused\nprinters using the foomatic-rip and ghostscript packages from\nOpenPrinting to fail. This script will amend the PPDs of\ncurrent printers that use foomatic-rip so they will work.\n"
printf "\nThe changes made will only work on some of the packages from\nOpenPrinting. It is believed that the following users of the\nfollowing packages will be able to print after applying this\npatch:\nhpijs\t\tmin12xxw\npxlmono/pxlcolor (Ricoh, Lanier, NRG and others)\nsamsung-gdi\tpnm2ppa\n"
printf "\nYou need to run this script from an administrator's account\nand you will be prompted to enter your password to make the changes.\nPLEASE NOTE THAT NOTHING WILL APPEAR ON THE SCREEN\nAS YOU ENTER YOUR PASSWORD.\n"
printf "\nThis script is distributed in the hope that it will be useful,\nbut WITHOUT ANY WARRANTY; without even the implied warranty\nof MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n\n" 

############################################################
## ++Modify Tyler's routine for getting printer queues. ++

# scan for existing queues...
#
# we want only the queue name so strip the leading directories
# and the .ppd suffix...
# we're using only `awk' here instead of `grep',`dirname', and `basename'
# because awk should ALWAYS be available on OS X while the others may not


# set the CUPS ppd directory variable

CUPS_PPD_DIR="/etc/cups/ppd/"

## awk cannot handle an escaped \+ (plus sign), \t (tab), or \* (asterick)
## so use . (any character) or define the character to use
## in the regexp

TAB=`printf "\t"`
STAR=`printf "\*"`

QUEUE_KEY_1=${STAR}cupsFilter\:${TAB}\"application.vnd.cups-pdf\ 0\ foomatic-rip\"
QUEUE_KEY_2=${STAR}"FoomaticRIPCommandLine"
# scan for existing foomatic-rip queues...
#
# we want only the queue name so strip the leading directories and the .ppd suffix...

QUEUE=( `awk "/${QUEUE_KEY_1}/||/${QUEUE_KEY_2}/ {print FILENAME;nextfile;}" ${CUPS_PPD_DIR}* | awk '{n=split($0,a,"/"); split(a[n],b,".ppd");print b[1];}'` )
## ++End of Tyler's routine for getting printer queues. ++
############################################################
#set -x
if [ ${#QUEUE[@]} -eq 0 ]; then
	printf "\nNo printers match the modification criteria.\n"
fi

anyMods="no"
if [ ${#QUEUE[@]} -gt 0 ]; then
	for NAME in ${QUEUE[@]} ; do
	echo The printer queue $NAME should be modified.
	read -p "Do you want to continue? (y,n)  " continued

	if [[ "$continued" != [yY] ]]; then
		printf "No action will be taken for printer ${NAME}.\n\n\n"
		
	else
		printf "Please enter you administrator's password if prompted.\n"
		sleep 3
		sudo echo
		sudo sed -e '/^\*NickName/s/recommended/Yosemite Modified/g' \
-e '/^\*FoomaticRIPCommandLine/s/\"gs /\"\/usr\/local\/bin\/gs /g'  \
-e '/FoomaticRIPCommandLine/,/^\*End/s/sIjsServer=hpijs/sIjsServer=\/usr\/local\/bin\/hpijs/g' \
-e  '/^\*FoomaticRIPCommandLine/,/^\*End/s/(gs /(\/usr\/local\/bin\/gs /g' \
-e  '/^\*FoomaticRIPCommandLine/,/^\*End/s/ min12xxw/ \/usr\/local\/bin\/min12xxw/g' \
-e  '/^\*FoomaticRIPCommandLine/,/^\*End/s/ pnm2ppa/ \/usr\/local\/bin\/pnm2ppa/g' ${CUPS_PPD_DIR}${NAME}.ppd > /private/tmp/xx${NAME}.ppd
		sudo /bin/mv /private/tmp/xx${NAME}.ppd ${CUPS_PPD_DIR}${NAME}.ppd
		sudo chown root:_lp ${CUPS_PPD_DIR}${NAME}.ppd
		sudo chmod 644 ${CUPS_PPD_DIR}${NAME}.ppd
		anyMods="yes"
	fi

done
	






fi
if [ ${anyMods} = "yes" ]; then
#
##########################
# Check the Mac OS version
MACOS_VERSION_FILE=/System/Library/CoreServices/SystemVersion.plist

MACOS_VERSION=$(awk '/ProductVersion/ {while (RLENGTH<4) {match($0,"[0-9]+([.][0-9]+)*");x=substr($0,RSTART,RLENGTH);getline;};print x;}' "${MACOS_VERSION_FILE}")

MAJOR_VERSION=$(echo ${MACOS_VERSION}|awk '{split($0,a,".");print a[1];nextfile;}')
MINOR_VERSION=$(echo ${MACOS_VERSION}|awk '{split($0,a,".");print a[2];nextfile;}')
MICRO_VERSION=$(echo ${MACOS_VERSION}|awk '{split($0,a,".");print a[3];nextfile;}')

if [ 10 -eq ${MAJOR_VERSION:-10} -a 5 -le ${MINOR_VERSION} ] ; then
 ## Restart CUPS
 	sudo chown root:_lp ${CUPS_PPD_DIR}${NAME}.ppd
	sudo launchctl unload /System/Library/LaunchDaemons/org.cups.cupsd.plist
	sudo launchctl load /System/Library/LaunchDaemons/org.cups.cupsd.plist
	echo Restarting CUPS.
elif  [ 10 -eq ${MAJOR_VERSION:-10} -a 4 -ge ${MINOR_VERSION} ] ; then ## OS X 10.3.x or OS X 10.4.x
## Restart printing services
	sudo chown root:lp ${CUPS_PPD_DIR}${NAME}.ppd
	sudo /System/Library/StartupItems/PrintingServices/PrintingServices stop
	sleep 1
	sudo /System/Library/StartupItems/PrintingServices/PrintingServices start
fi

fi

