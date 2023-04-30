#! /bin/bash
# read -p "Please enter number of rows: " num
# row=1
# while [ $row -le $num ]
# do
#     col=1
#     num_of_iterations=$(( $num + 1 - $row))
#     while [ $col -le $num_of_iterations ]
#     do
#         echo -n $col
#         (( col++ ))
#     done
#     echo
#     (( row++ ))
# done

read -p "enter a num: " num
while [[ $num -gt 0 ]]
do
    i=1
    while [[ $i -le $num ]]
		do
		    echo -n "$i"
		    let i=i+1
		done
	echo ""
	let num=num-1
done