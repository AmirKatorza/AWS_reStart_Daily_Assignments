#! /bin/bash

# Write a script using functions that receive a number from 1 - 7 as an arg , Each
# number outputs a day in the week. For example ( 1 = Sunday etc..) , if the user
# enter not a relevant number echo “error”.

function day_of_week() {
    
    case $1 in
    "1" )
        echo "Sunday" ;;
    "2" )
        echo "Monday" ;;
    "3" )
        echo "Tuesday" ;;
    "4" )
        echo "Wednesday" ;;
    "5" )
        echo "Thursday" ;;
    "6" )
        echo "Friday" ;;
    "7" )
        echo "Saturday" ;;
    * )
        echo "Error!"    
    esac    
}


read -p "Please enter a number between 1-7: " num
day_of_week $num