#!/bin/bash

# Determine OS version
# Rich Trouton I think, with added versions
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

if [[ ${OSVERS} -eq 10 ]]; then
  echo "I'm running 10.10!"
fi

if [[ ${OSVERS} -eq 11 ]]; then
  echo "I'm running 10.11!"
fi

if [[ ${OSVERS} -eq 12 ]]; then
  echo "I'm running 10.12!"
fi

if [[ ${OSVERS} -gt 12 ]]; then
  echo "I'm running 10.13!"
fi

if [[ ${OSVERS} -eq 13 ]]; then
  echo "I'm running 10.13!"
fi

exit 0