#! /bin/bash
sudo echo "HandleLidSwitch=ignore" >> /etc/systemd/logind.conf
sudo service systemd-logind restart
read -p "reboot now...? <enter/ctrl+c>"
reboot
