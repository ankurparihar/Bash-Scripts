#! /bin/bash
mkdir "lyrics" && cd "lyrics" && {

for i in {a..z};
do
    mkdir $i && cd $i ;
    url="https://www.azlyrics.com/$i.html";
    wget -U "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.27 Safari/537.17" $url ;
    # processing ;
    # rm $i.html ;
    cd .. ;
done;

}
