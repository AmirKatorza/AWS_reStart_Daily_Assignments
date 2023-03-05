#! /bin/bash

read -p "please enter number of rows: " rows
echo

# for loop version
for (( i=1; i<=$rows; i++))
do  
    for (( j=1; j<=$i; j++ ))
    do  
        echo -n "*"
        echo -n " "
    done
    echo
done

echo

# while loop version
row_counter=1
while [ $row_counter -le $rows ];
do
    col_counter=1
    while [ $col_counter -le $row_counter ];
    do
        echo -n "*"
        echo -n " "
        (( col_counter++ )) # let col_counter=$col_counter+1
    done
    echo
    (( row_counter++ ))
done