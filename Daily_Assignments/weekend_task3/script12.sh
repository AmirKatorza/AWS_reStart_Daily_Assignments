#! /bin/bash

read -p "Please enter a number: " num
row=1
while [ $row -le $num ]
do
    col=1
    while [ $col -le $num ]
    do
        echo -n "*"
        echo -n " "
        (( col++ ))
    done
    echo
    (( row++ ))
done
