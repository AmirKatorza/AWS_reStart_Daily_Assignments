#! /bin/bash

# Code a function script that checks if the number of given external arguments is
# less than 3 and if it is echo the number of arguments is not enough. Otherwise
# echos “great

function less_than_3() {
    if [[ $1 -lt 3 ]];
    then    
        echo "The number of arguments is not enough"
    else    
        echo "Great!"
    fi
}

num=$#
echo $num
less_than_3 $num