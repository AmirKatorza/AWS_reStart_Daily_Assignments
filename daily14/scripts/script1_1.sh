#!/bin/bash

read -p "Enter an odd number  " num
row=1
let mid=$num/2+1
while [[ $row -le $num ]]
do
    col=1
    while [[ $col -le $num ]]
    do
        if [[ $col -eq $mid || $row -eq $mid ]]
        then
            echo -n "*"
        else
            echo  -n " "
        fi
        (( col++ ))
    done
    echo
    (( row++ ))
done