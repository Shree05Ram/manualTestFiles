#!/bin/sh
mount -o rw,remount /system
rm -rf /data/aikaan_agent_install_dir/aikaan && rm -rf /etc/init/*aikaan* && rm -rf /system/bin/run_agent.sh
reboot
