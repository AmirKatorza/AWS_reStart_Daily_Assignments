#! /bin/bash

# Write a Bash function script that reads a filename from the user and prints
# whether it is a regular file, a directory, or a symbolic link.

function type() {
    read -p "Plese enter a path to file or directory: " path
    if [[ -f $path ]];
    then
        if [[ -L $path ]];
        then    
            echo "This is a symbolic link to a file"
        else
            echo "This is a regular file"
        fi
    elif [[ -d $name ]];
    then
        if [[ -L $path ]];
        then    
            echo "This is a symbolic link to a directory"
        else
            echo "This is a directory"
        fi   
    else
        echo "The path is invalid"
    fi
}