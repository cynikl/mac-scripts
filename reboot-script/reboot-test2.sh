#!/bin/bash 
rTime="2"
#shutdown -r +$rTime
/usr/bin/osascript <<-END
set rTime2 to "$rTime"
set endTime to ((current date) + (rTime2 as integer)* 60)
repeat until (endTime = (current date))
	set whatsLeft to ((endTime - (current date)) as number)
	if whatsLeft > 60 then
		set whatsLeft to (whatsLeft / 60)
		display dialog ((whatsLeft as integer) as string) & " minutes left before the computer will reboot. Please save your work. 
L'ordinateur va redémarrer dans " & ((whatsLeft as integer) as string) & " minutes. Enregistrez vos documents ouverts, s'il vous plaît. " giving up after 60 buttons {"Refresh"} default button 1
	else
		display dialog ((whatsLeft as integer) as string) & " seconds left before the computer will reboot. Please save your work. 
L'ordinateur va redémarrer dans " & ((whatsLeft as integer) as string) & " secondes. Enregistrez vos documents ouverts, s'il vous plaît. " giving up after 30 buttons {"Refresh"} default button 1
	end if
end repeat
END