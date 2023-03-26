#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p grocery/{fruits/{corn,toyota,strawberry},vegetables/{lettuce,carrot}}
    tree grocery
    echo

    echo "2. Lets fix the mess"
    mv grocery/fruits/toyota grocery/fruits/melon
    mv grocery/fruits/corn grocery/vegetables
    tree grocery
    
    echo "3. Write a fact about melon in a file under melon dir"
    echo "Melons are sweet and juicy" >> grocery/fruits/melon/facts.txt
    cat grocery/fruits/melon/facts.txt
    tree grocery

    echo "4. Create a folder Popcorn under Corn dir" 
    mkdir grocery/vegetables/corn/popcorn
    tree grocery

    echo "5. Copy “Popcorn” to Carrot dir"
    cp -r grocery/vegetables/corn/popcorn grocery/vegetables/carrot
    tree grocery
    
    echo "6. Delete grocery Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]
    then
        rm -rvf grocery/
    fi    
}

function create_files_while() {
    # Write a Bash script using for loop that prompts the user for a list of five file names and creates
    # empty files with those names in the current directory.

    mkdir tmp
    local files_counter=0    
    local pattern="^\w+$"
    while [ $files_counter -lt 5 ]
    do
        read -p "Please Enter file name to create: " fname
        if [[ $fname =~ $pattern ]]
        then    
            $(touch tmp/$fname)
            (( files_counter++ ))
        else
            echo "Please enter a valid file name without spaces!"
        fi
    done
    rm -rvf tmp   
}

function create_files_for() {
    # Write a Bash script using for loop that prompts the user for a list of five file names and creates
    # empty files with those names in the current directory.

    mkdir tmp
    local pattern="^\w+$"
    for ((file_counter=0; file_counter<5;))
    do
        read -p "Please Enter file name to create: " fname
        if [[ $fname =~ $pattern ]]
        then    
            $(touch tmp/$fname)
            (( file_counter++ ))
        else
            echo "Please enter a valid file name without spaces!"
            # (( file_counter-- ))
        fi
    done
    rm -rvf tmp   
}

function main () {

flag=0
while [ $flag -eq 0 ]
	do
	    echo "-------------MENU---------------------"
        echo "1. Linux Drills"
        echo "2. Create 5 files using while loop"
        echo "3. Create 5 files using for loop"
        echo "4. Quit"
        echo -e "--------------------------------------\n"
        
        read -p "Please enter your choice: " user_choice           
        case $user_choice in
		1 ) 
            linux_drills 
            ;;
		2 ) 
            create_files_while 
            ;;
        3 ) 
            create_files_for 
            ;;
		4 ) 
            flag=1 
            ;;
		* ) 
            echo "Invalid Choice, Please try again!" 
            ;;            
		esac
	done
}

main