#! /bin/bash

# Write a shell script to display the digits which are in odd position in a given 5 digit
# number.

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

cp_num=$num

for (( i=1; i<=5; i++ ))
do
    if [[ $i%2 -eq 0 ]]
    then
        cp_num=$(( $cp_num/10 ))
    else
        let result=$cp_num%10
        echo "$result"
        cp_num=$(( $cp_num/10 ))
    fi        
done
