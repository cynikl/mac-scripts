#!/usr/bin/python
 
'''Based on https://gist.github.com/gregneagle/6957826#file-gistfile1-py
modified to use only one image.
Uses Cocoa classes via PyObjC to set a random desktop picture on all screens.
Tested on Mountain Lion and Mavericks.
 
See:
https://developer.apple.com/library/mac/documentation/cocoa/reference/applicationkit/classes/NSWorkspace_Class/Reference/Reference.html
 
https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/Reference/Reference.html
 
https://developer.apple.com/library/mac/documentation/cocoa/reference/applicationkit/classes/NSScreen_Class/Reference/Reference.html
'''
 
 
from AppKit import NSWorkspace, NSScreen
from Foundation import NSURL
 
picture_path = "/Library/Desktop Pictures/Isles.jpg"

# generate a fileURL
file_url = NSURL.fileURLWithPath_(picture_path)

# make image options dictionary
# we just make an empty one because the defaults are fine
options = {}
 
# get shared workspace
ws = NSWorkspace.sharedWorkspace()
 
# iterate over all screens
# this does not work though, it only changes it in the active Desktop.
for screen in NSScreen.screens():
    # tell the workspace to set the desktop picture
    (result, error) = ws.setDesktopImageURL_forScreen_options_error_(
                file_url, screen, options, None)