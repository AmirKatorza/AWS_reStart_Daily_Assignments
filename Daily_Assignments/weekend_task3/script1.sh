#! /bin/bash

arr_of_files=("$@")

for file in ${arr_of_files[@]}
do  
    $(touch $file)
    $(chmod u+x $file)
done
