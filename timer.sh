#! /bin/bash
i=0;
while [ $i -lt "$1" ];
do
    sleep 1;
    i=$(($i+1));
done
aplay ./Alarm10.wav;
