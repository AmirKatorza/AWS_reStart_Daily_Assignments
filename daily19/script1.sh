#! /bin/bash

read -p "Please enter number of rows: " num
i=1
while [ $i -le 2 ]
do
    if [ $i -lt 2 ]
    then
        row=1
    else
        row=2
    fi
    while [ $row -le $num ]
    do
        col=1
        while [ $col -le $num ]
        do
            if [ $row -eq 1 -a $col -eq 1 ] || [ $row -eq 1 -a $col -eq $num ]
            then
                echo -n " "
            elif [ $row -eq $num -a $col -eq 1 ] || [ $row -eq $num -a $col -eq $num ]
            then
                echo -n " "
            elif [ $row -eq 1 -a $col -ne 1 ] || [ $row -eq $num -a $col -ne $num ]
            then    
                echo -n "*"
            elif [ $col -eq 1 -a $row -ne 1 ] || [ $col -eq $num -a $row -ne $num ]
            then
                echo -n "*"
            else
                echo -n " "
            fi
            (( col++ ))
        done
        echo
        (( row++ ))
    done
    (( i++ ))
done

