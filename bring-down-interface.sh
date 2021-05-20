#!/bin/bash
ip link set wlan0 down
sleep 60s
ip link set wlan0 up

#########################
##For android device###

##/system/bin/ifconfig usb0 down
##sleep 30s
##/system/bin/ifconfig usb0 up
