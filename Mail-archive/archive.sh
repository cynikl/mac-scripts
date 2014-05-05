#!/bin/bash
# archive.sh
# To archive Mail.app mail in the inbox. I should probably do an AppleScript here…
# here is the AppleScript part http://support.indev.ca/kb/mao-advanced-techniques/applescript-to-archive-old-messages-in-current-mailbox
osascript << 'END'
set DestinFolderName to "Archive" -- mailbox to move messages to. If the account of a specific message does not have such a mailbox, no action will occur.

set ArchiveDate to (current date) - (30 * days)

tell application "Mail"
    set msgs to every message of message viewer 1 whose date received is less than ArchiveDate
    repeat with aMsg in msgs
        set acct to account of mailbox of aMsg
        
        -- see if the account of the message has an archive mailbox
        if name of every mailbox of acct contains DestinFolderName then
            -- if so, archive the message
            set archiveFolder to mailbox DestinFolderName of acct
            move aMsg to archiveFolder
        end if
    end repeat
end tell
END
exit 0