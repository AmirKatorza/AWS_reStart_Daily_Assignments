#! /bin/bash

read -p "Please enter a number: " num
row=1
while [ $row -le $num ]
do
    col=1
    num_of_spaces=$(( $num - $row))
    itr=0
    while [ $itr -le $num_of_spaces ]
    do
        echo -n " "
        echo -n " "
        (( itr++ ))
    done
    
    while [ $col -le $num ]
    do
       echo -n "*"
       echo -n " "
       (( col++ ))
    done
    echo
    (( row++ ))
done