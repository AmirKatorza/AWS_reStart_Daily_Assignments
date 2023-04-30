#! /bin/bash

read -p "please enter the size of the square: " size

row=1 #init
let max=$size+1
while [[ $row -le $size ]]
do
	col=1 #init
	while [[ $col -le $size ]]
	do
		sec_diag=$max-$row 
        if [[ $row -eq 1 || $row -eq $size || $col -eq 1 || $col -eq $size || $col -eq $row || $sec_diag -eq $col ]];
        then    
            echo -n "*"
        else
            echo -n " "
        fi		
		let col=$col+1
	done
	echo
	let row=$row+1
done
