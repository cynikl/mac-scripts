#!/bin/bash
# Disable local TimeMachine snapshots 
# They are off by default on desktop computers, but on on laptops.
# to get them back on: tmutil enablelocal
# Cyril Niklaus
tmutil disablelocal