#!/bin/bash
# recommended Apple way of getting the logged-in user
# <https://developer.apple.com/library/content/qa/qa1133/_index.html>

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
