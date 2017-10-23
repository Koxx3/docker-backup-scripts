#!/bin/bash

# by piscue

# setup path of scripts
# know where backup-all.sh will be stored

cd "${BASH_SOURCE%/*}" || exit
cd ..
sudo mkdir -p /opt/bin
sudo cp *.sh /opt/bin
sudo chmod +x /opt/bin/*sh

# copy service and time to the system
cd config
sudo cp backup-containers* /etc/systemd/system/

# enabling timer
sudo systemctl enable /etc/systemd/system/backup-containers.timer
sudo systemctl start  /etc/systemd/system/backup-containers.timer
sudo systemctl enable /etc/systemd/system/backup-containers.service
