#!/bin/bash
cc brokenPro.c -o brokenProBin
I=1
while [ $I -le 5 ]
do
	echo $I | ./brokenProBin
	I=$(( $I + 1 ))
	sleep 120s

done
