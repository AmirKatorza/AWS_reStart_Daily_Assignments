#! /bin/bash

# Write a function script that will print any value(s) 
# which was given as external args.
# Each given value will be output in a new line.

function print_args() {
    arr=("$@")
    # arr_len=${#arr[@]} 
    for num in ${arr[@]}
    do  
        echo $num
    done
}

num_array=("$@")
echo "Number of external arguments is $#"
print_args ${num_array[@]}