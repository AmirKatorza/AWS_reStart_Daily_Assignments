#!/bin/bash

read -p "Enter a number  " num
row=1 

while [[ $row -le $num ]];
do
    col=1 
    let col_iter_num=$num+1-$row
    
    while [[ $col -le $col_iter_num ]] 
    do
        echo -n "*" 
        let col=$col+1 
    done
    echo 
    let row=$row+1 
done