#! /bin/bash

function print_sec_diag() {
    local size=$1
    local row=0
    while [ $row -lt $size ]
    do
        local col=1
        local num_of_iter=$(( $size - $row ))
        while [[ $col -le $num_of_iter ]]
        do
            echo -n "*"
            echo -n " "
            (( col++ ))
        done
        echo
        (( row++ ))
    done
}

read -p "Please enter a number: " num
print_sec_diag $num