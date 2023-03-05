#! /bin/bash


while read p
do
    if [ $(echo $p | grep -E '\b[aA]') ];
    then
        echo $p
    fi
done < names.txt