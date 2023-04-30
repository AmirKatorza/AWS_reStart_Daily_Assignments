#! /bin/bash

# Write a Bash script that uses a while loop to prompt the user to enter a number,
# and then prints the square of that number.

read -p "please enter a number : " num
sqr=0
counter=$num
while [ $counter -gt 0 ]
do
         sqr=$(( sqr+num ))
        (( counter-- ))
done
echo $sqr
