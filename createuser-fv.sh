#!/bin/sh
# Cyril Niklaus
# This script uses a series of dialog boxes to create a standard user account.

usernamePrompt(){
osascript << 'EOT'
    tell application "System Events"
        with timeout of 60 seconds
            text returned of (display dialog "Veuillez saisir le nom complet de l'utilisateur à créer" default answer "Prénom Nom" buttons {"OK", "Annuler"} default button 1 cancel button 2 with title "Saisie du nom de l'utilisateur" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:UserIcon.icns")
        end timeout
    end tell
EOT
}

shortUsernamePrompt(){
osascript << 'EOT'
    tell application "System Events"
        with timeout of 60 seconds
            text returned of (display dialog "Veuillez saisir le nom court de l'utilisateur à créer" default answer "prenomnom" buttons {"OK"} default button 1 with title "Saisie du nom court de l'utilisateur" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:UserIcon.icns")
        end timeout
    end tell
EOT
}


passwordPrompt(){
osascript << 'EOT'
    tell application "System Events"
        with timeout of 60 seconds
            text returned of (display dialog "Veuillez saisir le mot de passe" default answer "Mot de passe" with hidden answer buttons {"OK"} default button 1 with title "Saisie du mot de passe" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:LockedIcon.icns")
        end timeout
    end tell
EOT
}

validatepasswordPrompt(){
osascript << 'EOT'
    tell application "System Events"
        with timeout of 60 seconds
            text returned of (display dialog "Veuillez valider le mot de passe" default answer "Mot de passe" with hidden answer buttons {"OK"} default button 1 with title "Saisie du mot de passe" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:LockedIcon.icns")
        end timeout
    end tell
EOT
}

username="$(usernamePrompt)"
shortusername="$(shortUsernamePrompt)"
password="$(passwordPrompt)"
validatepassword="$(validatepasswordPrompt)"



if [[ $password != $validatepassword ]] ; then
    echo "Les mots de passe ne correspondent pas."
    # erreur si on garde le dialogue.
    # osascript << 'EOT'
    #     tell application "System Events"
    #         with timeout of 60 seconds
    #             display dialog "Utilisateur pas créé" buttons {"OK"} default button 1 with title "Utilisateur créé" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:UserIcon.icns"
    #         end timeout
    #     end tell
    # EOT

    exit 1;
fi



#
getNextAvailableUserUid(){
    local MAXID=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
    echo $((MAXID+1))
}

userid=$(getNextAvailableUserUid)


dscl . -create /Users/$shortusername
dscl . -create /Users/$shortusername UserShell /bin/bash
dscl . -create /Users/$shortusername RealName "$username"
dscl . -create /Users/$shortusername UniqueID "$userid"
dscl . -create /Users/$shortusername PrimaryGroupID 20
dscl . -create /Users/$shortusername NFSHomeDirectory /Users/$shortusername
dscl . -passwd /Users/$shortusername $password

createhomedir -c -u $shortusername

# pause avant d'enlever le keychain problématique
sleep 10

# remove le keychain
rm /Users/$shortusername/Library/Keychains/*

# Dialogue de fin
osascript << 'EOT'
    tell application "System Events"
        with timeout of 60 seconds
            display dialog "Utilisateur créé"  buttons {"OK"} default button 1 with title "Utilisateur créé" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:UserIcon.icns"
        end timeout
    end tell
EOT

# # create the FileVault plist file:
# ne marche pas en 10.12

# echo '<?xml version="1.0" encoding="UTF-8"?>
# <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
# <plist version="1.0">
# <dict>
# <key>Username</key>
# <string>'$4'</string>
# <key>Password</key>
# <string>'$5'</string>
# <key>AdditionalUsers</key>
# <array>
# <dict>
# <key>Username</key>
# <string>'$username'</string>
# <key>Password</key>
# <string>'$password'</string>
# </dict>
# </array>
# </dict>
# </plist>' > /tmp/fvenable.plist
#
# # now add user to FileVault
# sudo fdesetup add -i < /tmp/fvenable.plist
#
# # remove fvenable.plist
# rm /tmp/fvenable.plist

exit 0
