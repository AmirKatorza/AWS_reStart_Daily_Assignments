#! /bin/bash

# Write a Bash script as function that reads a directory name from the user and
# prints the names of all files in that directory.

function files_in_dir() {
    read -p "enter a directory name " dir
    path=$(find $HOME -type d -name $dir)
    echo $(ls -p $path | grep -v /)
}

files_in_dir
