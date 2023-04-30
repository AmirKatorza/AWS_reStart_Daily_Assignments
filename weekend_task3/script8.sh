#! /bin/bash

# A. create a file named “numbers.txt” and insert number 1-10 line by line.
# B. Write a while loop that reads lines from a file named numbers.txt and prints out
# only the even numbers.

$(touch numbers.txt)
for (( i=1; i<=10; i++ ))
do
    $(echo $i >> numbers.txt)
done

while read p
do 
    if [[ $p%2 -eq 0 ]];
    then
        echo $p
    fi
done < numbers.txt
