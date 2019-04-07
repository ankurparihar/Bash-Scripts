#! /bin/bash
while IFS='' read -r line || [[ -n "$line"]];
do
    echo "Text read from file: $line";
done
# https://stackoverflow.com/questions/10929453/read-a-file-line-by-line-assigning-the-value-to-a-variable/10929511#10929511
