#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p grocery/{fruits/{mango,eggs},vegetables/{celery,onion}}
    tree grocery/
    echo

    echo "2. Rename eggs to Grapes"
    mv grocery/fruits/eggs grocery/fruits/grapes
    tree AWS/
    
    echo "3. Write a sentence Fruits are not a dessert in Banana file in Grapes"
    echo "Fruits are not a dessert" > grocery/fruits/grapes/banana.txt
    tree grocery/
    cat grocery/fruits/grapes/banana.txt

    echo "4. Copy banana to Mango & Celery" 
    parallel cp grocery/fruits/grapes/banana.txt ::: grocery/fruits/mango/ grocery/vegetables/celery/
    tree AWS/

    echo "5. Create Tomato dir under Vegetables and move it to Fruit."
    mkdir grocery/vegetables/tomato; mv grocery/vegetables/tomato grocery/fruits/ 
    tree grocery/

    echo "6. Delete AWS Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf grocery/
    fi

    # sudo apt update
    # sudo apt install vsftpd
    # sudo systemctl status vsftpd    
    
}

function check_user_authorization() {
# Write a script that prompts the user to enter a username, and then checks whether the
# username is in a list of authorized users.
# Authorized_users are “alice", "bob" & "charlie"

    local authorized_users=("alice" "bob" "charlie")
    read -p "Please Enter user name to search: " user_name 
    local flag=0
    for name in $authorized_users
    do
        if [ $user_name == $name ]; then  
            echo "You are an authorized user"
            flag=1
            break
        fi
    done
    if [ $flag -eq 0 ]; then
        echo "You are not authorized!"
    fi

    flag=0
    users_array=( $(awk -F':' '{ print $1}' /etc/passwd) )
    for user in ${users_array[@]}
    do
        if [ $user_name == $user ]; then
            echo "You are authorized"
            flag=1
            break
        fi        
    done
    if [ $flag -eq 0 ]; then
        echo "You are not authorized!"
    fi
}

function main () {

flag=0
while [ $flag -eq 0 ]
	do
	    echo "-------------MENU---------------------"
        echo "1. Linux Drills"
        echo "2. Check user authorized"
        echo "3. Quit"        
        echo -e "--------------------------------------\n"
        
        read -p "Please enter your choice: " user_choice           
        case $user_choice in
		1 ) 
            linux_drills 
            ;;
		2 ) 
            check_user_authorization 
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