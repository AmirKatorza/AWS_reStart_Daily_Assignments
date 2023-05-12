#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p big/{food/{crocs,kingstore,bbb},market/{mega,shufersal}}    
    echo

    echo "2. Use tree command to display the content of the directory."
    tree big/
    echo
    
    echo "3. From your current directory, Move kingstore to market in relative path."
    mv big/food/kingstore big/market/
    tree big/    
    echo
    
    echo "4. Rename crocs to rebar in absolute path"
    mv big/food/crocs/ big/food/rebar
    tree big/
    echo

    echo "5. Create files BBBisMyWorld.txt and BBBUrger.txt under BBB subdir" 
    touch big/food/bbb/BBBisMyWorld.txt  big/food/bbb/BBBUrger.txt
    tree big/
    echo    

    echo "6.Insert the text “BBB is Junk but Tasty with a lot of sauce” to the file “BBBurger”"
    echo “BBB is Junk but Tasty with a lot of sauce” >> big/food/bbb/BBBUrger.txt
    cat big/food/bbb/BBBUrger.txt
    echo

    echo "7. Copy the content of BBBUrger.txt to BBBisMyWorld.txt"
    cat big/food/bbb/BBBUrger.txt >> big/food/bbb/BBBisMyWorld.txt
    cat big/food/bbb/BBBisMyWorld.txt
    echo

    echo "8. Insert the following text to BBBurger.txt."
    echo "A hamburger, or simply burger, is a food consisting of \
        fillings—usually a patty of ground meat, typically beef—placed \
        inside a sliced bun or bread roll. Hamburger are often \
        served with cheese, lettuce, tomato, onion, pickles or chilis; \
        condiments such as ketchup, mustard, mayonnaise, relish, \
        or a "special sauce", often a variation of Thousand Island dressing; \
        and are frequently placed on sesame seed buns. A hamburger topped with \
        cheese is called a cheese burger." >> big/food/bbb/BBBUrger.txt
    
    echo "9. Count how many times the word burger is in the text. (pay attention only burger, cheeseburger is not included)"
    num=$(grep -wo "\bburger" big/food/bbb/BBBUrger.txt | wc -l)
    echo "The word burger appears $num times"
    echo  

    echo "10. Delete aws Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf big/
    fi     
}

function only_even_lines() {
# Write a Bash script that takes a filename as input and creates a new file that contains
# only the even-numbered lines of the input file
    read -p "Please enter file path: " file_path
    sed -n 'n;p' $file_path >> ./even_lines_out.txt # For odd line use: "sed -n 'p;n' $file_path"
    cat even_lines_out.txt
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. Only even-numbered lines"
            echo "3. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                only_even_lines 
                ;;
            3 ) 
                flag=1 
                ;;
            * ) 
                echo "Invalid Choice, Please try again!" 
                ;;            
            esac
        done
}

main