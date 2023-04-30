#! /bin/bash

count=0
num=1

while [ $count -le 10 ];
do
	if [[ $num%2 -eq 0 ]];
	then
		echo $num
		((count++))
	fi
	((num++))
done

