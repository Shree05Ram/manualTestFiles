#!/bin/bash

<<'MultiLine Comment'
cc continuous.c -o brokenPro
/home/pi/manualTestFiles/processTestFiles/brokenPro
sleep 120s
sudo ip link set wlan0 down
sleep 900s
sudo ip link set wlan0 up
sleep 900s
MultiLine Comment

time="$1"
value="$2"
echo "$time -> $value" >> continuous.log
