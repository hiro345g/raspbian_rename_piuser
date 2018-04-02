#!/bin/sh
sudo cp -a /etc/rc.local /etc/rc.local.backup
sudo sed -i 's/exit 0//' /etc/rc.local
cat rename_pi.sh | sudo tee -a /etc/rc.local
sudo reboot

