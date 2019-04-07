#! /bin/bash

echo "run this script near xampp-linux-installer.run binary"
read -p "Proceed...? <enter/ctrl+c>"
filename=$(ls | grep xampp-linux | grep installer.run)
echo "found the following binary :$filename"
read -p "Proceed...? <enter/ctrl+c>"
echo "now follow onscreen instructions..."
sudo ./$filename


