#!/bin/bash

CUSTOM_DIR=$1           # $1 can be install_dir or config_dir
CONFIG_DIR=$2 

service aikaan stop
update-rc.d -f aikaan disable
update-rc.d -f aikaan remove
service aikaan-agent-opkg-updater stop
update-rc.d -f aikaan-agent-opkg-updater disable
update-rc.d -f aikaan-agent-opkg-updater remove
rm -rf /etc/init.d/aikaan*
if [ ! -z "$1" ]; then
  if [ ! -z "$2" ]; then
    rm -rf $CUSTOM_DIR/aikaan $CONFIG_DIR/aikaan
  else
    rm -rf $CUSTOM_DIR/aikaan /opt/aikaan               # /opt/aikaan is specified if $1 is config_dir
  fi
else
  rm -rf /opt/aikaan
fi

