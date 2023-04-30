#! /bin/bash

# Write a Bash script that uses a select statement to display a menu of options.
# When the user selects an option, the script should display the number of files in a
# directory based on the option chosen. The options should be: "Current Directory",
# "Home Directory", and "Quit"
# (tip: use ls -1 (one) in your terminal before write your script )

options=(Current_Directory Home_Directory Quit)

select option in ${options[@]}
do
    case $option in
    "Current_Directory" )
        echo "$(ls -1 | wc -l)" ;;
    "Home_Directory" )
        echo "$(ls -1 $HOME | wc -l)" ;;
    "Quit" ) 
        exit ;;
    * )
        echo "This is not a valid choice" ;;
    esac
done