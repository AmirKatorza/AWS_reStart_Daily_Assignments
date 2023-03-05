#! /bin/bash

# Write a script that prompts the user to enter a password, and then checks
# whether the password is at least 8 characters long.


password=0
while :
do
    read -p "Please enter your password: " password
    if [[ ${#password} -ge 8 ]];
    then
        echo "Strong Password!"
        break
    else    
        echo "Short password, try again!"
    fi
done