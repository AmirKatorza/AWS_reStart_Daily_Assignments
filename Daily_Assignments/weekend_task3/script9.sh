#! /bin/bash

# Write a while loop that prompts the user to enter a number between 1 and 10.
# The loop should continue until the user enters a valid number, and then print out
# the number of attempts it took the user to enter a valid number.

num_attempts=0
flag=0

while [ $flag -eq 0 ];
do
    let num_attempts=$num_attempts+1
    read -p "Please enter a number between 1-10: " num
    if [[ $num -ge 1 && $num -le 10 ]];
    then 
        flag=1
        echo "Valid Number!"
        echo "Number of attempts is: $num_attempts"
    fi
done

