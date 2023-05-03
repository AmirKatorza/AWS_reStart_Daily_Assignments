#! /bin/bash

files=$(ls $(pwd))
files=(${files[@]})

for file in ${files[@]}
do
	echo $file
done

