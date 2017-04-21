#!/bin/bash
# setwebproxy.sh
# 2016-07-15
# Cyril Niklaus ART Computer
# [-setwebproxy networkservice domain portnumber authenticated username password]
# ne marche pas car les infos sont stockées dans le keychain du logged-in user.
networksetup -setwebproxy "Ethernet" "proxy.opti.morges" "3128" "on" "user" "password"
networksetup -setwebproxystate Ethernet on
networksetup -setsecurewebproxy Ethernet proxy.opti.morges 3128 on
networksetup -setsecurewebproxystate Ethernet on

# ça, ça fonctionne 
# networksetup -setwebproxystate Ethernet off
# networksetup -setsecurewebproxystate Ethernet off
# networksetup -setproxyautodiscovery Ethernet off
#
#Commande utilisée via ARD pour revenir en arrière, salle 228
#networksetup -setwebproxystate Ethernet off; networksetup -setsecurewebproxystate Ethernet off; networksetup -setproxyautodiscovery Ethernet on

#networksetup -setairportpower airport off
networksetup -setairportpower en1 off

exit 0
 