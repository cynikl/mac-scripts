#!/bin/bash
# setwebproxy.sh
# 2016-07-15
# Cyril Niklaus
# [-setwebproxy networkservice domain portnumber authenticated username password]
# does not work woith ARD  as the credentials are in the logged-in user's keychain.
networksetup -setwebproxy "Ethernet" "proxy.opti.morges" "3128" "on" "user" "password"
networksetup -setwebproxystate Ethernet on
networksetup -setsecurewebproxy Ethernet proxy.opti.morges 3128 on
networksetup -setsecurewebproxystate Ethernet on

# this works
# networksetup -setwebproxystate Ethernet off
# networksetup -setsecurewebproxystate Ethernet off
# networksetup -setproxyautodiscovery Ethernet off
#
#Commande utilisée via ARD pour revenir en arrière, salle 228
#networksetup -setwebproxystate Ethernet off; networksetup -setsecurewebproxystate Ethernet off; networksetup -setproxyautodiscovery Ethernet on

#networksetup -setairportpower airport off
networksetup -setairportpower en1 off

exit 0
 