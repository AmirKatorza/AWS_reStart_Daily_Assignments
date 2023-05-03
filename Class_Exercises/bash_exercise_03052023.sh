#! /bin/bash

dir_name=$1
# Alternative: read -p "Please enter directory name: " dir_name

if [ $# -eq 0 ] || [ ! -d $HOME/$dir_name ]; then
    echo "Error - Directory does not exists"
    echo "$(date) Failed" >> logfile.txt
    exit 1
fi

num_files=$(find $HOME/$dir_name -not -path '*/.*' -type f | wc -l) # ignore hidden files
echo "The number of files in $HOME/$dir_name is: $num_files"
echo "$(date) Success" >> logfile.txt

# echo $?