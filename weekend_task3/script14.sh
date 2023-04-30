#! /bin/bash

read -p "Please enter a number: " num
row=1
while [ $row -le $num ]
do
    col=1
    num_of_iter=$(( $num + 1 - $row ))
    while [ $col -le $num_of_iter ]
    do
        echo -n $col
        echo -n " "
        (( col++ ))
    done
    echo
    (( row++ ))
done