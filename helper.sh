#!/bin/bash
reset
cat Desktop/programs.txt | cut -c 1-28 > file.txt
dpkg -l '*' | cut -c 1-28 > file2.txt
diff -y file.txt file2.txt | grep '<' | cut -c 1-28
    #i=0
    #while read -r line;
    #do
    #    sample=$(echo $line | cut -c 1-2)
    #    if[ "$sample" == "ii" ];then
    #        echo line matched
    #    fi;
    #    #((i++))
    #done;
    #echo $i lines parsed

#echo done!
