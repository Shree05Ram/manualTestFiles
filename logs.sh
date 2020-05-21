#!/bin/bash
while [ 1 ];
do
	echo 'This is a log @' `date` >> /home/pi/manualTestFiles/manuaLogs.txt
        sleep 5s	
done;
