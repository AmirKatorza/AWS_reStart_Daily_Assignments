#! /bin/bash

flag=1
while [ $flag -eq 1 ]
do
    read -p "Please enter a name: " name
    if [ ${#name} -gt 5 ]
    then
        flag=0
        echo ${name^^}
    else
        echo "Please enter a longer name, at least five characters"
    fi
done
