#! /bin/bash

function print_parallelogram() {
    local size=$1
    row=0
    while [ $row -lt $size ]
    do
        local num_of_spaces=$row
        local itr=0
        while [ $itr -lt $num_of_spaces ]
        do
            echo -n " "
            echo -n " "
            (( itr++ ))
        done
        
        col=0
        while [ $col -lt $size ]
        do  
            if [[ $row -eq 0 || $row -eq $size-1 || $col -eq 0 || $col -eq $size-1 ]];
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
}

read -p "Please Enter a number: " num
print_parallelogram $num