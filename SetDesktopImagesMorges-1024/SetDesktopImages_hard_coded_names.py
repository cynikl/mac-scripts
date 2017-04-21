#!/usr/bin/python
 
from AppKit import NSWorkspace, NSScreen
from Foundation import NSURL
import getpass

network_user_path = "/Library/Desktop Pictures/network.jpg"
ladmin_path = "/Library/Desktop Pictures/ladmin.jpg"
luser_path = "/Library/Desktop Pictures/luser.jpg"

# generate a fileURL
nu_file_url = NSURL.fileURLWithPath_(network_user_path)
la_file_url = NSURL.fileURLWithPath_(ladmin_path)
lu_file_url = NSURL.fileURLWithPath_(luser_path)
 
username=getpass.getuser()
options = {}
ws = NSWorkspace.sharedWorkspace()

# next I should try and not hard code the user name but rather
# check if she's local admin etc with dseditgroup -o checkmember -m $??? admin
# have to use subprocess.check_output I guess.
if username == 'opti':
	for screen in NSScreen.screens():
		(result, error) = ws.setDesktopImageURL_forScreen_options_error_(
			lu_file_url, screen, options, None)
elif username == 'ri':
	for screen in NSScreen.screens():
		(result, error) = ws.setDesktopImageURL_forScreen_options_error_(
			la_file_url, screen, options, None)
elif username == 'eleve':
	for screen in NSScreen.screens():
		(result, error) = ws.setDesktopImageURL_forScreen_options_error_(
			lu_file_url, screen, options, None)
else:
	for screen in NSScreen.screens():
		(result, error) = ws.setDesktopImageURL_forScreen_options_error_(
			nu_file_url, screen, options, None)
