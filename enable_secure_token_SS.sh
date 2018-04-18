adminUser="$4"
adminPassword="$5"
userName="$3"
userPassword=$(/usr/bin/osascript <<EOT
tell application "System Events"
activate
display dialog "Please enter your login password:" default answer "" buttons {"Continue"} default button 1 with hidden answer
if button returned of result is "Continue" then
set pwd to text returned of result
return pwd
end if
end tell
EOT)

sudo sysadminctl -adminUser $adminUser -adminPassword $adminPassword -secureTokenOn $userName -password $userPassword