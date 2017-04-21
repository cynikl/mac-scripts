#!/bin/sh
# Cyril Niklaus, 2016-06-22 based on 
# Patrick Gallagher
# http://www.macadmincorner.com
# Updated 12/11/2009
 
#First let's change the DNS settings
echo "Modifions les réglages DNS pour commencer"
networksetup -setdnsservers Ethernet 10.224.230.23 145.232.253.10 193.192.227.3 
networksetup -setsearchdomains Ethernet peda.lan

sleep 10

# These variables need to be configured for your env
odAdmin="diradmin" #enter your OD admin name between the quotes
odPassword="sydney2"  # Enter your OD admin password between the quotes
domain="gap5.peda.lan" # FQDN of your OD domain
oldDomain="GAP3.ch" # If moving from another OD, enter that FQDN here
oldODip="10.224.230.16" # Enter the IP of your old OD

check4OD=`dscl localhost -list /LDAPv3`

 
# Check if on OD already by IP or FQDN, add if not.
if [ "${check4OD}" == "${domain}" ]; then
	echo "Ce mac est déjà lié à ${domain}."
	odSearchPath=`defaults read /Library/Preferences/DirectoryService/SearchNodeConfig "Search Node Custom Path Array" | grep $domain`
	if [ "${odSearchPath}" = "" ]; then
		echo "$domain n'est pas dans le chemin de recherche, ajoutons-le."
		dscl /Search -append / CSPSearchPath /LDAPv3/$domain
		sleep 10
	fi
else if [ "${check4OD}" == "${oldDomain}" ]; then
	echo "On l'enlève de ${oldDomain}"
	dsconfigldap -r "${oldDomain}"
	dscl /Search -delete / CSPSearchPath /LDAPv3/"${oldDomain}"
	dscl /Search/Contacts -delete / CSPSearchPath /LDAPv3/"${oldDomain}"
	echo "Lions-le à $domain"
	dsconfigldap -v -a $domain -n $domain
	dscl /Search -create / SearchPolicy CSPSearchPath
	killall DirectoryService
else if [ "${check4OD}" == "${oldODip}" ]; then
	echo "On l'enlève de ${oldODip}"
		dsconfigldap -r "${oldODip}"
		dscl /Search -delete / CSPSearchPath /LDAPv3/"${oldODip}"
		dscl /Search/Contacts -delete / CSPSearchPath /LDAPv3/"${oldODip}"
		echo "Lions-le à $domain"
		dsconfigldap -v -a $domain -n $domain
		dscl /Search -create / SearchPolicy CSPSearchPath
		killall DirectoryService
else
	echo " Pas de serveurs OD trouvé, lions-le à $domain"
	dsconfigldap -v -a $domain -n $domain
	dscl /Search -create / SearchPolicy CSPSearchPath
	sleep 10
	dscl /Search -append / CSPSearchPath /LDAPV3/$domain
	echo "Killing DirectoryService"
	killall DirectoryService
	fi
fi
fi	
 
echo "Terminé."
shutdown -r now
exit 0