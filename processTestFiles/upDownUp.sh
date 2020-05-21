#!/bin/bash
cc 45min.c -o intOff
/home/pi/manualTestFiles/processTestFiles/intOff &
sleep 900s
sudo ip link set wlan0 down
sleep 900s
sudo ip link set wlan0 up
sleep 900s
