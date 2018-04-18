#!/bin/bash

touch "$DS_LAST_RESTORED_VOLUME"/private/var/db/.RunLanguageChooserToo
rm -f "$DS_LAST_RESTORED_VOLUME"/private/var/log/CDIS.custom

exit 0