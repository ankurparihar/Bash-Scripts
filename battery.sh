while(true)
do
    new_status="$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep state | cut -d " " -f 20)";
    if [ "$battery_status" != "$new_status" ]
    then
        if [ "$new_status" == "discharging" ]
        then
            notify-send -u critical -t 2000 "$new_status";
            aplay ~/Alarm10.wav;
        fi
        battery_status="$new_status";
    fi
    sleep 3;
done
