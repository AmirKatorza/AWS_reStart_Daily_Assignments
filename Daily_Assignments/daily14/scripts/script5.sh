#! /bin/bash

# Write a function script that shows you in a menu options of “restart” or
# “shutdown” your VM (virtual machine) or “exit” from the script and ask the user to
# select an option.

options=(restart shutdown exit)

select option in ${options[@]}
do
    case $option in
    "restart" )
        $(sudo init 6) ;;
    "shutdown" )
        $(sudo power off) ;;
    "exit" ) 
        exit ;;
    * )
        echo "This is not a valid option" ;;
    esac
done