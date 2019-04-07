#! /bin/bash
read -n 1 c
while($c!='0'){
    b=$(printf '%d' "'$c");
    b=$((($b+12)%26 +1));
    echo $b;
}
