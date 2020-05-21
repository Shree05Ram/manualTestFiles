#!/bin/bash
./proStop &
sleep 40s
sudo killall -9 proStop
./proStop

#sudo ip link set wlan0 down
#sleep 10s
#sudo ip link set wlan0 up
#/home/pi/manualTestFiles/processTestFiles/flaky.out
