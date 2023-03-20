#! /bin/bash

# Create a new dir named “dir”. 
# Create new files named “file1.txt” to “file9.txt” in “dir”
# Write a script that renames file1.txt file2.txt etc 
# to “document1” to “document9” using loops.

# Create Directory and files
$(mkdir dir)
$(touch dir/file{1..9}.txt)

# Change the names
for f in dir/* 
do
    file_num=$(echo $f | sed 's/[^0-9]*//g')
    $(mv $f dir/document$file_num.txt)    
done