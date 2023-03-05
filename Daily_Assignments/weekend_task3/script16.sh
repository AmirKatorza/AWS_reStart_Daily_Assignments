#! /bin/bash

read -p "Please enter a number: " num
row=1
counter=0
while [ $row -le $num ]
do
    col=1
    while [ $col -le $row ]
    do
        (( counter++ ))
        echo -n $counter
        echo -n " "
        (( col++ ))        
    done
    echo
    (( row++ ))
done