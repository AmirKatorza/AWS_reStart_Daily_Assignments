#! /bin/bash

# Code a script using while loop that prompts the user to enter a name and prints
# out the name in uppercase, but only if the name is longer than 5 characters.
# ((TIP: practice the following instructions before write your script:
# In your terminal: Set var=abc , then echo ${var^^} ))

name=0
while :
do  
    read -p "please enter your name: " name
    if [[ ${#name} -gt 5 ]];
    then    
        echo ${name^^}
        break
    else    
        echo "name is too short, try again!"
    fi
done