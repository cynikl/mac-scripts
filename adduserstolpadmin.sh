#!/bin/bash
# adding every user to the lpadmin group so that standard users can print too
# Cyril Niklaus 2017-02-03

dseditgroup -o edit -t group -a everyone _lpadmin
exit 0