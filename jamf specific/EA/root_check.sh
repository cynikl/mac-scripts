#!/usr/bin/env bash
# root enabled or disabled EA
if [[ $(dscl . read /users/root Password | awk '{print $2}') = '********' ]]; then
  if dscl . authonly root '' &>/dev/null; then
    RESULT="Root Enabled - No Password"
  else
    RESULT="Root Enabled - With Password"
  fi
else
  RESULT="Root Disabled"
fi

echo "<result>$RESULT</result>"
