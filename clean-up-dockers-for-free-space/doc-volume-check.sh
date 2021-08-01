#!/bin/bash

DIR="/var/lib/docker/btrfs/subvolumes/"

ls $DIR | grep -v init > volume-without-init.txt

for volume in `cat volume-without-init.txt`
do
	echo  "$volume `cat $DIR/$volume/opt/aikaan/etc/aiagent_config.json`" >> volume-with-pro-and-dev-id.txt
done

for volume in `cat volume-with-pro-and-dev-id.txt| grep -v DeviceId`
do
	echo "$volume" >> volume-without-devId.txt
done

for volume in `cat volume-without-devId.txt | grep -v ProfileId`
do
	echo "$volume" >> volume-del.txt
done

for volume in `cat volume-del.txt`
do
	btrfs subvolume delete $DIR$volume
done
#rm -rf volume-*
