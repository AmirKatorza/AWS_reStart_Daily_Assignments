#! /bin/bash

# Write a script using a for loop that prompts the user to enter a string, and then
# checks whether the string is a palindrome (i.e., whether it reads the same
# forwards and backwards).

function is_palindrome_while() {
    local word1=$1
    local len=${#word1}
    local i=0
    local j=$(( $len -1 ))
    local flag=1
    while [[ $i -lt $j && $flag -eq 1 ]]
    do
        if [ ${word1:$i:1} == ${word1:$j:1} ];
        then
            (( i++ ))
            (( j-- ))
        else
            flag=0
        fi
    done

    if [ $flag -eq 1 ];
    then    
        echo "The word $word1 is a palindrome"
    else    
        echo "The word $word1 is NOT a palindrome"
    fi
}

function is_palindrome_for() {
    local word2=$1
    local len=$((${#word2} - 1))
    local flag=1
    for (( i=0; i <= (len/2); i++ )); 
    do
        if [[ ${word2:i:1} != ${word2:len-i:1} ]];
        then
            flag=0
        fi
    done
    
    if [ $flag -eq 1 ];
    then    
        echo "The word $word2 is a palindrome"
    else    
        echo "The word $word2 is NOT a palindrome"
    fi
}

function is_palindrome_rev() {
    local word3=$1
    local reversed=$(echo $word3 | rev)
    if [ $word3 == $reversed ];
    then
        echo "The word $word3 is a palindrome"
    else    
        echo "The word $word3 is NOT a palindrome"
    fi
}

read -p "Please enter a word: " str
is_palindrome_while $str
is_palindrome_for $str
is_palindrome_rev $str