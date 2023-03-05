#! /bin/bash

function print_cross() {
    local size=$1
    local mid=$(( ($size + 1)/2 ))
    row=1
    while [ $row -le $size ];
    do
        col=1
        while [ $col -le $size ];
        do
            if [[ $col -eq $mid || $row -eq $mid ]];
            then
                echo -n "*"
                echo -n " "
            else
                echo -n " "
                echo -n " "
            fi
            (( col++ ))
        done
        (( row++ ))
        echo
    done
}

num=0
while [[ $num%2 -eq 0 ]];
do
    read -p "Please enter an odd number: " num
done
print_cross $num