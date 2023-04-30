#! /bin/bash

sum=0
while read line
do
    let sum=$sum+$line
done < numbers.txt

echo "The total sum of number in the file is: $sum"