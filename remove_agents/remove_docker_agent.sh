#!/bin/sh
set -v

user="$(id -un 2>/dev/null || true)"

if [ "$user" != 'root' ]; then
        echo "Should be root user to run the script"
        exit 1
else
        docker-compose -f /opt/aikaan/etc/docker-compose.yml down 
        var=$(docker image list -a | grep aikaan | awk '{print $3}')
        docker rmi $var 
        rm -rf /opt/aikaan
        echo "aiagent is uninstalled and the directories are clean"
fi 
