#! /bin/bash

min_battery=10;
while(true);
do
    if [[ ( "$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | cut -d ' ' -f 15- | cut -d '%' -f -1)" < $min_battery ) ]]
    then
        shutdown now;
    fi;
    sleep 1;
done;
