#! /bin/bash

function linux_drills() {
    
    echo "1. Create directories tree as requested"
    mkdir -p pokemon/{jigglypuff/{wigglytuff,poliwrath},poliwag/poliwhirl}
    tree pokemon/
    echo

    echo "2. Go to “Poliwrath” in absolute path."
    cd pokemon/jigglypuff/poliwrath/
    pwd
    echo
    
    echo -e "3. Move Poliwrath to Poliwag."
    mv ../poliwrath ../../poliwag
    tree ../../../pokemon/
    echo
    
    echo "4. Go to Poliwhirl on a relative path."
    cd ../../poliwag/poliwhirl/
    pwd        
    echo

    echo "5. Return back to Wigglytuff on a relative path." 
    cd ../../jigglypuff/wigglytuff/
    pwd
    echo    

    cd ../../../
      
    echo "6. Delete pokemon Directory"
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
        rm -rvf pokemon
    fi     
}

# Write a script that checks whether a user exists in the system or not, and if they do not exist,
# creates a new user with a home directory.
function check_user() {
    read -p "Please Enter user name to search: " user_name  
    flag=0
    users_array=( $(awk -F':' '{ print $1}' /etc/passwd) )
    for user in ${users_array[@]}
    do
        if [ $user_name == $user ]; then
            echo "user was found"
            flag=1
            break
        fi        
    done
    if [ $flag -eq 0 ]; then
        echo "User was not found, creating new user!"
        sudo useradd -m $user_name                 
        id $user_name
    fi
    
    echo
    
    local choice="a"
    while [[ $choice =~ [^yYnN] ]]
    do
        read -p "Are you Sure you want to delete new user?: [Y/n] " choice
    done 
    if [[ $choice =~ [yY] ]]; then
      sudo userdel -r $user_name  
    fi                 
}

function main () {
    flag=0
    while [ $flag -eq 0 ]
        do
            echo "-------------MENU---------------------"
            echo "1. Linux Drills"
            echo "2. check user"
            echo "3. Quit"        
            echo -e "--------------------------------------\n"
            
            read -p "Please enter your choice: " user_choice           
            case $user_choice in
            1 ) 
                linux_drills 
                ;;
            2 ) 
                check_user 
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