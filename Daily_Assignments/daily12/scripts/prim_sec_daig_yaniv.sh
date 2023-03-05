#! /bin/bash
read -p "please enter the size of the square" size
row_size=$size
let max=$size+1
row_counter=1 #init
while [[  $row_counter -le $row_size ]]
do
	col_size=$size
	col_counter=1 #init
	while [[ $col_counter -le $col_size  ]]
	do
	let sec_diag=$max-$row_counter
	
		if [[ $col_counter -eq 1  || $col_counter -eq $col_size   ||  $row_counter -eq 1 ||  $row_counter -eq $row_size  || $row_counter -eq $col_counter || $col_counter -eq   $sec_diag ]] ;then
			echo -n "*"
		else
			echo -n " " 		
		fi		
		let col_counter=$col_counter+1
	done
	
	echo
	let row_counter=$row_counter+1
done