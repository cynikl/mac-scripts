#!/bin/bash
# Battery Cycle counts EA
echo "<result>$(ioreg -r -c "AppleSmartBattery" | grep -w "CycleCount" | awk '{print $3}' | sed s/\"//g)</result>"
