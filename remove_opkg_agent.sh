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
        $INSTALL_DIR/opt/aikaan/bin/opkg -f $INSTALL_DIR/opt/aikaan/etc/opkg.conf remove aiagent
        $INSTALL_DIR/opt/aikaan/bin/opkg -f $INSTALL_DIR/opt/aikaan/etc/opkg.conf clean
        rm -rf /etc/systemd/system/aikaan*
        rm -rf $INSTALL_DIR/opt/aikaan
        echo "aiagent is uninstalled and the directories are clean"
fi
