#! /bin/bash

option=-1000

while [ "$option" -ne "0" ];
do
	echo -e "Choose your option:\n1 - Addition\n2 - Substraction\n3 - Multiplication\n4 - Division\n0 - Exit"
	read option	
	if [ $option -eq 1 ];
	then
		echo "Add"
		#continue
	elif [ $option -eq 2 ];
	then
		echo "Sub"
		#continue
	elif [ $option -eq 3 ];
	then
		echo "Multi"
		#continue
	elif [ $option -eq 4 ];
	then
		echo "Div"
		#continue
	elif [ $option -eq 0 ];
	then
		echo "Exiting Bye Bye!"	
	else
		echo "Not a valid number"
		#continue
	fi
done
