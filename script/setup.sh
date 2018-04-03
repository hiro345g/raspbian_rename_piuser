#!/bin/sh
if [ $# -eq 1 ]; then
  cat rename_pi_sample.sh | \
    sed "s/nuid=\"pi001\"/nuid=\"${1}\"/" - > rename_pi.sh
fi
if [ $# -eq 2 ]; then
  cat rename_pi_sample.sh | \
    sed "s/ouid=\"pi\"/ouid=\"${1}\"/" - | \
    sed "s/nuid=\"pi001\"/nuid=\"${2}\"/" - > rename_pi.sh
fi
if [ ! -e rename_pi.sh ]; then
  cp rename_pi_sample.sh rename_pi.sh
fi
sudo cp -a /etc/rc.local /etc/rc.local.backup
sudo sed -i 's/exit 0//' /etc/rc.local
cat rename_pi.sh | sudo tee -a /etc/rc.local
sudo reboot

