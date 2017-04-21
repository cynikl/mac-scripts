#!/usr/bin/python
# This script checks the user's membership to groups in order to set the Desktop Picture.

from AppKit import NSWorkspace, NSScreen
from Foundation import NSURL
import getpass
import subprocess

network_user_path = "/Library/Desktop Pictures/wallpaper_bleu_1280x800.jpg"
ladmin_path = "/Library/Desktop Pictures/wallpaper_brun_1280x800.jpg"
luser_path = "/Library/Desktop Pictures/wallpaper_vert_1280x800.jpg"

# generate a fileURL
nu_file_url = NSURL.fileURLWithPath_(network_user_path)
la_file_url = NSURL.fileURLWithPath_(ladmin_path)
lu_file_url = NSURL.fileURLWithPath_(luser_path)
 
username=getpass.getuser()
options = {}
ws = NSWorkspace.sharedWorkspace()

# not pretty, but it deals with the errors codes thrown by the second check_user even with the addition of the stderr=subprocess.STDOUT
def shell(command):
    try:
        output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    except Exception, e:
        output = str(e.output)
    finished = output.split('\n')
    for line in finished:
        return line
check_admin_user = shell("dseditgroup -o checkmember -n /LDAPv3/od.opti.morges -m "+username+" admin")
#check_admin_user = subprocess.check_output(
 #                                          ['dseditgroup', '-o' , 'checkmember', '-m', username, 'admin'],
  #                                         stderr=subprocess.STDOUT
   #                                        )
is_admin = check_admin_user[:3]
is_student=""
is_local=""
is_maitre=""
#print is_admin[:3]
if is_admin == "yes":
    #print "is_admin"
    for screen in NSScreen.screens():
		(result, error) = ws.setDesktopImageURL_forScreen_options_error_(
                                                                         la_file_url, screen, options, None
                                                                         )
else:
   # print "check student"
    check_student_user = shell("dseditgroup -o checkmember -n /LDAPv3/od.opti.morges -m "+username+" optieleves")
    is_student = check_student_user[:3]

if is_student == 'yes':
    #print "is student"
    for screen in NSScreen.screens():
        (result, error) = ws.setDesktopImageURL_forScreen_options_error_(
                                                                         nu_file_url, screen, options, None
                                                                         )
else:
   # print "check maitre"
    check_maitre_user = shell("dseditgroup -o checkmember -n /LDAPv3/od.opti.morges -m "+username+" optimaitres")
    is_maitre = check_maitre_user[:3]

if is_maitre == 'yes':
    #print "is student"
    for screen in NSScreen.screens():
        (result, error) = ws.setDesktopImageURL_forScreen_options_error_(
                                                                         nu_file_url, screen, options, None
                                                                         )
else:
    #print "check local"
    check_local_user = shell("dseditgroup -o checkmember -m "+username+" localaccounts")
    is_local = check_local_user[:3]

if is_local == 'yes':
        for screen in NSScreen.screens():
            (result, error) = ws.setDesktopImageURL_forScreen_options_error_(
                                                                         lu_file_url, screen, options, None
                                                                         )