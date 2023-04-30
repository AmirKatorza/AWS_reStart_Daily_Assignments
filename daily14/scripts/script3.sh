#! /bin/bash

# Code a function script that checks if the number of given external arguments is
# less than 3 and if it is echo the number of arguments is not enough. enter at least
# 3 arguments. if 3 arguments were given than check which is the largest value.

function less_than_3() {
    arr=("$@")
    arr_len=${#arr[@]} 
    
    if [[ $arr_len -lt 3 ]];
    then    
        echo -e "The number of arguments is not enough,\nenter at least 3 arguments"
    else
        max=0
        for  num in ${arr[@]}
        do  
            if [[ num -gt max ]];
            then    
                max=$num
            fi
        done
        echo "the max number is $max"        
    fi    
}

num_array=("$@")
echo "${num_array[@]}"
echo "Number of external arguments is $#"
less_than_3 ${num_array[@]}