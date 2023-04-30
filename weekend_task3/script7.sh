#! /bin/bash

# Write a while loop that prompts the user to enter a password until they enter a
# password that meets the following criteria: it must be at least 8 characters long
# and contain at least one uppercase letter, one lowercase letter, and one digit.

upper=0
lower=0
digit=0
eight_char=0

while [[ $upper -eq 0  && $lower -eq 0 && $digit -eq 0 && $eight_char -eq 0 ]]
do
    read -p "Please enter you password: " pass
    len=${#pass}
    if [ $len -ge 8 ];
    then
        eight_char=1
        for (( i=0; i<$len; i++ ))
        do
            case ${pass:$i:1} in
                [a-z] )
                    lower=1 ;;
                [A-Z] )
                    upper=1 ;;
                [0-9] )
                    digit=1 ;;
            esac
        done
    fi    
    
    if [[ $upper -eq 0  || $lower -eq 0 || $digit -eq 0 || $eight_char -eq 0 ]];
    then
        upper=0
        lower=0
        digit=0
        eight_char=0
        echo "The password you've entered is invalid, Try Again!"
    else
        echo "Password is good!"        
    fi    
done
