#! /bin/bash

sum=0
iterator=1

while [ $iterator -le 10 ]
do
	if [[ $iterator%2 -eq 1 ]];
	then
		sum=$(( $sum + $iterator ))
	fi
	(( iterator++ ))
done
echo $sum
