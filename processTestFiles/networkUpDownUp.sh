#!/bin/bash
cc 15Sec.c -o NetOff
/home/pi/manualTestFiles/processTestFiles/NetOff
sudo ip link set wlan0 down
sleep 900s
sudo ip link set wlan0 up
/home/pi/manualTestFiles/processTestFiles/NetOff
sudo killall NetOff
