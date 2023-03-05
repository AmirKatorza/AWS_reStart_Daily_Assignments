#! /bin/bash

read -p "Please enter a number: " num

for i in {1..10}
do
	echo "$num X $i = $(( $num*$i ))"
done
