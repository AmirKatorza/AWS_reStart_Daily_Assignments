#! /bin/bash

# Write a shell program to reverse the digits of a five digit integer.

flag=0
while [ $flag -eq 0 ];
do
    read -p "Please enter a 5 digit number: " num
    if [ $num -gt 9999 -a $num -lt 100000 ];
    then    
        flag=1
    else    
        echo "Number is not in the range. Try Again!"
    fi
done

remainder=0
reverse=0

while [[ $num -gt 0 ]];
do
    remainder=$(( $num % 10 ))
    reverse=$(( $reverse * 10 + $remainder))
    num=$(( $num/10 ))
done
echo "The reversed number is: $reverse"