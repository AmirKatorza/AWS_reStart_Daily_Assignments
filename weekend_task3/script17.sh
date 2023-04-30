#! /bin/bash

read -p "Please enter a number: " num
row=1
while [ $row -le $num ]
do
    col=1
    while [ $col -le $num ]
    do
        if [[ $row -eq 1 || $row -eq $num || $col -eq 1 || $col -eq $num ]];
        then
            echo -n "*"
            echo -n " "
        else
            echo -n " "
            echo -n " "
        fi
        (( col++ ))
    done
    echo
    (( row++ ))
done