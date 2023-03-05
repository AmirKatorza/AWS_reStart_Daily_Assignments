#! /bin/bash

for i in {0..21..2}
do
	echo $i
done



for i in {1..21};
do
	if [[ $i%2 -eq 0 ]];
        then

                echo $i
        fi
done
