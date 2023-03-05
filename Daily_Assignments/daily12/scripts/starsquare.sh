#! /bin/bash

read -p "Please enter square size: " size

#for (( i=1; i<=$size; i++))
#do
#	for ((j=1; j<=$size; j++))
#	do
#		echo -n "*"
#		echo -n " "
#	done
#	echo
#done

rows=1
while [ $rows -le $size ];
do
	cols=1
	while [ $cols -le $size ];
	do
		echo -n "*"
		echo -n " "
		(( cols++ ))
	done
	echo
	(( rows++ ))
done
