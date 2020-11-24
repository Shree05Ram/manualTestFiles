#!/bin/sh

DEFAULT_DIR=/opt/aikaan
BIN_FILE=$DEFAULT_DIR/bin/opkg
CUSTOM_DIR=$1/aikaan
CONFIGURE_DIR=$2/aikaan

#set -v

user="$(id -un 2>/dev/null || true)"
#set -v

user="$(id -un 2>/dev/null || true)"

if [ "$user" != 'root' ]; then
        echo "Should be root user to run the script"
        exit 1
else
        systemctl stop aikaan-agent-opkg-updater.service
        systemctl disable aikaan-agent-opkg-updater.service
        systemctl stop aikaan-agent-opkg-updater.timer
        systemctl disable aikaan-agent-opkg-updater.timer
        systemctl stop aikaan.service
        systemctl disable aikaan.service
        if [ ! -z $CUSTOM_DIR ] && [ ! -f "$BIN_FILE" ]; then
                $CUSTOM_DIR/$BIN_FILE -f $CUSTOM_DIR/aikaan/etc/opkg.conf remove aiagent
                $CUSTOM_DIR/$BIN_FILE -f $CUSTOM_DIR/aikaan/etc/opkg.conf clean
        else
                $BIN_FILE -f $DEFAULT_DIR/etc/opkg.conf remove aiagent
                $BIN_FILE -f $DEFAULT_DIR/etc/opkg.conf clean
                rm -rf $DEFAULT_DIR
        fi

        #if [[ ! -f "$CUSTOM_DIR" ] || ["$CONFIG_DIR" ]]; then
        #              rm -rf $CUSTOM_DIR $CONFIG_DIR
        #fi
        
        rm -rf /etc/systemd/system/aikaan* $CUSTOM_DIR $CONFIG_DIR
        echo "aiagent is uninstalled and the directories are clean"
fi
