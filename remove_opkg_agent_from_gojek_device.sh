mount -o rw,remount /system
rm -f /system/priv-app/aikaan/* && rm -rf /data/aikaan && rm -f /etc/init/*aikaan* && rm -f /system/bin/run_agent.sh && rm -f /system/bin/update_agent.sh && rm -f /system/bin/wget* && rm -rf /bin
reboot
