#! /bin/bash

# Run a script using function to output the multiplication table

function multi_table () {
    for (( i=1; i<=10; i++ ))
    do
        for (( j=1; j<=10; j++ ))
        do
            result=$(( $i*$j ))
            echo -n $result
            echo -n " "
        done
        echo 

    done
}

multi_table