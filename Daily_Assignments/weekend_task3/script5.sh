#! /bin/bash

read -p "Please enter 3 numbers: " num1 num2 num3
num_arr=($num1 $num2 $num3)

max=0
for num in ${num_arr[@]}
do  
    if [[ $num -gt $max ]];
    then
        max=$num
    fi
done

echo "The largest numer is $max"
