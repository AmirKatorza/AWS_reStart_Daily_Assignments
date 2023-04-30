#! /bin/bash

read -p "Enter the number of rows: " rows

for (( i=1; i<=$rows; i++ ))
do
	if [ $i -eq 1 -o $i -eq $rows ];
	then
		for (( j=1; j<=$rows; j++ ))
		do
			echo -n "*"
		done
	else
		echo -n "*"
		for (( j=1; j<=$rows-2; j++ ))
		do
			echo -n " "
		done
		echo -n "*"
	fi
	echo
done

