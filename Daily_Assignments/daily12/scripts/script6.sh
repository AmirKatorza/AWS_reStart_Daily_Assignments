#! /bin/bash

num=1

while [ $num -le 10 ];
do
	if [[ $num%2 -eq 0 ]];
	then
		(( num++ ))
	else
		echo $num
		(( num++ ))
	fi
done
