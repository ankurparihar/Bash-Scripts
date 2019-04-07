#! /bin/bash

echo "run this file from the folder in which popcorn-time.tar.xz is located"
read -p "Proceed...? <enter/ctrl+c>"
gksudo mkdir /opt/popcorn-time
filename=$(find . -maxdepth 1 -type f | grep --ignore-case popcorn-time | cut -c 3-| head -n 1)
echo "found the following image :$filename"
read -p "Proceed...? <enter/ctrl+c>"
sudo cp -v $filename /opt/popcorn-time/
cd /opt/popcorn-time/
echo "extracting file..."
sudo tar -xf $filename
sudo rm $filename
filedir=$(ls --group-directories-first | head -n 1)
echo 'creating terminal command "popcorn-time" for non-privileged users'
sudo ln -sf /opt/popcorn-time/Popcorn-Time /usr/bin/popcorn-time
echo "creating desktop launcher..."
echo "Put the following lines between dash-breaks in the document opened:"
echo "==============================================================="
echo "[Desktop Entry]"
echo "Version = 1.0"
echo "Type = Application"
echo "Terminal = false"
echo "Name = Popcorn Time"
echo "Exec = /usr/bin/popcorn-time"
echo "Icon = /opt/popcorn-time/popcorntime.png"
echo "Categories = Application;"
echo "==============================================================="
sudo gedit /usr/share/applications/popcorntime.desktop
echo "done."
echo "Note: Popcorn-Time will download movies in /tmp/butter/ folder. This folder's contents are vanished upon every reboot. So you need to manually copy it's contents to some other location before powering off to view offline."
