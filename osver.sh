#!/bin/bash

# Determine OS version
# Rich Trouton I think.
OSVERS=$(sw_vers -productVersion | awk -F. '{print $2}')

if [[ ${OSVERS} -lt 6 ]]; then
  echo "ERROR: The version of OS X running on this Mac is not supported by this script."
fi

if [[ ${OSVERS} -eq 6 ]]; then
  echo "I'm running 10.6!"
fi

if [[ ${OSVERS} -eq 7 ]]; then
  echo "I'm running 10.7!"
fi

if [[ ${OSVERS} -eq 8 ]]; then
  echo "I'm running 10.8!"
fi

if [[ ${OSVERS} -eq 9 ]]; then
  echo "I'm running 10.9!"
fi

if [[ ${OSVERS} -gt 9 ]]; then
  echo "I'm running 10.10!"
fi

if [[ ${OSVERS} -eq 10 ]]; then
  echo "I'm running 10.10!"
fi

exit 0