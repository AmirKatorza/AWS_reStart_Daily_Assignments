#! /bin/bash

while read line
do
    if grep -qi "apple" <<< "$line" 
    then
        echo $line
    fi    
done < input.txt
