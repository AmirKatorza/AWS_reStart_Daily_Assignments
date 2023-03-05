#! /bin/bash

function make_env() {
    $(mkdir $1/)
    for (( i=1; i<=$2; i++ ))
    do
        $(touch $1/script$i.sh)
        $(echo "#! /bin/bash" > $1/script$i.sh)
    done
    $(chmod -R a+x $1)
    echo "Environment for $1 Assignment was created successfully"
}

read -rp "Please enter assignment name: " assign_name
read -rp "Please enter number of scripts for assignment: " num

make_env "$assign_name" $num